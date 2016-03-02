<%-- 
    Document   : allot1
    Created on : 24-Mar-2013, 13:38:30
    Author     : Ruchir
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="allotserv" method ="post">
            Enter here Site number : <input type="text" name="combo1">
            <input type="submit" value="Submit" name="Submit" />
            <%-- <select name="combo1">
            <option>Select One</option>
            <%
            Connection con=null;
            Statement stmt=null;
            ResultSet rst1=null;
            String url = "jdbc:mysql://localhost:3306/mnrega?user=root&password=ruchir";
        String driver = "com.mysql.jdbc.Driver";
        
        Class.forName(driver);
        con = DriverManager.getConnection(url);
            
        String sql="select SiteId from site";
        rst1= stmt.executeQuery(sql);

        while(rst1.next())
        %>
            
        <option><%=rst1.next()%></option>
        </select>
        <%}%>
        <a href="ophome.jsp">HOME</a>
        <input type="submit" value="Submit" name="Submit" />
            --%>
        </form>  
    </body>
</html>
