import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		
		int id = Integer.parseInt(req.getParameter("cusid"));
		String cusName = req.getParameter("cusName");
		String email = "";
		String subject = "အကောင့်ဖျက်သိမ်းလိုက်ကြောင်း အသိပေး အကြောင်းကြားခြင်း";
		String body = "";
		
		String fullName = "";
		String dob = "";
		String NRC = "";
		String phoneNo = "";
		String education = "";
		String computer = "";
		int salary = 0;
		String prevJobs = "";
		int reportedCount = 0;
		String reportedSince = "";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Connection conn;
		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
			
			String emailSelect = "select * from customer where cus_id=?";
			PreparedStatement eps = conn.prepareStatement(emailSelect);
			eps.setInt(1, id);
			ResultSet ers = eps.executeQuery();
			while(ers.next())
			{
				email = ers.getString("email");
				fullName = ers.getString("FullName");
				dob = ers.getString("dob");
				NRC = ers.getString("NRC");
				phoneNo = ers.getString("phoneNo");
				education = ers.getString("education");
				computer = ers.getString("computer");
				prevJobs = ers.getString("prevJobs");
				salary = ers.getInt("salary");
				reportedCount = ers.getInt("reportedCount");
				reportedSince = ers.getString("reportedSince");
			}
			
			
			String deleteQuery = "delete from customer where cus_id=?";
			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setInt(1, id);
			ps.executeUpdate();
			
			String selectQuery = "select * from userdocumentation where cusUserName=?";
			ps = conn.prepareStatement(selectQuery);
			ps.setString(1, cusName);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				String filename=rs.getString(3);
				deleteQuery = "delete from userdocumentation where filename=?";
				ps = conn.prepareStatement(deleteQuery);
				ps.setString(1, filename);
				ps.executeUpdate();
				File f= new File(filename);           //file to be delete  
				f.delete();
			}
			
			body = "<h3>Dear " + cusName + ", </h3><br>JobSeeker website ရှိ သင်၏ အကောင့်အချက်အလက်များ သို့မဟုတ် ကိုယ်ရေးအချက်အလက်များ မူမမှန်၊ မှားယွင်း နေပါသည်ဟု တိုင်ကြားခံရမှုအပေါ် အချိန်ကြာမြင့်စွာ ကိုယ်ရေးအချက်အလက်များ ပြန်လည်ပြင်ဆင်ခြင်းမရှိသောကြောင့်  သို့မဟုတ် အကောင့်အချက်အလက်များ သို့မဟုတ် ကိုယ်ရေးအချက်အလက်များ မူမမှန်၊ မှားယွင်း နေပါသည်ဟု တိုင်ကြားခံရမှု များပြား လာသောကြောင့် သင်၏ အကောင့်ကို ဖျက်သိမ်းပြစ်ရန် JobSeeker Admin team မှ ဆုံးဖြတ်လိုက်ကြောင်း အသိပေး အကြောင်းကြားအပ်ပါတယ်။ "
					+ "<br><br> သင်ဖြည့်သွင်းထားခဲ့သော အကောင့်အချက်အလက်များ"
					+ "<table>"
					+ "<tr>"
					+ "<td> နာမည်အပြည့်အစုံ: </td><td>" + fullName + "</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td> မွေးသက္ကရာဇ်: </td><td>" + dob + "</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td> မှတ်ပုံတင်အမှတ်: </td><td>" + NRC + "</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td> ဖုန်းနံပါတ်: </td><td>" + phoneNo + "</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td> အီးမေးလ်: </td><td>" + email + "</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td> ပညာအရည်အချင်း: </td><td>" + education + "</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td> ကွန်ပျူတာတက်ကျွမ်းမှုအဆင့်: </td><td>" + computer + "</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td> မျှော်မှန်းလစာ: </td><td>" + salary + "</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td> အရင်တုန်းက လုပ်ဖူးသောအလုပ်များ: </td><td>" + prevJobs + "</td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td> တိုင်ကြားခံရသော အကြိမ်အရေအတွက်: </td><td>" + reportedCount + " ကြိမ် </td>"
					+ "</tr>"
					+ "<tr>"
					+ "<td colspan=2> သင်သည် " + reportedSince + "မှစ၍ တိုင်ကြားခံထားရတာ ဖြစ်ပြီး၊ တိုင်ကြားခံထားရမှုမှာ ရက်ပေါင်း ";
			
			int days=0;
			LocalDate rpSinceLD = LocalDate.parse(reportedSince);
			LocalDate today = LocalDate.now();
			Period p = Period.between(rpSinceLD, today);
			days = p.getDays();
			days++;
			
			body  += days + " ရက် ရှိနေပြီ ဖြစ်ပါသည်။</td>"
					+ "</tr>"
					+ "</table>"
					+"<br><br> မှန်ကန်သော အချက်အလက်များဖြည့်သွင်းကာ အကောင့်ထပ်မံဖွင့်၍ အသုံးပြုရန် ဖိတ်ခေါ်ပါတယ်။ <br><br><br> JobSeeker Website ကို အသုံပြုခြင်းအတွက် ကျေးဇူးအထူးတင်ရှိပါသည်။";
			
			EmailUtil.sendHtmlEmail(email, subject, body);

			req.getRequestDispatcher("users.jsp").include(req, resp);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

}
