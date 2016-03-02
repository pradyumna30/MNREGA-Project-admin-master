<%-- 
    Document   : applyt
    Created on : 05-Mar-2013, 17:29:07
    Author     : Ruchir
--%>
<%@ include file="header.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apply For Tender</title>
    </head>
    <body>
        
        <p>Please Enter the Complete Details</p>
         <form method="post" action="tdrpro"> 
    <tr><td>
                        Site ID :
                    </td>
                    <td> <input type = "text" name ="txtid" size="25"> </td></tr>
   <tr><td>
                        Worker's Required :
                    </td>
                    <td> <input type = "text" name ="txtwr" size="25"> </td></tr>
   <tr><td>
                         Number Of days of Work :
                    </td>
                    <td> <input type = "text" name ="txtdow" size="25"> </td></tr>

   <p>Applicant Details</p>
 <tr><td>
                         Name of Applicant\Company :
                    </td>
                    <td> <input type = "text" name ="txtname" size="25"> </td></tr>
 
<tr><td>
                         Email Id  :
                    </td>
                    <td> <input type = "text" name ="txtmail" size="25"> </td></tr>
   <input type ="submit" value="SUBMIT"/><br><br>
     </form>
    </body>
</html>
