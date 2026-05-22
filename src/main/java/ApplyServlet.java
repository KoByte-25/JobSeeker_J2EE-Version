import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;
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
import javax.servlet.http.HttpSession;

@WebServlet("/apply")
public class ApplyServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		int fromAge=0;
		int toAge=0;
		int cusId = 0;
		String email = "";
		String name = "";
		String position = "";
		String fullname = "";
		String dob = "";
		String nrc = "";
		String phno = "";
		String cus_email = "";
		String username = "";
		String subject = "သင်တင်ထားသော လုပ်ငန်းနေရာအတွက် အလုပ်လျှောက်ထားသူရှိကြောင်း အသိပေးခြင်း";
		String body = "";
		
		String cusUserName = (String) session.getAttribute("cusUserName");
		if(cusUserName!=null)
		{
			int job_Id = Integer.parseInt(req.getParameter("job_Id"));
			String exp = req.getParameter("experience");
			if(exp==null)
			{
				exp = "မရှိပါ";
			}
			
			int age=0;
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			Connection conn;
			RequestDispatcher rd;
			try {
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
				
				String selectQuery = "select * from customer where cusUserName=?";
				
				PreparedStatement ps = conn.prepareStatement(selectQuery);
				ps.setString(1, cusUserName);
				ResultSet rs = ps.executeQuery();
				if(rs.next())
				{
					cusId=rs.getInt(1);
					
					//for age calculation
					String date = rs.getString("dob");
					LocalDate birthdate = LocalDate.parse(date);
					LocalDate today = LocalDate.now();
					Period p = Period.between(birthdate, today);
					age = p.getYears();
					
				}
				else
				{
					cusId=0;
				}
				
				
				
				selectQuery = "select * from jobs where job_id=?";
				ps = conn.prepareStatement(selectQuery);
				ps.setInt(1, job_Id);
				rs = ps.executeQuery();
				
				if(rs.next())
				{
					fromAge = rs.getInt(14);
					toAge =rs.getInt(15);
				}
				
				else
				{
					fromAge =0;
					toAge =0;
				}
				
				
				if(age>=fromAge && age<=toAge)
				{
					String insertQuery = "insert into apply(Cus_Id, Job_Id, experience) values (?, ?, ?)";
					
					ps = conn.prepareStatement(insertQuery);
					ps.setInt(1, cusId);
					ps.setInt(2, job_Id);
					ps.setString(3, exp);
	
					ps.executeUpdate();
					
					String emailSelect = "select company_account.email as email, jobs.company_name as name, jobs.position as position, company_account.com_user_name as username from company_account, jobs where company_account.com_acc_id=jobs.com_acc_id and jobs.job_id=" + job_Id;
					Statement emailSt = conn.createStatement();
					ResultSet emailRS = emailSt.executeQuery(emailSelect);
					if(emailRS.next()) 
					{
						email = emailRS.getString("email");
						name = emailRS.getString("name");
						position = emailRS.getString("position");	
						username = emailRS.getString("username");
					}
					else {}
					
					String cusBrief = "select fullname, dob, nrc, phoneno, email from customer where cus_id=" + cusId;
					Statement cusSt = conn.createStatement();
					ResultSet cusRS = cusSt.executeQuery(cusBrief);
					if(cusRS.next()) 
					{
						fullname = cusRS.getString("fullname");
						dob = cusRS.getString("dob");
						nrc = cusRS.getString("nrc");
						phno = cusRS.getString("phoneno");
						cus_email = cusRS.getString("email");												
					}
					else {}					
				
					body = "<h3>Dear " + username + ", </h3><br>"
							+ "<h3> သင်တင်ထားသော &quot;" + name + "&quot; ရှိ &quot;" + position + "&quot; ရာထူးနေရာတွင် လာရောက်လျှောက်ထားသူ ရှိကြောင်း အသိပေးအပ်ပါသည်။ <h3>"
							+ "<table>"
							+ "<tr> <th colspan='2' align='center'> လျှောက်ထားသူ၏ ကိုယ်ရေး အကျဥ်း </th> </tr>" 
							+ "<tr height='40'>"
							+ 	"<td width='200'> နာမည် အပြည့်အစုံ </td>" 
							+ 	"<td> " + fullname + "</td>" 
							+ "</tr>"
							+ "<tr height='40'>"
							+ 	"<td> မွေးသက္ကရာဇ် </td>" 
							+ 	"<td> " + dob + "</td>" 
							+ "</tr>"
							+ "<tr height='40'>"
							+ 	"<td> မှတ်ပုံတင် နံပါတ် </td>" 
							+ 	"<td> " + nrc + "</td>" 
							+ "</tr>"
							+ "<tr height='40'>"
							+ 	"<td> ဖုန်းနံပါတ် </td>" 
							+ 	"<td> " + phno + "</td>" 
							+ "</tr>"
							+ "<tr height='40'>"
							+ 	"<td> အီးမေး </td>" 
							+ 	"<td> " + cus_email + "</td>" 
							+ "</tr>"
							+ "</table>" 
							+ "<h3> အသေးစိတ်ကို Website ထဲတွင် ဝင်ရောက် ကြည့်ရှုနိုင်ပါသည်။ </h3> <br><br> Regards, <br> &copy; JobSeeker";//နောက်ကျရင် Local Server ထောင်ပြီး website link ထည့်ပေးမယ်
					
					EmailUtil.sendHtmlEmail(email, subject, body);
					rd = req.getRequestDispatcher("applied.jsp");
					rd.forward(req, resp);
					
					
				}
				else if(age<fromAge)
				{
					rd = req.getRequestDispatcher("Job Details.jsp");
					rd.include(req, resp);
					
					PrintWriter out = resp.getWriter();
					out.print("<script>"
							+ "document.getElementById('errorMessage').innerHTML='သင်၏ အသက်သည် သင်လျှောက်လိုသော အလုပ်၏ အသက်အကန့်အသတ် ကို မပြည့်မှီပါ။';"
							+ "</script>");
				}
				else if(age>toAge)
				{
					rd = req.getRequestDispatcher("Job Details.jsp");
					rd.include(req, resp);
					
					PrintWriter out = resp.getWriter();
					out.print("<script>"
							+ "document.getElementById('errorMessage').innerHTML='သင်၏ အသက်သည် သင်လျှောက်လိုသော အလုပ်၏ အသက်အကန့်အသတ် ကို ကျော်လွန်နေပါသည်။';"
							+ "</script>");
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


			
		}
		else
		{
			RequestDispatcher rd = req.getRequestDispatcher("customerLoginandRegister.jsp");
			rd.forward(req, resp);
		}
	}

}
