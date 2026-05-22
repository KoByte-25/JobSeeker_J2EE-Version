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

@WebServlet("/deleteapply")
public class DeleteApplyServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		
		int applyId = Integer.parseInt(req.getParameter("applyId"));
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Connection conn;

		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker", "root", "root");
			
			String deleteQuery = "delete from apply where Apply_Id=?";
			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setInt(1, applyId);
			ps.executeUpdate();
			req.getRequestDispatcher("profile.jsp").include(req, resp);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
