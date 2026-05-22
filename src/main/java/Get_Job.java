import java.io.IOException;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getJob")
public class Get_Job extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("image/jpeg");
		int job_Id = Integer.parseInt(req.getParameter("job_Id"));
		
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
			  String selectQuery="SELECT * FROM jobs WHERE Job_Id=?";
			  
			  PreparedStatement ps = conn.prepareStatement(selectQuery);
			  
			  ps.setInt(1, job_Id);
			  
			  ResultSet rs = ps.executeQuery();
			  while(rs.next())
			  {
				  byte[] imageData = rs.getBytes(11);
				  OutputStream os = resp.getOutputStream();
		             os.write(imageData);
				  
			  }


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

}
