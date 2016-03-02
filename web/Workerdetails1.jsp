<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%> 

<%@ include file="header.jsp" %> 

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
      </tr></thead>
  <%    
     
            String jobcardno=request.getParameter("jobcardno");
           // jobcardno="abcd";
            out.println(jobcardno);
             java.sql.Connection con;
             Class.forName("com.mysql.jdbc.Driver");
             con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega", "root", "prady");
             
           java.sql.PreparedStatement ps1=con.prepareStatement("Select * from workerdetails1 where Jobcardno=?");
           ps1.setString(1,jobcardno);
           java.sql.ResultSet rs1=ps1.executeQuery();
           //rs1.next();
           //out.println(rs1.getString(1));
          //int i=rs1
           %>
  <% while(rs1.next())
      { %> 
  <tr>
    <td><%=rs1.getInt(2)%></td>
    <td><%=rs1.getInt(3)%></td>
    <td><%=rs1.getInt(4)%></td>
    <td><%=rs1.getString(5)%></td>
    <td><%=rs1.getString(6)%></td>
  </tr> 
  <%}%>
  <%
          java.sql.PreparedStatement ps2=con.prepareStatement("Select * from workerdetails2 Where Jobcardno=?");
          ps1.setString(1,jobcardno);
          java.sql.ResultSet rs2=ps1.executeQuery(); 
          rs2.next();
                   
        %>   
           

  



  

</table>
<p>&nbsp;</p>
<table width="359"  border="1" align="center">
  <tr>
    <td width="94">Number Of Days Worked</td>
    <td width="70">Total money</td>
    <td width="88">Number Of Demands</td>
    <td width="89">Number Of Demands Fulfilled</td>
  </tr>
 <%  while(rs2.next()){%>
<tr>
    <td><%=rs2.getString(2)%></td> <td><%=rs2.getInt(3)%></td><td><%=rs2.getInt(4)%></td><td> <%= rs2.getInt(5)%></td>
  </tr>
  <%}%>
</table> 
    </body>
</html> 
