import java.io.InputStream;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailUtil {

    private static final Properties emailProps = new Properties();
    private static boolean loaded = false;

    // Load email.properties once
    static {
        try (InputStream is = EmailUtil.class
                .getClassLoader()
                .getResourceAsStream("email.properties")) {

            if (is == null) {
                throw new RuntimeException("email.properties not found in classpath");
            }

            emailProps.load(is);
            loaded = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Prevent object creation
    private EmailUtil() {}

    /**
     * Send plain text email
     */
    public static void sendTextEmail(String to, String subject, String body)
            throws MessagingException {

        send(to, subject, body, false);
    }

    /**
     * Send HTML email
     */
    public static void sendHtmlEmail(String to, String subject, String htmlBody)
            throws MessagingException {

        send(to, subject, htmlBody, true);
    }

    /**
     * Core send method
     */
    private static void send(String to, String subject, String body, boolean isHtml)
            throws MessagingException {

        if (!loaded) {
            throw new IllegalStateException("Email properties not loaded");
        }

        final String fromEmail = emailProps.getProperty("email.from");
        final String username  = emailProps.getProperty("email.username");
        final String password  = emailProps.getProperty("email.password");

        Properties props = new Properties();
        props.put("mail.smtp.auth", emailProps.getProperty("email.auth"));
        props.put("mail.smtp.starttls.enable", emailProps.getProperty("email.starttls"));
        props.put("mail.smtp.host", emailProps.getProperty("email.host"));
        props.put("mail.smtp.port", emailProps.getProperty("email.port"));

        Session session = Session.getInstance(props,
            new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });
        
        session.setDebug(Boolean.parseBoolean(emailProps.getProperty("email.debug")));

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(fromEmail));
        message.setRecipients(
                Message.RecipientType.TO,
                InternetAddress.parse(to)
        );
        message.setSubject(subject);

        if (isHtml) {
            message.setContent(body, "text/html; charset=UTF-8");
        } else {
            message.setText(body);
        }

        Transport.send(message);
    }
}