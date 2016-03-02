<%-- 
    Document   : complain
    Created on : 29-Mar-2013, 15:48:16
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
        <h1>COMPLAIN</h1>
        <form action="entercomp">
        
        <p>Please Enter the Following Details: </p>
        Name: <input type="text" value="" name="cname"/>
        Email ID:<input type="text" name="cemail" value="" />
        Complain: <input type="text" name="ctext" value="" size="100" />
        <input type="submit" value="SUBMIT"/>
        </form>   
        <a href="index.jsp">Go Back</a>
    </center>
    </body>
</html>
