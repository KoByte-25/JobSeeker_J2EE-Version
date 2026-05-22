import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/acceptance")
public class AcceptanceServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int jid = Integer.parseInt(req.getParameter("job_id"));
		String flag = req.getParameter("flag");
		String comUserName = "";		
		String email = "";
		String jobInfo = "";
		String subject = "သင်တင်ပြထားသော လုပ်ငန်း အချက်အလက်များအား JobSeeker Admin Team မှ ကြည့်ရှူစစ်ဆေးပြီးကြောင်း အသိပေးအကြောင်းကြားခြင်း";
		String body = "";
		
		Connection conn;
		RequestDispatcher rd;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
			
			String updateQuery = "update jobs set acceptance=? where Job_Id=?";
			
			PreparedStatement ps = conn.prepareStatement(updateQuery);
			ps.setString(1, flag);
			ps.setInt(2, jid);
			ps.executeUpdate();
			
			String emailSelect = "select company_account.Com_User_Name as cUN, company_account.email as cEM from company_account, jobs where company_account.Com_Acc_Id=jobs.Com_Acc_Id and Job_Id=?";
			PreparedStatement emailPS = conn.prepareStatement(emailSelect);
			emailPS.setInt(1, jid);
			ResultSet emailRS = emailPS.executeQuery();
			while(emailRS.next())
			{
				comUserName = emailRS.getString("cUN");
				email = emailRS.getString("cEM");
			}
			
			String jobInfoSelect = "select * from jobs where Job_Id=?";
			PreparedStatement jobInfoPS = conn.prepareStatement(jobInfoSelect);
			jobInfoPS.setInt(1, jid);
			ResultSet jobInfoRS = jobInfoPS.executeQuery();
			while(jobInfoRS.next())
			{
				jobInfo += "<br>သင်တင်ပြထားသော လုပ်ငန်း အချက်အလက်"
						+"<table>"
						+"<tr>"
						+"<td> ကုမ္ပဏီ နာမည်/ဆိုင်နာမည်: </td><td>" + jobInfoRS.getString("Company_Name") + "</td>"
						+"</tr>"
						+"<tr>"
						+"<td> ရာထူးနေရာ: </td><td>" + jobInfoRS.getString("Position") + "</td>"
						+"</tr>"
						+"<tr>"
						+"<td> တည်နေရာ: </td><td>" + jobInfoRS.getString("Location") +"၊ " + jobInfoRS.getString("township") + "</td>"
						+"</tr>";
				
				if(jobInfoRS.getString("monthlyOrdaily").equals("နေ့စား"))
				{
					jobInfo += "<tr>"
							+"<td> နေ့စား လုပ်အားခ: </td><td>" + jobInfoRS.getString("salary") + "</td>"
							+"</tr>";
				}
				else
				{
					jobInfo += "<tr>"
							+"<td> အခြေခံ လစာ: </td><td>" + jobInfoRS.getString("salary") + "</td>"
							+"</tr>";
				}
						
				jobInfo += "<tr>"
						+"<td> အသက် အကန့်အသတ်: </td><td>" + jobInfoRS.getInt("fromAge") + "နှစ် မှ" + jobInfoRS.getInt("toAge") + "နှစ် အတွင်း" + "</td>"
						+"</tr>"
						+"<tr>"
						+"<td> အလုပ်လုပ်ကိုင်ရန် လိုအပ်ချက်များ: </td><td>" + jobInfoRS.getString("job_requirements") + "</td>"
						+"</tr>"
						+"<tr>"
						+"<td> အလုပ်ချိန်: </td><td>" + jobInfoRS.getString("working_hours") + "</td>"
						+"</tr>"
						+ "</table>";
			}
			
			body += "<h1> Dear " + comUserName +" </h1>";
			if(flag.equals("accepted"))
			{
				body += " သင်တင်ပြထားသော လုပ်ငန်း အချက်အလက်များအား JobSeeker Admin Team မှ ကြည့်ရှူစစ်ဆေးပြီး ဖြစ်ပါသည်။ယခုမှစ၍ သင့်လုပ်ငန်းအား JobSeeker website ထဲတွင် မြင်တွေ့နိုင်ပြီဖြစ်ပြီး သင့်လုပ်ငန်းအား လာရောက်လျှောက်ထားသူများ ရှိပါက အသေးစိတ် ကို website ထဲတွင် ဝင်ရောက်ကြည့်ရှူနိုင်ပါပြီ။"
						+ jobInfo + "<br><br>JobSeeker Website ကို အသုံပြုခြင်းအတွက် ကျေးဇူးအထူးတင်ရှိပါသည်။";
				
				EmailUtil.sendHtmlEmail(email, subject, body);
			}
			else
			{
				body += "သင်တင်ပြထားသော လုပ်ငန်း အချက်အလက်များအား JobSeeker Admin Team မှ ကြည့်ရှူစစ်ဆေးပြီး ဖြစ်ပါသည်။"
						+ "သင့်လုပ်ငန်းအချက်အလက် တစ်စုံတစ်ရာမှားယွင်းနေသည်ဟု JobSeeker Admin Team မှယူဆသောကြေင့် ပယ်ဖျက်လိုက်ပါသည်။"
						+ jobInfo + "<br>မှန်ကန်သော လုပ်ငန်းအချက်လက်များ ပြန်လည်ပြင်ဆင်ပြီး ထပ်မံတင်ပြပေးပါရန် မေတ္တာရပ်ခံအပ်သည်။<br><br>JobSeeker Website ကို အသုံပြုခြင်းအတွက် ကျေးဇူးအထူးတင်ရှိပါသည်။";
				
				EmailUtil.sendHtmlEmail(email, subject, body);

			}
			
			rd = req.getRequestDispatcher("requestedjobs.jsp");
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
