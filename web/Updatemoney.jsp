<%-- 
    Document   : Updatemoney
    Created on : Mar 31, 2013, 2:59:36 PM
    Author     : SAI
--%>
<%
    try {
        String jobcardno[] = request.getParameterValues("jobcardno");
        String money[] = request.getParameterValues("money");
        int j = 0;



        //out.println(money[2]);
        //java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.PreparedStatement ps1;
        //con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega", "root", "prady");

        for (int i = 0; i < jobcardno.length; i++) {

            java.sql.Connection con;
            con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega", "root", "prady");
    //        out.println(jobcardno[i]);
            ps1 = con.prepareStatement("update workerdetails1 set moneyforsite=? where jobcardno=?");
            ps1.setInt(1, Integer.parseInt(money[i]));
            ps1.setString(2, jobcardno[i]);
            j = ps1.executeUpdate();
            ps1 = con.prepareStatement("update workerdetails2 set Totalmoney=Totalmoney+? where jobcardno=?");
ps1.setInt(1, Integer.parseInt(money[i]));
            ps1.setString(2, jobcardno[i]);           

                       j = ps1.executeUpdate();
            //   i++;
        }
    } catch (Exception e) {

        out.println(e);
    }
%>     
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %> 
<html>
    <head><%@ include file="logout.jsp" %> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
         <h1 align="center"> <a href="Accountantview.jsp"> Back </h1>
    </body>
</html>
