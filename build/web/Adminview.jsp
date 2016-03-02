<%-- 
    Document   : Adminview
    Created on : 22-Mar-2013, 22:39:28
    Author     : Ruchir
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <%@ include file="header.jsp" %> 
        <link href="NREGA_style.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Enter Details</h1>
        <form name="form1" action="Workerdetails.jsp">
            <input type="text" name="jobcardno" value="" />
            <input type="submit" value="Submit" name="Submit" />
        </form>
    </body>
</html>
