<%-- 
    Document   : Adminedit
    Created on : Mar 22, 2013, 11:27:48 PM
    Author     : SAI
--%>
<%@ include file="header.jsp" %> 
<%
String s=request.getParameter("jobcardno1");                
//out.println(s);
java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega", "root", "prady");
             
            java.sql.PreparedStatement ps1=con.prepareStatement("Select * from labour where jobcardno=?");
           
            ps1.setString(1,s);
            java.sql.ResultSet rs=ps1.executeQuery();
            
           // out.println("rs.getString(1)");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <form name="form1" method="post" action="Admineditdata.jsp">
      <p>&nbsp;</p>
      <h1 align="center">Details Of Labour</h1>
      <p> 
        
     <% while(rs.next())
                 { %>
            <div align="center">
            <table width="261" border="1">
              <tr>
                <td width="109"><p>Adhar Number</p></td>
                <td width="136"><input type="text" name="adarno" id="adarno" value="<%=rs.getInt(1)%>"></td>
              </tr>
              <tr>
                <td>Labour Name</td>
                <td><input type="text" name="lname" id="lname" value="<%=rs.getString(2)%>"></td>
              </tr>
              <tr>
                <td>Labour DOB</td>
                <td><input type="text" name="ldob" id="ldob"value="<%=rs.getString(3)%>"></td>
              </tr>
              <tr>
                <td>Labour Gender</td>
                <td><input type="text" name="lgender" id="lgender" value="<%=rs.getString(4)%>"></td>
              </tr>
              <tr>
                <td>Labour City</td>
                <td><input type="text" name="lcity" id="lcity" value="<%=rs.getString(5)%>"></td>
              </tr>
              <tr>
                <td>Date Applied</td>
                <td><input type="text" name="dapplied" id="dapplied" value="<%=rs.getString(6)%>"></td>
              </tr>
              <tr>
                <td>Job Card no</td>
                <td><input type="text" name="jobcard" id="jobcard" value="<%=rs.getString(7)%>"></td>
              </tr>
              <tr>
                <td>Validity Status</td>
                <td><input type="text" name="validity" id="validity" value="<%=rs.getString(8)%>"></td>
              </tr>
            </table>
          </div>
              <% } %>
        
         <p align="center">
        <input type="submit" name="Submit" id="Submit" value="Submit">
      </p>
    </form>

    </body>
</html>
