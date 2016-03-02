<%-- 
    Document   : adminhome
    Created on : 29-Mar-2013, 08:33:50
    Author     : Ruchir
--%>
<  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
           <%@ include file="header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <%@ include file="logout.jsp" %>
        <title>Admin Home</title>
    </head>
    <body>
        <h1 align="center">ADMINISTRATOR Home Page</h1>
         ID: <%=session.getAttribute("theName")%>
    <center>
        <a href="searchheader.jsp">View Demands</a>
        <a href="reports.jsp">View Reports</a>
        <a href="sancnew.jsp">Sanction Tenders</a>
        <a href="decnew.jsp">Declare new Projects</a>
        <a href="deccmp.jsp">Declare Complete Projects</a>
        <form id="form1" name="form1" method="post" action="Workerdetails.jsp">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>
    <label>
       Enter Job Card Number For Employement History    
       <input type="text" name="jobcardno" id="jobcardno" />
       <input type="submit" name="Submit" id="Submit" value="Submit" />
    </label>
  </p>
</form>
<form id="form2" name="form2" method="post" action="Adminedit.jsp">
  <p>&nbsp;</p>
  <p>Enter Job Card Number That To Be Edited 
    <label>
      <input type="text" name="jobcardno1" id="jobcardno1" />
    </label>
    <input type="submit" name="submit" id="submit" value="Submit" />
  </p>
</form>
<form id="form3" name="form3" method="post" action="jobcard.jsp">
  <p>&nbsp;</p>
  <p>Enter Job Card Number 
    <label>
        printing &nbsp;<input type="text" name="jobcardno3" id="jobcardno3" />
    </label>
    <input type="submit" name="submit" id="submit" value="Submit" />
  </p>
</form>

 
        </center>
    </body>
</html>
