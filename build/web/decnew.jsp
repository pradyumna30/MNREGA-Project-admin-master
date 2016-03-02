<%-- 
    Document   : decnew
    Created on : 02-Apr-2013, 00:01:12
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
        <h1>NEW PROJECT</h1>
    <center>
        <p>Enter the Details</p>
        <form action="newprj" method="post">
           Site-ID: <input type="text" name="sid" value="" />
            City: <input type="text" name="city" value="" />
            Location ID: <input type="text" name="locid" value="" />
           Starting Date: <input type="text" name="ldate" value="" />
            <input type="submit" value="Submit" name="Submit" />
        </form>
    </center>
    </body>
</html>
