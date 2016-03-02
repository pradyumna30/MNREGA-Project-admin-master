<%-- 
    Document   : Admineditdata
    Created on : Mar 22, 2013, 11:41:48 PM
    Author     : SAI
--%>
<%@ include file="header.jsp" %> 
<%
try {
java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega", "root", "prady");
             
           java.sql.PreparedStatement ps1=con.prepareStatement("update labour set Adharno=? ,lname=?, ldob=?, lgender=?, lcity=?, dapplied=?, vcheck=? where Jobcardno=? ");
           ps1.setInt(1,Integer.parseInt(request.getParameter("adarno")));           
           ps1.setString(2,request.getParameter("lname"));
           ps1.setString(3,request.getParameter("ldob"));
           ps1.setString(4,request.getParameter("lgender"));
           ps1.setString(5,request.getParameter("lcity"));
           ps1.setString(6,request.getParameter("dapplied"));
           ps1.setString(7,request.getParameter("validity"));
           ps1.setString(8,request.getParameter("jobcard"));
           int i=ps1.executeUpdate();
           if(i>0)
                             {
           
                                response.sendRedirect("Dataupdated.jsp");
                                }
                  }
catch(Exception e)
{

out.println(e);
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
        <h1>Hello World!</h1>
    </body>
</html>
