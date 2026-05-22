import javax.mail.MessagingException;

public class TestMail {

	public static void main(String[] args) throws MessagingException {
		EmailUtil.sendTextEmail("sniperagent.zay@gmail.com", "Web App မှ စမ်းသပ်ခြင်း", "နောက်ဆုံး စမ်းသပ်မှု");
		System.out.println("Sent");
	}

}