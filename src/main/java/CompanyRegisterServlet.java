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

@WebServlet("/companyRegister")
public class CompanyRegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String username = req.getParameter("username").trim();
		String pwd = req.getParameter("pwd");
		String phNo = req.getParameter("phNo");
		String email = req.getParameter("email");

		
		Connection conn;
		RequestDispatcher rd;
		HttpSession session;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
			
			String selectQuery="select * from company_account where Com_User_Name=?";
			
			PreparedStatement ps = conn.prepareStatement(selectQuery);
			ps.setString(1, username);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				rd = req.getRequestDispatcher("comLoginandRegister.jsp"); //user name တူနေပါသည်ဆိုပြီး ပေါ်အောင်လုပ်ရန်
				rd.include(req, resp);
				
				PrintWriter out = resp.getWriter();
				out.print("<script>"
						+ "document.getElementById('registerfailmessage').innerHTML='အသုံးပြုသူအမည်သည် ရှိနေပြီးသားဖြစ်ပါသည်';"
						+ "</script>");
			}
			
			else
			{
				String insertQuery = "insert into company_account(Com_User_Name, Com_Password, phNo, email) values (?, ?, ?, ?)";
				
				ps = conn.prepareStatement(insertQuery);
				ps.setString(1, username);
				ps.setString(2, pwd);
				ps.setString(3, phNo);
				ps.setString(4, email);
				ps.executeUpdate();
				
				session = req.getSession();
				session.setAttribute("Company User Name", username);
				rd = req.getRequestDispatcher("company home.jsp");
				rd.forward(req, resp);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
