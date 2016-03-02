<%-- 
    Document   : sancnew1
    Created on : 01-Apr-2013, 23:03:27
    Author     : Ruchir
--%>
<%@ include file="header.jsp" %> 
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="appten">
        <h1>Tender Details</h1>
        <p>Tender request for the site are: </p>
         <table border="1">
             <tr><td>Select</td>
            <td><b><u>Applicant Name</u></b></td>
            <td><b><u>Tender Number</u></b></td>
            <td><b><u>Workers Required</u></b></td>
            <td><b><u>Days Of Work</u></b></td>
            </tr>
        <%String sid = request.getParameter("sid");%>
         <%
         int i=0;   
         Connection con=null;
            Statement stmt=null;
            ResultSet rst=null;
            String url = "jdbc:mysql://localhost:3306/mnrega?user=root&password=prady";
        String driver = "com.mysql.jdbc.Driver";
        
        Class.forName(driver);
            
               con = DriverManager.getConnection(url);
                stmt=con.createStatement();
        String sql="select * from tendertable where Sid='"+sid+"'";
        rst=stmt.executeQuery(sql);
        while(rst.next())
        {
            
        
        
        %>
       <tr>
           <td><input type="radio" name="radio" value=<%= rst.getString("tno") %> /></td>>
                <td><%= rst.getString("appname") %></td>
                <td><%= rst.getString("tno") %></td>
                <td><%= rst.getInt("wr") %></td>
                <td><%= rst.getInt("dow") %></td>
                </tr>
    <%i++;
        }%>
        <input type="submit" value="submit" name="submit" />
        </form>
    </body>
</html>
