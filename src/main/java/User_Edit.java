import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.time.*;

@WebServlet("/edit")
@MultipartConfig(maxFileSize=16177215)
public class User_Edit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("name");
		//String dob = req.getParameter("dob");
		//String nrc = req.getParameter("nrc");
		String phNo = req.getParameter("phNo");
		String email = req.getParameter("email");
		String education = req.getParameter("education");
		String computer = req.getParameter("computer");
		int salary = Integer.parseInt(req.getParameter("salary"));
		String prevJobs = req.getParameter("prevJobs");
		int id = Integer.parseInt(req.getParameter("id"));
		Part part = req.getPart("profileImage");
		
		
				
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		Connection conn;

		if(part!=null && part.getSize() > 0)
		{
			InputStream is = part.getInputStream();
			try {
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
				
				String updateQuery = "update customer set FullName=?, phoneNo=?, email=?, education=?, computer=?, salary=?, prevJobs=?, image=?, reported=null where Cus_Id=?";
				
				PreparedStatement ps = conn.prepareStatement(updateQuery);
				ps.setString(1, name);
				//ps.setString(2, dob);
				//ps.setString(2, nrc);
				ps.setString(2, phNo);
				ps.setString(3, email);
				ps.setString(4, education);
				ps.setString(5, computer);
				ps.setInt(6, salary);
				ps.setString(7, prevJobs);
				ps.setBlob(8, is);
				ps.setInt(9, id);
				ps.executeUpdate();
				
				req.getRequestDispatcher("profile.jsp").include(req, resp);
	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			try {
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
				String selectQuery = "select * from customer where cus_id=?";
				PreparedStatement ps = conn.prepareStatement(selectQuery);
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					byte[] imageData = rs.getBytes(13);
					
					String updateQuery = "update customer set FullName=?, phoneNo=?, email=?, education=?, computer=?, salary=?, prevJobs=?, image=?, reported=null where Cus_Id=?";
					
					ps = conn.prepareStatement(updateQuery);
					ps.setString(1, name);
					//ps.setString(2, dob);
					//ps.setString(3, nrc);
					ps.setString(2, phNo);
					ps.setString(3, email);
					ps.setString(4, education);
					ps.setString(5, computer);
					ps.setInt(6, salary);
					ps.setString(7, prevJobs);
					ps.setBytes(8, imageData);
					ps.setInt(9, id);
					ps.executeUpdate();
					
					req.getRequestDispatcher("profile.jsp").include(req, resp);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}

	}

}
