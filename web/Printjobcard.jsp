<%-- 
    Document   : Printjobcard
    Created on : Mar 24, 2013, 6:15:20 PM
    Author     : SAI
--%>

<%
       try {
        String jobcardno=request.getParameter("jobcardno3");
           // jobcardno="abcd";
        out.println(jobcardno);
             java.sql.Connection con1;
             Class.forName("com.mysql.jdbc.Driver");
             con1 = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega", "root", "prady");
             
   java.sql.PreparedStatement ps=con1.prepareStatement("select * from Labour where adharno=?");       
           ps.setString(1,jobcardno);
java.sql.ResultSet rs1=ps.executeQuery();
           int adhar=rs1.getInt(1);
           System.out.println(jobcardno);
                     }
       catch(Exception e)
                             {
       out.println(e);
       
                    }
%>

