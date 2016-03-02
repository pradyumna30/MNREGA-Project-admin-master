 <%-- 
    Document   : viewblog2
    Created on : Mar 14, 2013, 4:20:00 PM
    Author     : SAI
--%>
<%@ include file="header.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<% 
String s1="";      
String locid="";     
int  i;       
String locname="";
                    String image;
                    String s = request.getParameter("jobcardno3");                   //String e=    (String)session.getAttribute("mail");
                   
                    Class.forName("com.mysql.jdbc.Driver");
                     java.sql.Connection con;
                    con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega", "root", "prady");

                    java.sql.PreparedStatement ps = con.prepareStatement("select * from labour where jobcardno= ?");
                    ps.setString(1,s);
                    
                    java.sql.ResultSet r1 = ps.executeQuery();
                       
            //out.println("<html><body> <table border=0 align=center><thead>");
            //out.println(" <tr> <th>blog no</th> <th>problem</th><th>date</th> <th>user</th></thead>");
              //  while(rs.next()){
            
            //out.println(" <tr>                                       <td>"+rs.getInt(1) +"</td> <td>"+rs.getString(2) +"</td> <td>"+rs.getString(3) +"</td><td>"+rs.getInt(4) +"</td><td> </td></tr>");
                
            //out.println(" </table> </body></html>");
                    while(r1.next()) 
       {
         i =r1.getInt(1);
         out.println(i);
        s1=""+i;
        locid=r1.getString(9);
       
        out.println(locid);

       } 
             java.sql.PreparedStatement ps2 = con.prepareStatement("select * from citydet where locid= ?");
                    ps2.setString(1,locid);             
                     java.sql.ResultSet r2 = ps2.executeQuery();
                     while(r2.next())
                                                 {
                                                    
                                                    locname=r2.getString(2);
                                                  //  out.println(locname);
                                                }
       
                  image= "images/"+s1+".jpg";
           /* s1=String.valueOf(i);         
             out.println(s1);
           
                 

          
 */  r1.beforeFirst(); 
// out.println(image);    
     %>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>
	Job Card /<br>
           <img src="images/jobcardlogo.gif" />
</title></head>
<body>
    <form name="form1" method="post" action="jcr.aspx?reg_no=GO-01-004-006-001%2f1&amp;village_code=1001004006001&amp;fin_year=2013-2014&amp;Digest=4bvpKDTHY7Lr1V5uieZsbA" id="form1">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="x6OMeMGYJYaat02fsKd9LStLJMBuq7zk5xwB4+8lKmQMdtKzQ/500lksy3txu0SB3Za+xzfyXeMmQIzfYOsbWP1soAeR9bidTkLIrUMSlXo07quzuHRLXh6PnvkFb2jMa8RkUTemMxyLqDQrmWQGA9eXo2AiYrqlgcsZ+ELvwnKmskvX0Sry8K6Avbz7SCL4qGoy6s/aGCiXF9Z15/4rsFr+GIsDh4w0hQXvYP24uVtNh/XlDb9e7Pi1ygCQdQajalscO1XdI6/e9ELTE0vJxFB5mMPJidaq6cZe1jUAvTYdgA69RpOYp270ckUYP8HICab9zW3X5AFYPQK5p3BnxbHmaZtb0asbvkBCYkLjxXYWRPLeULoNj1tD4zbu87WEPcp44CVEfE+TXM5BEprPVUjx3GQiO7+oRWLpO1L8kqadPNjzIkbegLUzbweLph11cIMzB8B5F/zKbYwO32H/WvLcJEQN+JxdIW8oQkusT+HcyCHISLEu9BzOZ7f+fR5oOSkGgSB2HhVqRFec93xAVItauqDYikUTteQnCzY69XW7XyFvmXrtH9hWYXPo1SMT" />
</div>

<div>

	<input type="hidden" name="__VIEWSTATEENCRYPTED" id="__VIEWSTATEENCRYPTED" value="" />
</div>
     <center>
        <font color='#CC0000' size='4'><b>
            </b></font>
    </center>
    <br />
   <% while(r1.next() )
{ %> <table width="67%" bgcolor="#FEF3EB" cellpadding="0" cellspacing="0" align="center"
    style="border-style: solid; border-color: #660000; border-width: 3px">
    <tr>
    <td colspan="7" valign="top" bgcolor="#FF7FD4" align="center"><b><font color="#000000" size="2">Job card</font></b></td>
    </tr>
    <tr>
    <td colspan="7" valign="top" bgcolor="#FAEBD7" align="center"><b><font color="#076B05" size="1"><u>MAHATMA GANDHI NATIONAL RURAL EMPLOYMENT GUARANTEE ACT</u></font></b></td>
    </tr>
    <tr valign="top">/
        <td width="41%" valign="top"><font color="#CC0000" size="2">Job card No.</font></td> <td >:<%=r1.getString(7) %></td>
    </tr>
    <tr>
      <td valign="top"><font color="#CC0000" size="2">Adhar number.:</font></td>
    <td valign="top" colspan="2">:<%=r1.getInt(1) %></td><td width="2%"></td>
      <td valign="top" colspan="2">&nbsp;</td>
      <td width="27%" colspan="3" rowspan="7" valign="top"><font color="#CC0000" size="4"><img class="one" height="100" width="100" src="<%=image%>" /></font></td>
    </tr>
    <tr>
    <td valign="top"><p><font color="#CC0000" size="2">Date of birth</font></p></td>
    <td valign="top" colspan="2">:<%=r1.getString(3) %></td>
    </tr>    <tr>
    <td valign="top"><font color="#CC0000" size="2">Date of Registration:</font></td>
    <td valign="top" colspan="2">:<%=r1.getString(6) %>;</td>
    </tr>
    <tr>
    <td valign="top"><font color="#CC0000" size="2">Location ID</font></td>
    <td valign="top" colspan="2">:<%=r1.getString(9) %></td>
    </tr>
    <tr>
    <td valign="top"><font color="#CC0000" size="2">Location</font></td>
    <td valign="top" colspan="2"><%=locname%></td>
    </tr>
    
    
    <tr>
    <td valign="top"><font color="#CC0000" size="2">City</font></td>
    <td colspan="2" valign="top"><%=r1.getString(5) %></td></tr>
    
    <tr>
    <td valign="top"><font color="#CC0000" size="2"></font></td>

    <td width="26%"  valign="top"><font size="2"><b>
    <span id="lbl_epic"></span></b></font>
    </td>

    
    
    
    </tr>
    
    
    
    <tr>
                  
    <tr>
    <td height="110" colspan="7" valign="top">
    <p>&nbsp;</p>
    <table align="center" bgcolor="#FEF3EB" border="0" cellpadding="0" cellspacing="0">
    <tr>
    <td><br /><font size="2"><b>Signature/Thumb impression of Applicant</b></font></td>
    <td>&nbsp;</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="2"><br /><font size="2"><b>Seal & Signature of Registering Authority</b></font><br /></td>
    </tr>
    </table>
    </td></tr>
    </table> 
    <div align="center"><A href="javascript:window.print()" align="center">Click here to print</a> </div>
    <% } %>
    <br />
    <center>
           <a href="adminhome.jsp">back to home <a>
    </center>
    <br />
        <center>
        <div>

</div>
        </center>
        <br />
    <center>
    </center>
    <br />
        <center>
        <div>

</div>
        </center>
        <br />
        <center>
      </center>
    <br />
    <center>
        <div>

</div>
        </center>
    <center>
    <font color="black" size="2"><b>
    
    </b></font>
    </center>
    </form>

</body>
</html>
 

