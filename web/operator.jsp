<%-- 
    Document   : operator
    Created on : Mar 3, 2013, 5:51:12 PM
    Author     : SAI
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ include file="header.jsp" %>
<!DOCTYPE html>


<html>
<head>
<title>First page</title>
 
   
        
        <%@ include file="logout.jsp" %>
</head>
    <body>
     
           <div align="right">ID:   <%=session.getAttribute("theName")%>
             
           </div>
    <div align="center">
      <table width="200" border="1">
        <tr>
          <th scope="row"><form name="form1" method="post" action="workalot.jsp">
            <p align="center">Demand Work
              <input type="submit" name="add" id="add" value="Submit ">
            </p>
            <p align="center">&nbsp;</p>
          </form></th>
        </tr>
        <tr>
          <th scope="row">    <form name="form1" method="post" action="allot1.jsp">
            <p align="center">Allocate work
              <input type="submit" name="add" id="add" value="Submit ">
            </p>
            <p>&nbsp;</p>
            </form> 
          </th>
        </tr>
        <tr>
          <th scope="row">    <form name="form1" method="post" action="addnew.jsp">
            <p>Add New Labourer
              <input type="submit" name="add" id="add" value="Submit ">
            </p>
            <p>&nbsp;</p>
            </form>
          </th>
        </tr>
  </table>
             
             
             
             
    </div>
    <form id="form1" name="form1" method="post" action="Workerdetails.jsp">
    <p align="center">
    <label>Enter Job Card Number To see The employment history
       <input type="text" name="jobcardno" id="jobcardno" />
       <input type="submit" name="Submit" id="Submit" value="Submit" />
    </label>
  </p>
</form>

    
        <form name="form3" method="post" action="Workerdetails.jsp">
      <p>&nbsp;</p>
      <p>&nbsp;</p>
    </form>
      
</body>
</html>
