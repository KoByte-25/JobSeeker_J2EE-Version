<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Image</title>
</head>
<body>

 <%
  
  try {
  			Class.forName("com.mysql.jdbc.Driver");
  		} catch (ClassNotFoundException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
  		String selectquery="select * from userdocumentation";
  		Connection conn;
  		try {
  			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/j2ee_job_seeker","root","root");
  			Statement st=conn.createStatement();
  			ResultSet rs=st.executeQuery(selectquery);
  			while(rs.next()){
  				String str=rs.getString(3);
  				String[] user=str.split("\\\\");
  				int i=user.length;
  				String filename=user[i-1];
  				
  
     %>
 <a  href="download.jsp?id=<%=rs.getInt(1)%>" target="_blank"><%=filename%></a>
   <%

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			%>
</body>
</html>