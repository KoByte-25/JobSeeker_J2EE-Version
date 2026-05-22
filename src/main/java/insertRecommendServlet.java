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

@WebServlet("/addRecommend")
public class insertRecommendServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String cName = req.getParameter("cName");
		String add = req.getParameter("add");
		String lin = req.getParameter("lin");
		int id = Integer.parseInt(req.getParameter("id"));
		
//		String comname = req.getParameter("comname");
//		int caid = Integer.parseInt(req.getParameter("caid"));
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			Connection conn;
			
  			try {
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
				
				String insertQuery = "insert into recommend(className, location, fblink, job_id) values(?, ?, ?, ?)";
				
				PreparedStatement ps = conn.prepareStatement(insertQuery);
				ps.setString(1, cName);
				ps.setString(2, add);
				ps.setString(3, lin);
				ps.setInt(4, id);
				ps.executeUpdate();
				
				req.getRequestDispatcher("viewjobs.jsp").include(req, resp);
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


	}

}
