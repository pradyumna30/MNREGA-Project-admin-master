<%-- 
    Document   : delete
    Created on : 29-Mar-2013, 08:53:29
    Author     : Ruchir
--%>
<%@ include file="header.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deleting</title>
    </head>
    <body>
        


<%String id[]= new String[10];
for(int i=0;i<10;i++){
id[i]=request.getParameter("check"+i);
//out.println(id[i]);
}
%>
<%try{
if(id[0]==null)
{
    out.println("NO Demands were selected !!!");
}
else
       {
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega","root", "prady");
ResultSet rs = null;
Statement st=null;
st=conn.createStatement();
for(int a=0;a<10;a++)
{
   // out.println("In loop");
    if(id[a]==null)
    {
            break;
    }
st.executeUpdate("delete from demand where Jobcardno='"+id[a]+"'");
}
out.println("The Selected Demands were deleted");
}
}catch(SQLException e){ 
    System.out.println(e.getMessage()); 
    }
    
       
    %>   
    <a href="adminhome.jsp">HOME</a>
    </body>
</html>
