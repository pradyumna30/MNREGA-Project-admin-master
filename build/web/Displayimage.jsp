<%-- 
    Document   : Displayimage
    Created on : Mar 24, 2013, 4:30:24 PM
    Author     : SAI
--%>

<%
  String adhar =  request.getParameter("adhar");
  try{      
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega","root","prady");      
    java.sql.Statement st=con.createStatement();
    String strQuery = "select image from Image where Adhar="+"adhar";
    java.sql.ResultSet rs = st.executeQuery(strQuery);

    String imgLen="";
    if(rs.next()){
      imgLen = rs.getString(1);
       }  
    rs = st.executeQuery(strQuery);
    if(rs.next()){
      int len = imgLen.length();
      byte [] rb = new byte[len];
      java.io.InputStream readImg = rs.getBinaryStream(1);
      int index=readImg.read(rb, 0, len);  
      st.close();
      response.reset();
      response.getOutputStream().write(rb,0,len); 
      response.getOutputStream().flush();        
    }
       else{
       out.println("image not found ");
       }
  }
  catch (Exception e){
            out.println(e);
         e.printStackTrace();
  }
%>

