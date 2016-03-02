<%-- 
    Document   : Accountantview
    Created on : Mar 31, 2013, 2:14:30 PM
    Author     : SAI
--%>
<%@ include file="header.jsp" %> 
<%@ include file="logout.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form id="form1" name="form1" method="post" action="Accountantmoney.jsp" >
  <div align="center">
  <p>Enter the Site Id to complete money issues.</p>
  <p>Site Id
    <label>
      <input type="text" name="Siteid" id="Siteid" />
    </label>
  </p>
  <p align="center">
    	   			
    	<input type="submit" name="Submit" id="Submit" value="Submit" align="center" />
  </p>
  </div>
</form>
 
    </body>
</html>
