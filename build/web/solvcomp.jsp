<%-- 
    Document   : solvcomp
    Created on : 31-Mar-2013, 20:47:32
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
    <%
    String email=request.getParameter("email");
    String cname=request.getParameter("name");
    String cid=request.getParameter("compid");
    
    %>
    <body>
    <center>
        
       
        <h1>Enter the Message</h1>
        <form action="sendmail" method="post">
            <input type="hidden" name="email" value="<%=email%>" />
        <input type="hidden" name="name" value="<%=cname%>" />
        <input type="hidden" name="compid" value="<%=cid%>" />
            <input type="text" name="message" value="Message from our Manager: ." size="300" height="300" />
            <input type="submit" value="SUBMIT" name="Submit">
        </form>
    </center>
    </body>
    
</html>
