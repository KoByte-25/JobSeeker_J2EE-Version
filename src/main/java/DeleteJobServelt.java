import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/deleteJob")
public class DeleteJobServelt extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int job_Id = Integer.parseInt(req.getParameter("job_Id"));
		resp.setCharacterEncoding("utf-8");
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Connection conn;
		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker", "root", "root");
			
			String deleteQuery = "delete from jobs where Job_Id=?";
			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setInt(1, job_Id);
			ps.executeUpdate();
			
			HttpSession session = req.getSession();
			String comUserName = (String) session.getAttribute("Company User Name");
			if(comUserName!=null)
			{
				req.getRequestDispatcher("company home.jsp").include(req, resp);
			}
			else
			{
				req.getRequestDispatcher("companies.jsp").include(req, resp);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

}
