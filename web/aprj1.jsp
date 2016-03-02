<%-- 
    Document   : aprj1
    Created on : 02-Apr-2013, 09:58:09
    Author     : Ruchir
--%>
<%@ include file="header.jsp" %> 
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>City Wise Announced Project</h1>
        <form action="listprj">
        <a href="aprj.jsp">Go back</a>
        <%
            String state=request.getParameter("state");
          
            Statement stmt;
             Connection conn = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega","root", "prady");
                stmt=conn.createStatement();
                String sql="Select cname from citydet where state='"+state+"'";
                ResultSet rst = stmt.executeQuery(sql);
                if(rst.wasNull())
                {
                    %>
                    <p>No cities registered in the state</p>
                    <%
                    out.println("<a href='index.jsp'>Click Here to go back</a>");
                }
                       %>
                       <select name="city">
<% while(rst.next()){ %>

                       
            <option><%=rst.getString(1)%></option>
            
        
        <%}%>
        </select>
        <input type="submit" value="SUBMIT" />
        </form>
    </body>
</html>
