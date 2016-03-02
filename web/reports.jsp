<%-- 
    Document   : reports
    Created on : 29-Mar-2013, 09:49:35
    Author     : Ruchir
--%>
<%@ include file="header.jsp" %> 
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reports !!</title>
    </head>
    <body>
         <h1>REPORTS</h1>
         <%
       try{
           String id =(String)session.getAttribute("theName");
       //out.println("In try !!!");
        Connection con=null;
        Statement stmt=null;
        ResultSet rst1=null;
            String url = "jdbc:mysql://localhost:3306/mnrega?user=root&password=prady";
        String driver = "com.mysql.jdbc.Driver";
        
        Class.forName(driver);
        con = DriverManager.getConnection(url);
        stmt=con.createStatement();
            String type="";
        String sql="select type from login where Uname='"+id+"'";
        //out.println("executing");
        rst1= stmt.executeQuery(sql);
       // out.println("Executed");
        while(rst1.next())
        {
            type = rst1.getString(1);
        }
        %>
        <form action="rdemand" >
        
        
       
            <p>To view all demands: </p>
            <input type="submit" value="DEMANDS">
        </form>
        <br>
        
        <form action="r100days" >
            <p>To view 100 days Exhausted list</p>
            <input type="submit" value="List">
        </form><br>
        
        <form action="rcomp" >
            <p>To view Reports of Complain</p>
            <input type="submit" value="Complain Report">
        </form>
        <br>
        
         <p>Vacancies Available at Sites</p>
         <form action="rvac" >
            <input type="submit" value="Vacancy">
        </form>
         <br>
           <p>Work Status of Different Sites</p>
         <form action="rstat" >
            <input type="submit" value="Work Status">
        </form>
           <br>
            <p>To check Un-fullfilled Demands of work</p>
            
        <form action="runf" >
            <input type="submit" value="Click Here">
        </form>
            <br>
         <p>To check Employments offered to worker</p>
          
        <form action="reoff.jsp" >
            <input type="submit" value="Click Here">
        </form><br>
        <%
        if(type.equalsIgnoreCase("Manager"))
        {
            %><a href="managerhome.jsp">HOME</a><%
        }
               else if(type.equalsIgnoreCase("Administrator"))
         {
                   %><a href="adminhome.jsp">HOME</a><%
         }
               }catch(Exception e){out.println(e);}
        %>
        
    </body>
</html>
