import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalTime;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/interview")
public class interviewServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int job_id = Integer.parseInt(req.getParameter("job_id"));
		int cus_id = Integer.parseInt(req.getParameter("cus_id"));
		String startDate = req.getParameter("startDate");
		String timeStr= req.getParameter("startTime");
		LocalTime startTime = null;
		if(timeStr != null && !timeStr.isEmpty()) {
			startTime = LocalTime.parse(timeStr); // "HH:mm"
		}
		
		String source = req.getParameter("source");
		String website = null;
		String refId = null;
		String location = null;
	    if ("online".equals(source)) {
	    	if(req.getParameter("website")==null)
	    	{
	    		website = null;
	    	}
	    	else
	    	{
		        website = req.getParameter("website");
	    	}
	    	
	    	if(req.getParameter("refId") == null)
	    	{
	    		refId = null;
	    	}
	    	else
	    	{
	    		refId = req.getParameter("refId");
	    	}
	    } 
	    
	    else if ("offline".equals(source)) {
	    	if(req.getParameter("location") == null)
	    	{
	    		location = null;
	    	}
	    	else 
	    	{
	    		location = req.getParameter("location");
	    	}
	    }
	    
	    String email = "";
	    String username = "";
	    String subject = "အလုပ်အင်တာဗျူး ခေါ်ထားကြောင်း အသိပေးအကြောင်းကြားခြင်း";
		String body = "";
		String name = "";
		String pos = "";
		String formattedTime = "";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Connection conn;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
			
			String insertQuery = "insert into interview value(?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(insertQuery);
			ps.setInt(1, job_id);
			ps.setInt(2, cus_id);
			ps.setString(3, startDate);
			ps.setTime(4, java.sql.Time.valueOf(startTime));
			ps.setString(5, location);
			ps.setString(6, website);
			ps.setString(7, refId);
			ps.executeUpdate();
						
			
			
			String emailSelect = "select email, cususername from customer where cus_id="+cus_id;
			Statement emailSt = conn.createStatement();
			ResultSet emailRS = emailSt.executeQuery(emailSelect);			
			if(emailRS.next()) 
			{
				email = emailRS.getString("email");	
				username = emailRS.getString("cususername");
			}
			else {}
			
			String jobSelect = "select company_name, position from jobs where job_id="+job_id;
			Statement jobST = conn.createStatement();
			ResultSet jobRS = jobST.executeQuery(jobSelect);			
			if(jobRS.next()) 
			{
				name = jobRS.getString("company_name");		
				pos = jobRS.getString("position");
			}
			else {}
			
			body = "<h3>Dear " + username + ",</h3><br>"
					+ "<h3> သင်လျှောက်ထားသော &quot;" + name + "&quot; ရှိ &quot;" + pos + "&quot; ရာထူးနေရာအတွက် အင်တာဗျူးခေါ်ထားကြောင်း အသိပေးအပ်ပါသည်။ <h3>"
					+ "<table>"
					+ "<tr> <th colspan='2' align='center'> အင်တာဗျူး အချက်အလက် အကျဥ်း </th> </tr>" 
					+ "<tr height='40'>"
					+ 	"<td width='200'> နေ့ရက် </td>" 
					+ 	"<td> " + startDate + "</td>" 
					+ "</tr>"
					+ "<tr height='40'>"
					+ 	"<td> အချိန် </td>" 
					+ 	"<td> " + timeStr + "</td>" 
					+ "</tr>";
			
			if(location == null)
			{
				body += "<tr height='40'>"
						+ 	"<td> " + website + "'s Link </td>" 
						+ 	"<td> " + refId + "</td>" 
						+ "</tr>"						
						+ "</table>" 
						+ "<h3> အသေးစိတ်ကို Website ထဲတွင် ဝင်ရောက် ကြည့်ရှုနိုင်ပါသည်။ </h3><br><br> Regards, <br> &copy; JobSeeker";//နောက်ကျရင် Local Server ထောင်ပြီး website link ထည့်ပေးမယ်
			}
			else
			{
				body += "<tr height='40'>"
						+ 	"<td> နေရာ </td>" 
						+ 	"<td> " + location + "</td>" 
						+ "</tr>"						
						+ "</table>" 
						+ "<h3> အသေးစိတ်ကို Website ထဲတွင် ဝင်ရောက် ကြည့်ရှုနိုင်ပါသည်။ </h3><br><br> Regards, <br> &copy; JobSeeker";//နောက်ကျရင် Local Server ထောင်ပြီး website link ထည့်ပေးမယ်
			}
					
			EmailUtil.sendHtmlEmail(email, subject, body);


			
			req.getRequestDispatcher("company home.jsp").include(req, resp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}



	}

}
