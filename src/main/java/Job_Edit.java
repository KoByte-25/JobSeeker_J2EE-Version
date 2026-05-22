import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mysql.cj.xdevapi.Statement;

@WebServlet("/jobEdit")
@MultipartConfig(maxFileSize=16177215)
public class Job_Edit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String pos = req.getParameter("pos");
		String local = req.getParameter("local");
		String town = req.getParameter("town");
		int salary = Integer.parseInt(req.getParameter("salary"));
		String job_requirements = req.getParameter("job requirements");
		String working_hours = req.getParameter("working hours");
		int fromAge = Integer.parseInt(req.getParameter("fromAge"));
		int toAge = Integer.parseInt(req.getParameter("toAge"));
		int id = Integer.parseInt(req.getParameter("id"));
		Part part = req.getPart("photo");
		
		if(part!=null && part.getSize() > 0)
		{
			InputStream is = part.getInputStream();
			
			Connection conn;
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			try {
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
				String updateQuery = "update jobs set Position=?, Location=?, township=?, salary=?, job_requirements=?, working_hours=?, Photo=?, acceptance=null, fromage=?, toage=? where Job_Id=?";
				PreparedStatement ps = conn.prepareStatement(updateQuery);
				ps.setString(1, pos);
				ps.setString(2, local);
				ps.setString(3, town);
				ps.setInt(4, salary);
				ps.setString(5, job_requirements);
				ps.setString(6, working_hours);
				ps.setBlob(7, is);
				ps.setInt(8, fromAge);
				ps.setInt(9, toAge);
				ps.setInt(10, id);
				ps.executeUpdate();
				
				req.getRequestDispatcher("company home.jsp").include(req, resp);
	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			Connection conn;
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			try {
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
				String selectQuery = "select * from jobs where Job_Id=?";
				PreparedStatement ps = conn.prepareStatement(selectQuery);
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					byte[] imageData = rs.getBytes(11);		
					
					String updateQuery = "update jobs set Position=?, Location=?, township=?, salary=?, job_requirements=?, working_hours=?, Photo=?, acceptance=null, fromage=?, toage=? where Job_Id=?";
					ps = conn.prepareStatement(updateQuery);
					ps.setString(1, pos);
					ps.setString(2, local);
					ps.setString(3, town);
					ps.setInt(4, salary);
					ps.setString(5, job_requirements);
					ps.setString(6, working_hours);
					ps.setBytes(7, imageData);
					ps.setInt(8, fromAge);
					ps.setInt(9, toAge);
					ps.setInt(10, id);
					ps.executeUpdate();
					
					req.getRequestDispatcher("company home.jsp").include(req, resp);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}

	}

}
