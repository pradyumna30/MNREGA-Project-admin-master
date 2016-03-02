
<%@ include file="header.jsp" %> 
<html>
    <head>
        <title>First page</title>
     </head>
    <body>
       
    <form name="form1"  method="post" action="addnewservlet">
      <p>&nbsp;</p>
      <h1 align="center">Details Of Labour</h1>
      <p> 
        <label>
          <div align="center">
            <table width="261" border="1">
                
              
                <tr>
                <td width="109"><p>Adhar Number</p></td>
                <td width="136"><input type="text" name="adarno" id="adarno"></td>
              </tr>
              <tr>
                <td>Labour Name</td>
                <td><input type="text" name="lname" id="lname"></td>
              </tr>
              <tr>
                <td>Labour DOB</td>
                <td><input type="text" name="ldob" id="ldob"><p>( dd/mm/yyyy) </p></td> 
              </tr>
              <tr>
                <td>Labour Gender</td>
                <td><input type="text" name="lgender" id="lgender"></td>
              </tr>
              <tr>
                <td>Labour City</td>
                <td><input type="text" name="lcity" id="lcity"></td>
              </tr>
              
              <tr>
                <td>Location ID</td>
                <td><input type="text" name="lid" id="locationid"></td>
              </tr>
              <tr>
                
            </table>
          </div>
   
      <p align="center">
        <input type="submit" name="Submit" id="Submit" value="Submit">
      </p>
    </form>
    
</body>
</html>
