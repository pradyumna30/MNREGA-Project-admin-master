<%-- 
    Document   : distributework
    Created on : 05-Mar-2013, 17:28:32
    Author     : Ruchir
--%>
<%@ include file="header.jsp" %> 
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MNREGA: Distribute</title>
    </head>
    <body>
        <h1>Distributing Work</h1>
        <form method="post" action="distwork"> 
        <p> Enter the SITE-ID , of which the tenders you wanted to review: </p>
        <input type="text" name="txtsid" value="" />
        <input type="submit" value="Submit" />
    </body>
</html>
