import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.time.*;

@WebServlet("/cusRegister")
@MultipartConfig(maxFileSize=16177215)
public class CusRegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		//getting form data
		String name = req.getParameter("name").trim();
		String password = req.getParameter("password");
		String fullname = req.getParameter("fullname");
		String date = req.getParameter("date");
		String nrc = req.getParameter("NRC");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String education = req.getParameter("education");
		String computer = req.getParameter("computer");
		int salary = Integer.parseInt(req.getParameter("salary"));
		String prevJobs = req.getParameter("prevJobs");
		Part part = req.getPart("profileImage");
		InputStream is = part.getInputStream();
		//end
		
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Connection conn;
		RequestDispatcher rd;
		HttpSession session;
		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
			
			String selectQuery="select * from customer where cusUserName=?";
			
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				rd = req.getRequestDispatcher("customerLoginandRegister.jsp");
				rd.include(req, resp);
				
				PrintWriter out = resp.getWriter();
				out.print("<script>"
						+ "document.getElementById('registerfailmessage').innerHTML='အသုံးပြုသူအမည်သည် ရှိနေပြီးသားဖြစ်ပါသည်';"
						+ "</script>");
			}
			
			else
			{
				String insertQuery = "insert into customer(cusUserName, cusPassword, FullName, dob, NRC, phoneNo, email, education, computer, salary, prevJobs, image) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				
				ps = conn.prepareStatement(insertQuery);
				ps.setString(1, name);
				ps.setString(2, password);
				ps.setString(3, fullname);
				ps.setString(4, date);
				ps.setString(5, nrc);
				ps.setString(6, phone);
				ps.setString(7, email);
				ps.setString(8, education);
				ps.setString(9, computer);
				ps.setInt(10, salary);
				ps.setString(11, prevJobs);
				ps.setBlob(12, is);
				ps.executeUpdate();
				
				session = req.getSession();
				session.setAttribute("cusUserName", name);
				rd = req.getRequestDispatcher("index.jsp");
				rd.forward(req, resp);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
