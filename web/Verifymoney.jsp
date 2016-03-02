<%-- 
    Document   : Verifymoney
    Created on : Mar 29, 2013, 11:14:04 AM
    Author     : SAI
--%>
<%@ include file="header.jsp" %> 
<%

 String s = request.getParameter("jobcardno2");                   //String e=    (String)session.getAttribute("mail");
    //out.println(s);
    if(s=="")
               {
                response.sendRedirect("Surveyorview.jsp");
    
                }
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con;
    con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega", "root", "prady");

    java.sql.PreparedStatement ps = con.prepareStatement("select * from Workerdetails1 where jobcardno= ? and Verifymoneyearned='no' ");
    ps.setString(1, s);

    java.sql.ResultSet r1 = ps.executeQuery();
    if (r1.next() == false) {
        out.println("Sorry Data Not Available");
        //out.println("<a href="Surveyorview.jsp"> back</a>");
    }
    r1.beforeFirst();

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table width="559" border="1" align="center">
  <thead><tr>
    <td width="106" height="75">Site Worked At</td>
    <td width="138">Money For The Site</td>
    <td width="98"> Daysof Work</td>
    <td width="99">Work From </td>
    <td width="96">Work Upto</td>
    <td width="96">Verification</td>
    <td width="100">Check </td>
      </tr></thead>
  <% 
  while( r1.next())
      { %> 
  <tr>
    <td><%=r1.getString(2)%></td>
    <td><%=r1.getInt(3)%></td>
    <td><%=r1.getInt(4)%></td>
    <td><%=r1.getString(5)%></td>
    <td><%=r1.getString(6)%></td>
    <td><%=r1.getString(7)%></td>
  <td><form action="Verified.jsp" name=form2 method="post"> 
      <p>Verify if money is earned </p>
<input type="checkbox" name="verify2" value="verified" id="CheckboxGroup1_0" />
                                Verify 
                                <input type="hidden" value="<%=r1.getString(2)%>" name="siteno">
                                </br>
                                <input type="hidden" value="<%=r1.getString(1)%>" name="jobcardno">
                                <input type="submit" value="update " >
   </form></td>  
  </tr> 
  
  <%}%>
  </table>
  
      
    </body>
</html>
