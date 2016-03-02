<%-- 
    Document   : chngstat
    Created on : 31-Mar-2013, 21:02:55
    Author     : Ruchir
--%>
<%@ include file="header.jsp" %> 
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>updating status</title>
    </head>
    <body>
        <h1>Changing Status</h1>
        <p>T</p>
        <% 
            try
          {
                String cid=request.getParameter("compid");
            
            Connection con=null;
            Statement stmt2=null;
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega","root","prady");
            stmt2 = con.createStatement();
            String command = "UPDATE complain SET cstatus=? WHERE compid=?";
            PreparedStatement pstmt=con.prepareStatement(command);
            pstmt.setString(1,"InProcess");
            pstmt.setString(2,cid);
            int i = pstmt.executeUpdate();
            if(i==1)
            {
                out.println("Database Updated for Complain number:"+cid);
                out.println("Click");
                out.println("<a href='managerhome.jsp'>Here</a>");
                out.println("to Continue");
            }
            }catch(Exception e){out.println("Exception in chngstat.jsp"+e.getLocalizedMessage());}
        %>
    </body>
</html>
