<%-- 
    Document   : Accountantmoney
    Created on : Mar 31, 2013, 2:43:00 PM
    Author     : SAI
--%>
<%@ include file="header.jsp" %> 
<%
    String siteid = request.getParameter("Siteid");
    // jobcardno="abcd";
    //out.println(siteid);
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega", "root", "prady");

    java.sql.PreparedStatement ps1 = con.prepareStatement("Select * from workerdetails1 where Siteworkedat=?");
    ps1.setString(1, siteid);
    java.sql.ResultSet r2 = ps1.executeQuery();

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
                <%@ include file="logout.jsp" %>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
   
        <a href="Displayimage.jsp">Show the Image Of Worker </a>
        <form action="Updatemoney.jsp" name="form1">
            <table width="559" border="1" align="center">
                <h2 align="center"> Update the Money Earned By Worker </h2>
                <thead><tr>

                        <td width="138">Job Card Number</td>
                        <td width="150" height="75">Site Worked At</td>
                        <td width="138">Money For The Site</td>
                        <td width="98"> Daysof Work</td>
                        <td width="99">Work From </td>
                        <td width="96">Work Upto</td>
                        <td width="96">Verification status</td>
                    </tr></thead>
                    <% while (r2.next()) {%> 
                <tr>
                    <td><%=r2.getString(1)%></td>
                    <td><%=r2.getString(2)%></td>
                    <td> <input type="text" name="money" value="<%=r2.getInt(3)%>" >
                    </td> 
                    <td><%=r2.getInt(4)%></td>
                    <td><%=r2.getString(5)%></td>
                    <td><%=r2.getString(6)%></td>
                    <td><%=r2.getString(7)%></td>
                </tr> 
                <p><input type="hidden" name="jobcardno" value="<%=r2.getString(1)%>"/></p>
                    <%}%>



                <div align="center"><input type="submit" value="update" align="center"> 
                    <a href="Accountantview.jsp"> back </a></div>

            </table>
        </form>
        <p>&nbsp;</p>

    </body>
</html> 