<%-- 
    Document   : csolved
    Created on : 01-Apr-2013, 08:43:26
    Author     : Ruchir
--%>
<%@ include file="header.jsp" %> 
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solved Complains</title>
    </head>
    <body>
      
        <center>
        <h1>Solved COMPLAINS</h1>
        <p>The list of solved Complains</p>
         
                <table border="1">
                <tr>
                <td><b><u>Complain Number</u></b></td>
                <td><b><u>Complain Status</u></b></td>
                
                
                </tr>
                <%try
                {

                Connection conn = null;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega","root", "prady");
                ResultSet rs = null;
                Statement st=null;
                st=conn.createStatement();
                rs = st.executeQuery("select * from complain where cstatus='solved'");
                int i=0; 
                while(rs.next())
            { %>
                <tr> 
                <td><%=rs.getString("compid") %></td>
                 <td><%= rs.getString("cstatus") %></td>
                 
                </tr>
            <% }
            }
            catch(SQLException e)
            { 
                out.println("Exception in csolved.jsp:"+e.getMessage()); 
            } %>
            
            
                </table>
            <a href="compheader.jsp">Go Back</a>
            <a href="managerhome.jsp">Home Page</a>
    </center>
    
    </body>
</html>
