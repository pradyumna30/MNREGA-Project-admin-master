<%-- 
    Document   : Adminview
    Created on : Mar 22, 2013, 11:17:17 PM
    Author     : SAI
--%>
<%@ include file="tempelete.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="NREGA_style.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form id="form1" name="form1" method="post" action="Workerdetails.jsp">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>
    <label>
       Enter Job Card Number
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
      printing<input type="text" name="jobcardno3" id="jobcardno3" />
    </label>
    <input type="submit" name="submit" id="submit" value="Submit" />
  </p>
</form>


    </body>
</html>
