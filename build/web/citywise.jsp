<%-- 
    Document   : citywise
    Created on : 29-Mar-2013, 09:12:32
    Author     : Ruchir
--%>

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
          <%@ include file="searchheader.jsp" %>
          <form action="scity.jsp" method="post">
          <p>Enter the Name of city:</p>
          <input type="text" name="city">
          <input type="submit" value="Search">
           <a href="adminhome.jsp">HOME</a>
    </center>
    </form>
    </body>
</html>
