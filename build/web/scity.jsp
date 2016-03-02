<%-- 
    Document   : scity
    Created on : 29-Mar-2013, 09:16:44
    Author     : Ruchir
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <%@ include file="searchheader.jsp" %>
        <p>Searching by CITY</p>
        <%String city = request.getParameter("city"); %>   
        <form name=myname method=post action="delete.jsp">
        <table border="1">
            <tr><td></td>
            <td><b><u>Job Card Number</u></b></td>
            <td><b><u>Date of Demand</u></b></td>
            <td><b><u>City</u></b></td>
            </tr>
            <%try
            {

                Connection conn = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega","root", "prady");
                ResultSet rs = null;
                Statement st=null;
                st=conn.createStatement();
                rs = st.executeQuery("select * from demand where city='"+city+"'");
                int i=0; 
                while(rs.next())
                { %>
                <tr><td><input type="checkbox" name="check<%=i%>" value=<%= rs.getString("Jobcardno") %>></td>
                <td><%= rs.getString("Jobcardno") %></td>
                <td><%= rs.getString("Dateofd") %></td>
                <td><%= rs.getString("city") %></td>
                </tr><%
                i++;
                }
    }catch(SQLException e){ System.out.println(e.getMessage()); } %>
    </table>
    
    <input type="submit" value="Delete Selected">
    </form>
    <a href="citywise.jsp">Go Back</a>
 <a href="adminhome.jsp">HOME</a>
    </center>
    </body>
</html>
