import java.io.IOException;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reportUser")
public class ReportUserServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		
		int cusid = Integer.parseInt(req.getParameter("cusid"));
		LocalDate today = LocalDate.now();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Connection conn;

		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker", "root", "root");
			
			String updateQuery = "update customer set reported=1, reportedSince=?, reportedCount=reportedCount + 1 where Cus_Id=?";
			PreparedStatement ps = conn.prepareStatement(updateQuery);
			ps.setDate(1, java.sql.Date.valueOf(today));
			ps.setInt(2, cusid);			
			ps.executeUpdate();
			req.getRequestDispatcher("company home.jsp").include(req, resp);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
