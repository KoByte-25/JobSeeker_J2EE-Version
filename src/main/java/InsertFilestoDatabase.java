
import java.io.IOException;
import java.io.*;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.sql.*;  
import java.util.Iterator;  
import java.util.List;  
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

import org.apache.commons.fileupload.FileItem;  
import org.apache.commons.fileupload.FileItemFactory;  
import org.apache.commons.fileupload.disk.DiskFileItemFactory;  
import org.apache.commons.fileupload.servlet.ServletFileUpload;  
   
/** 
 * @author Vishal.Gilbile 
 */  
@WebServlet("/insertfile")
@MultipartConfig(location="/tmp", fileSizeThreshold=1024*1024,
maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
public class InsertFilestoDatabase extends HttpServlet {  
	
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 File file ;

		 request.setCharacterEncoding("UTF-8");
		 response.setCharacterEncoding("UTF-8");
		 HttpSession session=request.getSession();
		 String cusUserName = (String) session.getAttribute("cusUserName");
		   int maxFileSize = 5000 * 1024;
		   int maxMemSize = 5000 * 1024;
		   String filePath = "C:\\Projects\\Job Seeker (J2EE version)\\Job_Seeker\\UserDocumentation\\";
		   String fileName="";
		   String contentType = request.getContentType();
		   if ((contentType.indexOf("multipart/form-data") >= 0)) {

		      DiskFileItemFactory factory = new DiskFileItemFactory();
		      factory.setSizeThreshold(maxMemSize);
		      factory.setRepository(new File("c:\\temp"));
		      ServletFileUpload upload = new ServletFileUpload(factory);
		      upload.setSizeMax( maxFileSize );
		      try{ 
		         List fileItems = upload.parseRequest(request);
		         Iterator i = fileItems.iterator();
		       //  out.println("<html>");
		       //  out.println("<body>");
		         while ( i.hasNext () ) 
		         {
		            FileItem fi = (FileItem)i.next();
		            if ( !fi.isFormField () )  {
		                String fieldName = fi.getFieldName();
		                fileName = fi.getName();
		                boolean isInMemory = fi.isInMemory();
		                long sizeInBytes = fi.getSize();
		                file = new File( filePath + fileName) ;
		                fi.write( file ) ;
		                System.out.println("Uploaded Filename: " + filePath + fileName);
		            }
		         }
		      //   out.println("</body>");
		      //   out.println("</html>");
		      }catch(Exception ex) {
		         System.out.println(ex);
		      }
		   }else{
		      //out.println("<html>");
		     // out.println("<body>");
		     // out.println("<p>No file uploaded</p>"); 
		     // out.println("</body>");
		     // out.println("</html>");
		   }
		 
		 
		 
		 int i=0;
		  InputStream inputStream = null ;//input stream of uploaded file
		//  String files[]=request.getParameterValues("files");
		  Connection conn = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String filepath="C:\\Projects\\Job Seeker (J2EE version)\\Job_Seeker\\UserDocumentation\\"+fileName;
			File pdfFile=new File(filepath);
			
			//  File pdfFile = new File(filePath + fileName+".pdf");
			  byte[] pdfData = new byte[(int) pdfFile.length()];
			  DataInputStream dis = new DataInputStream(new FileInputStream(pdfFile));
			  dis.readFully(pdfData);  // read from file into byte[] array
			  dis.close();

			  String myConnectionString =
			          "jdbc:mysql://localhost:3306/j2ee_job_seeker";
			  try {
			  conn = DriverManager.getConnection(myConnectionString, "root", "root");
			  PreparedStatement ps = conn.prepareStatement(
			          "INSERT INTO userdocumentation(cusUserName,filename) VALUES (?,?)");
			ps.setString(1, cusUserName);
			 ps.setString(2,filepath);
			  ps.executeUpdate(); } catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		  
			  
			//  request.setAttribute("id", id);
			    request.getRequestDispatcher("userEdit.jsp").include(request, response);
			 
	 }
   
   
}