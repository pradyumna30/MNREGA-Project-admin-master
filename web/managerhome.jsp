<%-- 
    Document   : managerhome
    Created on : 31-Mar-2013, 19:42:57
    Author     : Ruchir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Home</title>
    </head>
    <body>
    <center>
        <h1>MANAGER HOME PAGE</h1>
        ID: <%=session.getAttribute("theName")%>
        <a href="compheader.jsp">View Complains</a>
        <a href="effcheck.jsp">Check Efficiency</a>
        <a href="reports.jsp">View Reports</a>
    <%@ include file="logout.jsp" %>
    </center>
    </body>
</html>
