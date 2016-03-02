<%-- 
    Document   : cstatus
    Created on : 29-Mar-2013, 16:13:50
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
        <h1>Complain Status</h1>
        <P>Please Enter the Details: </P>
        <form action="cstat">
            CID: <input type="text" name="cid" value="" />
            <input type="submit" value="SUBMIT" />
        </form>
    </body>
</html>
