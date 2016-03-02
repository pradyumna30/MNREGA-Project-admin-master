<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%> 
<%@ include file="header.jsp" %> 
<%    


String s="";
      //   byte[ ] imgData = null ;
        //    java.sql.Blob image = null;
            String jobcardno=request.getParameter("jobcardno");
           // jobcardno="abcd";
            //out.println(jobcardno);
             java.sql.Connection con;
             Class.forName("com.mysql.jdbc.Driver");
             con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega", "root", "prady");
             
           java.sql.PreparedStatement ps1=con.prepareStatement("Select * from workerdetails1 where Jobcardno=?");
           ps1.setString(1,jobcardno);
           java.sql.ResultSet rs1=ps1.executeQuery();
           //rs1.next();
            java.sql.PreparedStatement ps3=con.prepareStatement("Select * from labour where Jobcardno=?");
           ps3.setString(1,jobcardno);
            java.sql.ResultSet rs3=ps3.executeQuery();
            //out.println(rs1.getString(1));
          //int i=rs1
           while(rs3.next())
               
                             {
                                    int i=rs3.getInt(1);
                                    s=""+i;
                             
                                }
          java.sql.PreparedStatement ps2=con.prepareStatement("Select * from workerdetails2 Where Jobcardno=?");
          ps2.setString(1,jobcardno);
          java.sql.ResultSet rs2=ps2.executeQuery(); 
          
          //rs2.next();
      /*java.sql.Connection con1=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega","root","prady");   
            java.sql.Statement st=con1.createStatement();
    String strQuery = "select image from Image where Jobcardno="+"jobcardno";
    java.sql.ResultSet rs3 = st.executeQuery(strQuery);
                 
                 String imgLen="";
    out.println("h");
                 if(rs3.next()){
      imgLen = rs3.getString(1);
      out.println("h");
       }  
    //rs3 = ps3.executeQuery();
    if(rs3.next()){
      int len = imgLen.length();
      byte [] rb = new byte[len];
      java.io.InputStream readImg = rs3.getBinaryStream(1);
      int index=readImg.read(rb, 0, len);  
      st.close();
      response.reset();
      response.getOutputStream().write(rb,0,len); 
      response.getOutputStream().flush();        
    } 
       else{
       out.println("image not found ");
       } */
  
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <input type="hidden" name="adhar" value="<%=s%>">
        <a href="Displayimage.jsp">Show the Image Of Worker </a>
    <table width="559" border="1" align="center">
  <thead><tr>
    <td width="106" height="75">Site Worked At</td>
    <td width="138">Money For The Site</td>
    <td width="98"> Daysof Work</td>
    <td width="99">Work From </td>
    <td width="96">Work Upto</td>
      </tr></thead>
  <% while(rs1.next())
      { %> 
  <tr>
    <td><%=rs1.getString(2)%></td>
    <td><%=rs1.getInt(3)%></td>
    <td><%=rs1.getInt(4)%></td>
    <td><%=rs1.getString(5)%></td>
    <td><%=rs1.getString(6)%></td>
  </tr> 
  
  <%}%>



  

</table>
<p>&nbsp;</p>
<table width="359"  border="1" align="center">
  <tr>
    <td width="94">Number Of Days Worked</td>
    <td width="70">Total money</td>
    <td width="88">Number Of Demands</td>
    <td width="89">Number Of Demands Fulfilled</td>
  </tr>
  
<% while(rs2.next())
 { %>
<tr>
    <td><%=rs2.getString(2)%></td> <td><%=rs2.getInt(3)%></td><td><%=rs2.getInt(4)%></td><td> <%= rs2.getInt(5)%></td>
  </tr> <%} %>
</table> 
<a href="adminhome.jsp"> back </a>
    </body>
</html> 
