import java.io.IOException;
import java.io.InputStream;
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

@WebServlet("/postingJobs")
@MultipartConfig(maxFileSize=16177215)
public class PostingJobsServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		String comUserName = (String) session.getAttribute("Company User Name");
		
		String comName = req.getParameter("comName");
		String comType = req.getParameter("companyType");
		String pos = req.getParameter("pos");
		String local = req.getParameter("local");
		String town = req.getParameter("town");
		String monthlyOrdaily = req.getParameter("monthlyOrdaily");
		int salary = Integer.parseInt(req.getParameter("salary"));
		String job_requirements = req.getParameter("job requirements");
		String working_hours = req.getParameter("working hours");
		int fromAge = Integer.parseInt(req.getParameter("fromAge"));
		int toAge = Integer.parseInt(req.getParameter("toAge"));

		
		
		InputStream inputStream = null;
		Part part = req.getPart("photo");
		if(part!=null){
		   System.out.println(part.getName());
		            System.out.println(part.getSize());
		            System.out.println(part.getContentType());
		            inputStream = part.getInputStream();
		  }
		
		int Com_Acc_Id = 0;
		
		Connection conn = null;
		RequestDispatcher rd;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker", "root", "root");
			String selectQuery = "select * from company_account where Com_User_Name=?";
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			ps.setString(1, comUserName);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				Com_Acc_Id = rs.getInt(1);
			}
			else
			{
				Com_Acc_Id = 0;
			}
			
			String insertQuery="insert into jobs(Company_Name, Company_type, Position, Location, township, monthlyOrdaily, salary, job_requirements, working_hours, Photo, Com_Acc_Id, fromage, toage) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			
			ps = conn.prepareStatement(insertQuery);
			
			ps.setString(1, comName);
			ps.setString(2, comType);
			ps.setString(3, pos);
			ps.setString(4, local);
			ps.setString(5, town);
			ps.setString(6, monthlyOrdaily);
			ps.setInt(7, salary);
			ps.setString(8, job_requirements);
			ps.setString(9, working_hours);
			ps.setBlob(10, inputStream);
			ps.setInt(11, Com_Acc_Id);
			ps.setInt(12, fromAge);
			ps.setInt(13, toAge);

			
			ps.executeUpdate();
		
			rd = req.getRequestDispatcher("company home.jsp");
			rd.forward(req, resp);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
