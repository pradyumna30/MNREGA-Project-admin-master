<%-- 
    Document   : viewdemand
    Created on : 29-Mar-2013, 08:35:56
    Author     : Ruchir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@ include file="searchheader.jsp" %>
        <h1>All Demands</h1>
        

        <form name=myname method=post action="delete.jsp">
        <table border="1">
            <tr><td>Select</td>
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
                rs = st.executeQuery("select * from demand");
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
    <p> Select the demand you want to delete </p>
    <input type="submit">
    </form>
    </body>
</html>
