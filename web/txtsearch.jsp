<%-- 
    Document   : txtsearch
    Created on : 29-Mar-2013, 09:22:50
    Author     : Ruchir
--%>
<%@ include file="header.jsp" %> 
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
          <form action="stxt.jsp" method="post">
          <p>Enter the Job Card Number of Worker:</p> 
          <input type="text" name="id">
          <input type="submit" value="submit">
           <a href="adminhome.jsp">HOME</a>
    </center>
    </body>
</html>
