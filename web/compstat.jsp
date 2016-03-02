<%-- 
    Document   : compstat
    Created on : 31-Mar-2013, 19:46:20
    Author     : Ruchir
--%>
<%@ include file="header.jsp" %> 
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>compstat</title>
    </head>
    <body>
    <center>
        <h1>COMPLAINS</h1>
        <p>Select the Complain you want to view</p>
            <form name=myname method=post action="viewcomp.jsp">
                <table border="1">
                <tr>
                <td><b><u>Complain Number</u></b></td>
                <td><b><u>Complain Status</u></b></td>
                <td><b><u>Select</u></b></td>
                
                </tr>
                <%try
                {

                Connection conn = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega","root", "prady");
                ResultSet rs = null;
                Statement st=null;
                st=conn.createStatement();
                rs = st.executeQuery("select * from complain");
                int i=0; 
                while(rs.next())
            { %>
                <tr> 
                <td><%=rs.getString("compid") %></td>
                 <td><%= rs.getString("cstatus") %></td>
                 <td><input type="radio" name="Comp" value="<%=rs.getString(1)%>"/></td>
                </tr>
            <% }
            }
            catch(SQLException e)
            { 
                out.println("Exception in compstat.jsp:"+e.getMessage()); 
            } %>
            
            <input type="submit"value="submit"name="submit"/>
                </table>
            </form>
    </center>
    </body>
</html>
