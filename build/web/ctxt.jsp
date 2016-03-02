<%-- 
    Document   : ctxt
    Created on : 01-Apr-2013, 09:01:12
    Author     : Ruchir
--%>
<%@ include file="header.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search by Comp-ID</title>
    </head>
    <body>
        
    <center>
        <h1>SEARCH</h1>
     
        <%@ include file="compheader.jsp" %><br><br><br>
        <form method="post" action="viewcomp.jsp">
        <p>Searching by Complain ID</p>
        <tr><td>
                        Enter Complain ID :
                    </td>
                    <td> <input type = "text" name ="Comp" size="25"> </td></tr><br><br>
        
                   <input type ="submit"
                                    value="SEARCH"/><br><br>
     <a href="managerhome.jsp">Home Page</a>
        </table>
        </form>      
     </center>
    </body>
</html>
