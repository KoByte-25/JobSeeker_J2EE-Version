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
import java.io.File;
@WebServlet("/deleteFile")
public class DeletePDFFileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		int id=Integer.parseInt(req.getParameter("id"));
		String fullfilename="C:\\Projects\\Job Seeker (J2EE version)\\Job_Seeker\\UserDocumentation\\"+name;
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
			
			String deleteQuery = "delete from userdocumentation where filename=?";
			PreparedStatement ps = conn.prepareStatement(deleteQuery);
			ps.setString(1, fullfilename);
			ps.executeUpdate();
			File f= new File(fullfilename);           //file to be delete  
			f.delete();
			//req.setAttribute("id", id);
			req.getRequestDispatcher("userEdit.jsp").forward(req, resp);
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

}
