<%-- 
    Document   : reff
    Created on : 01-Apr-2013, 09:59:02
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
    <center>
        <h1>Efficiency Reports</h1>
        <form action="rsub" method="post">
       <% Connection con=null;
            Statement stmt=null;
            ResultSet rst1=null;
            String url = "jdbc:mysql://localhost:3306/mnrega?user=root&password=prady";
        String driver = "com.mysql.jdbc.Driver";
       // stmt=con.createStatement();
        Class.forName(driver);
        con = DriverManager.getConnection(url);
         stmt=con.createStatement();
            
        String sql="select Uname from login where Type='Administrator'";
        rst1= stmt.executeQuery(sql);
        while(rst1.next())
        {
        %>
        <select name="id">
            <option><%=rst1.getString(1)%></option>
        </select>
        <%}%>
        <input type="Submit" value="submit"/>
        </form>
    </center>
    
    </body>
</html>
