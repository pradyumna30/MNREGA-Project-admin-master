<%-- 
    Document   : deccmp
    Created on : 02-Apr-2013, 00:10:10
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
        <h1>Declare Complete Projects</h1>
        <form action="decmp" method="post">
            <center>
                Enter the Site ID: <input type="text" name="sid" value="" />
                
                <input type="submit" value="Submit" />
            </center>
            
        </form>
    </body>
</html>
