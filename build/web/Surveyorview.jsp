<%-- 
    Document   : Surveyorview
    Created on : Mar 27, 2013, 2:52:47 PM
    Author     : SAI
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
 <div align="center">
    <%@ include file="logout.jsp" %>
        
 </div>

    <form id="form1" name="form1" method="post" action="Surveyorverify.jsp"> 
  <p align="center">
    <label>
      Enter Job Card Number For Worker Verification </br><input type="text" name="jobcardno" id="jobcardno" />
    </label>
  </p>
  <p align="center">
    <input type="submit" name="Submit" id="Submit" value="Submit" />
  </p>
</form>
<form id="form2" name="form2" method="post" action="Verifymoney.jsp">
  <p align="center">Enter Job Card Number For Money Related Issues</p>
  <p align="center">
    <label>
      <input type="text" name="jobcardno2" id="jobcardno2" />
    </label>
  </p>
  <p align="center">
    <input type="submit" name="Submit2" id="Submit2" value="Submit" />
  </p>
  <a href="verifylabour.jsp"> view reports </a>
</form>

   <p> generate labour list </p> <br>
   <a href="verifylabour.jsp" >  for verification </a> <br>
   <a href="verifywork.jsp" >  for money issues </a>
   
   </body>

</html>
