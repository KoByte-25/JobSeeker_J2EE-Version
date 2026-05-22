import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/cusLogin")
public class CusLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("name");
		String pwd = req.getParameter("pwd");
		
		if(name.equals("Admin") && pwd.equals("admin"))
		{
			HttpSession session = req.getSession();
			session.setAttribute("AdminUserName", name);
			req.getRequestDispatcher("users.jsp").include(req, resp);
		}
		
		else
		{
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
				
				String selectQuery="select * from customer where cusUserName=? and cusPassword=?";
	
				PreparedStatement ps = conn.prepareStatement(selectQuery);
				ps.setString(1, name);
				ps.setString(2, pwd);
				ResultSet rs = ps.executeQuery();
				if(rs.next())
				{
					session = req.getSession();
					session.setAttribute("cusUserName", name);
					rd = req.getRequestDispatcher("index.jsp");
					rd.forward(req, resp);
				}
				
				else
				{
					rd = req.getRequestDispatcher("customerLoginandRegister.jsp");
					rd.include(req, resp);
					
					PrintWriter out = resp.getWriter();
					out.print("<script>"
							+ "document.getElementById('loginfailmessage').innerHTML='အသုံးပြုသူအမည် သို့မဟုတ် လျှို့ဝှက်နံပါတ်မှားယွင်းနေပါသည်';"
							+ "</script>");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
