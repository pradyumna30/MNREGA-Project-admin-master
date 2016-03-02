<%-- 
    Document   : newjsp
    Created on : 24-Mar-2013, 16:06:57
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
        <h1>Hello World!</h1>
       <% Connection con=null;
            Statement stmt=null;
            ResultSet rst1=null;
            String url = "jdbc:mysql://localhost:3306/mnrega?user=root&password=prady";
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
        </form>  
    </body>
</html>
