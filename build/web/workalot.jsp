<%-- 
    Document   : workalot
    Created on : 05-Mar-2013, 17:05:08
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
        <h1>Work Allocate</h1>
        <P>Enter the Details of Worker here : </P>
       <form method="post" action="workserv"> 
    <tr><td>
                        Job Card Number :
                    </td>
                    <td> <input type = "text" name ="txtid" size="25"> </td></tr>
<input type ="submit"
                                    value="SUBMIT"/><br><br>
       </form>
   
</body>
</html>
