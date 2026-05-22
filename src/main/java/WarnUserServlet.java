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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/warnUser")
public class WarnUserServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int cusid = Integer.parseInt(req.getParameter("cusid"));
		String email="";
		String subject = "သတိပေးခြင်း";
		String body = "";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
                            
        try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
			
			String selectQuery = "select * from customer where Cus_Id=?";
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			ps.setInt(1, cusid);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				email = rs.getString("email");
				body = "<h3>Dear " + rs.getString("cusUserName") + ", </h3><br>သင်တင်ထားသော ကိုယ်ရေးအချက်အလက်များ မူမမှန်၊ မှားယွင်းနေကြောင်း တိုင်ကြားခံထားရပါသည်။"
						+ "<br><br> သင်ဖြည့်သွင်းထားခဲ့သော အကောင့်အချက်အလက်များ"
						+ "<table>"
						+ "<tr>"
						+ "<td> နာမည်အပြည့်အစုံ: </td><td>" + rs.getString("FullName") + "</td>"
						+ "</tr>"
						+ "<tr>"
						+ "<td> မွေးသက္ကရာဇ်: </td><td>" + rs.getString("dob") + "</td>"
						+ "</tr>"
						+ "<tr>"
						+ "<td> မှတ်ပုံတင်အမှတ်: </td><td>" + rs.getString("NRC") + "</td>"
						+ "</tr>"
						+ "<tr>"
						+ "<td> ဖုန်းနံပါတ်: </td><td>" + rs.getString("phoneNo") + "</td>"
						+ "</tr>"
						+ "<tr>"
						+ "<td> အီးမေးလ်: </td><td>" + rs.getString("email") + "</td>"
						+ "</tr>"
						+ "<tr>"
						+ "<td> ပညာအရည်အချင်း: </td><td>" + rs.getString("education") + "</td>"
						+ "</tr>"
						+ "<tr>"
						+ "<td> ကွန်ပျူတာတက်ကျွမ်းမှုအဆင့်: </td><td>" + rs.getString("computer") + "</td>"
						+ "</tr>"
						+ "<tr>"
						+ "<td> မျှော်မှန်းလစာ: </td><td>" + rs.getInt("salary") + "</td>"
						+ "</tr>"
						+ "<tr>"
						+ "<td> အရင်တုန်းက လုပ်ဖူးသောအလုပ်များ: </td><td>" + rs.getString("prevJobs") + "</td>"
						+ "</tr>"
						+ "<tr>"
						+ "<td> တိုင်ကြားခံရသော အကြိမ်အရေအတွက်: </td><td>" + rs.getString("reportedCount") + " ကြိမ် </td>"
						+ "</tr>"
						+ "<tr>"
						+ "<td colspan=2> သင်သည် " + rs.getString("reportedSince") + "မှစ၍ တိုင်ကြားခံထားရတာ ဖြစ်ပြီး၊ တိုင်ကြားခံထားရမှုမှာ ရက်ပေါင်း ";
						
				int days=0;
    			String rpSince = rs.getString("reportedSince");
				LocalDate rpSinceLD = LocalDate.parse(rpSince);
				LocalDate today = LocalDate.now();
				Period p = Period.between(rpSinceLD, today);
				days = p.getDays();
				days++;
				
				body += days + " ရက် ရှိနေပြီ ဖြစ်ပါသည်။</td>"
						+ "</tr>"
						+ "</table>"
						+"<br><br>မှန်ကန်သော ကိုယ်ရေးအချက်အလက်များ ပြန်လည်ပြင်ဆင်ပြီး တင်ပေးပါရန် အကြံပြုလိုပါတယ်။ မှန်ကန်သော ကိုယ်ရေးအချက်အလက်များအား အချိန်ကြာမြင့်စွာ ပြန်လည်ပြင်ဆင်ခြင်းမပြုပါက သို့မဟုတ် ကိုယ်ရေးအချက်အလက်များ မှားယွင်းသည်ဟု မကြာခဏ တိုင်ကြားခံရပါ JobSeeker Admin Team မှ သင့်၏ account ကိုဖျတ်သိမ်းနိုင်ကြောင်း သတိပေး အကြောင်းကြားအပ်ပါသည်။"
						+ "<br><br><br> JobSeeker Website ကို အသုံပြုခြင်းအတွက် ကျေးဇူးအထူးတင်ရှိပါသည်။";
				
			}
						
			EmailUtil.sendHtmlEmail(email, subject, body);
			RequestDispatcher rd = req.getRequestDispatcher("users.jsp");
			rd.include(req, resp);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

}
