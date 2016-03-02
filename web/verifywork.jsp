<%-- 
    Document   : verifywork
    Created on : 06-Apr-2013, 12:10:16
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
        <h1>City Wise Complete Site Report</h1>
        <form action="verwrk">
        <a href="Surveyorview.jsp">Go back</a>
        <%
            try{
                String state=request.getParameter("state");
            
          
            Statement stmt;
             Connection conn = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega","root", "prady");
                stmt=conn.createStatement();
                String sql="Select SiteId from site where status='Complete' AND paid='no'";
                ResultSet rst = stmt.executeQuery(sql);
                if(rst.wasNull())
                {
                    %>
                    <p>No labours registered !!!</p>
                    <%
                    out.println("<a href='Surveyorverify.jsp'>Click Here to go back</a>");
                }
                while(rst.next()){
        %>
        <select name="city">
            <option><%=rst.getString(1)%></option>
            
        </select>
        <%}}catch(Exception e){out.println("Exception in verifylabour"+e.getLocalizedMessage());}%>
        <input type="submit" value="SUBMIT" />
        </form>
    </body>
</html>
