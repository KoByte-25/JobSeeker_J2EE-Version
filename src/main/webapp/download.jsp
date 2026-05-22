<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%    
String name=request.getParameter("name");
String fullfilename="C:\\Projects\\Job Seeker (J2EE version)\\Job_Seeker\\UserDocumentation\\"+name;


//	String selectquery="select * from userdocumentation where id="+tableid;
//	Connection conn;
	
		//conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/job_seeker","root","root");
		//Statement st=conn.createStatement();
	//	ResultSet rs=st.executeQuery(selectquery);
		



	
  String filename =name+"";   
 
  response.setContentType("APPLICATION/OCTET-STREAM");   
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
  
  java.io.FileInputStream fileInputStream=new java.io.FileInputStream(fullfilename);  
            
  int i;   
  while ((i=fileInputStream.read()) != -1) {  
    out.write(i);   
  }   
  fileInputStream.close();   
		
		
	
%>  
</body>
</html>