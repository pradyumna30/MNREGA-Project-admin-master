<%-- 
    Document   : uprj
    Created on : 04-Apr-2013, 21:58:50
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
         <h1>Upcoming Project Details</h1>
    <center>
        <form action="uprj1.jsp" method="post">
         <td  width="15%" valign="top">
      		<!--States-->
        		<table  width="100%"  border=2  cellspacing="1"  >
         
           
       Arunachal Pradesh: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Arunachal Pradesh" /></tr>
        Assam: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Assam" /></tr>
        Bihar: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Bihar" /></tr><br>
        Chhattisgarh: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="CHHATTISGARH" /></tr>
       Gujarat: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Gujarat" /></tr>
        Haryana: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Haryana" /></tr><br>
        Himachal Pradesh: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Himachal Pradesh" /></tr>
        Jammu and Kashmir: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Jammu and Kashmir" /></tr>
        Jharkhand: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Jharkhand" /></tr><br>
        Karnataka: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Karnataka" /></tr>
        Kerela: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Kerela" /></tr>
        Madhya Pradesh: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Madhya Pradesh" /></tr><br>
        Maharashtra: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="MAHARASHTRA" /></tr>
        Manipur: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Manipur" /></tr>
        Meghalaya: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Meghalaya" /></tr><br>
        Mizoram: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Mizoram" /></tr>
        Nagaland:<tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Nagaland" /></tr>
        Orissa: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Orissa" /></tr><br>
        Punjab: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Punjab" /></tr>
        Rajasthan: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Rajasthan" /></tr>
        Sikkim: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Sikkim" /></tr><br>
        Tamil Nadu: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Tamil Nadu" /></tr>
        Tripura: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Tripura" /></tr>
        Uttar Pradesh: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Uttar Pradesh" /></tr><br>
        Uttarakhand: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="Uttrrakhand" /></tr>
       West Bengal: <tr  bgcolor="#FFEADF" > <input type="radio" name="state" value="West Bengal" /></tr>

                        </table>
                <input type="submit" value="submit" />
        </form>
    </center>
    </body>
</html>
