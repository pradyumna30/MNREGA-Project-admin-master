<%-- 
    Document   : Uploadimage
    Created on : Mar 23, 2013, 5:02:10 PM
    Author     : SAI
--%>
<%@ page import="java.sql.*" %> 
<%@ page import="org.apache.commons.fileupload.*"%> 
<%@ page import="org.apache.commons.io.output.*"%> 
<%@ page import="org.apache.commons.fileupload.servlet.*"%> 
<%@ page import="org.apache.commons.fileupload.disk.*"%> 
<%@ page import="java.io.*"%> 
<%@ page import="java.util.*"%> 
<%@ include file="header.jsp" %> 
<%  
    //String jobcardno=request.getParameter("jobcard");
    //out.println(jobcardno);
  Connection con;
    String adhar=(String)session.getAttribute("adhar");
   //out.println(adhar);
    Connection conn;
   Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega","root", "prady"); 

   
     
   byte[] b=null; 
   try{ 
        java.sql.PreparedStatement p1=conn.prepareStatement("select max(Imageid) from image");
              java.sql.ResultSet r=p1.executeQuery();
              r.next();
              int imageno = r.getInt(1);
  
                 //String sqlImageInsertDatabase="insert into Image Image=?"); 
                    PreparedStatement psImageInsertDatabase;
                   psImageInsertDatabase=conn.prepareStatement("insert into image values(?,?,?)"); 
        
      DiskFileItemFactory factory = new DiskFileItemFactory(); 

      ServletFileUpload sfu = new ServletFileUpload(factory); 
      List items = sfu.parseRequest(request); 

      Iterator iter = items.iterator(); 
       
      while (iter.hasNext()) { 
         FileItem item = (FileItem) iter.next(); 
         if (!item.isFormField()) { 
              b = item.get(); 
          } 
      }  
      
      imageno++;
      psImageInsertDatabase.setString(1,adhar); 
      psImageInsertDatabase.setBytes(2,b);
      psImageInsertDatabase.setInt(3,imageno);
      //
      psImageInsertDatabase.executeUpdate(); 
   } 
   catch(Exception e) 
   { 
     out.println(e); 
     //response.sendRedirect("Upload.jsp"); 
   } 

%> 




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p align="center">Image Uploaded Successfully </p>
        <a href="operator.jsp" align="center"> Back to home </a>
    </body>
</html>
