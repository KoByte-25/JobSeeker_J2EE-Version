import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteCompany")
public class DeleteCompanyServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		
		int id = Integer.parseInt(req.getParameter("caid"));
		String comUserName = "";
		String phNo = "";
		String email = "";
		
		String subject = "အကောင့်ဖျက်သိမ်းလိုက်ကြောင်း အသိပေး အကြောင်းကြားခြင်း";
		String body = "";
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Connection conn;
		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
			
			String emailSelect = "select * from company_account where Com_Acc_Id=?";
			PreparedStatement emailSelectPS = conn.prepareStatement(emailSelect);
			emailSelectPS.setInt(1, id);
			ResultSet emailSelectRS = emailSelectPS.executeQuery();
			while(emailSelectRS.next())
			{
				comUserName = emailSelectRS.getString("Com_User_Name");
				phNo = emailSelectRS.getString("phNo");
				email = emailSelectRS.getString("email");			
			}
			
			String deleteQuery = "delete from company_account where Com_Acc_Id=?";
			
			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setInt(1, id);
			ps.executeUpdate();
			
			body = "<h1> Dear " + comUserName + "</h1>"
					+"သင်၏ ကုမ္ပဏီအကောင့် အချက်အလက်များ မူမမှန်၊ မှားယွင်း နေပါသည်ဟု JobSeeker Admin Team မှ ဆုံးဖြတ်လိုက်သောကြောင့် သင့်ရဲ့  ကုမ္ပဏီ Account ကို ဖျက်သိမ်းလိုက်ကြောင်း အသိပေး အကြောင်းကြားအပ်ပါတယ်။"
					+"<br> သင်၏ ကုမ္ပဏီအကောင့် အချက်အလက်များ"
					+ "<table>"
					+ "<tr>"
					+ "<td> ကုမ္ပဏီ ဖုန်းနံပါတ်: </td><td>" + phNo + "</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td> ကုမ္ပဏီ email: </td><td>" + email + "</td>"
					+ "</tr>"
					+ "</table>"
					+ "<br><br>မှန်ကန်သော အချက်အလက်များဖြည့်သွင်းကာ အကောင့်ထပ်မံဖွင့်၍ အသုံးပြုရန် ဖိတ်ခေါ်ပါတယ်။"
					+ "<br><br><br>JobSeeker Website ကို အသုံပြုခြင်းအတွက် ကျေးဇူးအထူးတင်ရှိပါသည်။";
			
			EmailUtil.sendHtmlEmail(email, subject, body);
			
			req.getRequestDispatcher("companies.jsp").include(req, resp);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

}
