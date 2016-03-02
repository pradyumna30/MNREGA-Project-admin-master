/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test.com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Ruchir
 */
@WebServlet(name = "workserv", urlPatterns = {"/workserv"})
public class workserv extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("txtid");
        
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet workserv</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet workserv at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
            String city="";
        Connection con = null;
        ResultSet rst = null;
        Statement stmt = null;
        String url = "jdbc:mysql://localhost:3306/mnrega?user=root&password=prady";
        String driver = "com.mysql.jdbc.Driver";
            
        Class.forName(driver).newInstance();
        // out.println("In it");
        con = DriverManager.getConnection(url);
      //  Getting the City Name
        String command1 = "Select * from labour where jobcardno='"+id+"'";
        stmt = con.createStatement();
        ResultSet rs1 = stmt.executeQuery(command1);
        while(rs1.next())
        {
            city = rs1.getString(5);
        }
        String command = "Insert into demand(`Jobcardno`,`Dateofd`,`city`)"+"values(?,?,?)";
        PreparedStatement pstmt = con.prepareStatement(command);
 
     // out.println("Command for insertion in Reqtable initialized HERE");
            String mydate = java.text.DateFormat.getDateTimeInstance().format(Calendar.getInstance().getTime());
            pstmt.setString(1,id);
            pstmt.setString(2,mydate);
            pstmt.setString(3,city);
            
        int i = pstmt.executeUpdate();
           if(i==1)
            { int nod=0;
               out.println("Data Inserted");
               command="select * from workerdetails2 where Jobcardno='"+id+"'";
               out.println("<a href='operator.jsp'>Click Here to Continue</a>");
               rs1=stmt.executeQuery(command);
               while(rs1.next())
               {
               
                   nod=rs1.getInt(4);
                   
               
               }
               nod++;
           java.sql.PreparedStatement ps1 = con.prepareStatement("Update workerdetails2 Set Noofdemand=? where jobcardno=? ");
           ps1.setInt(1, nod);
           ps1.setString(2,id);
           int j=ps1.executeUpdate();
            }
           else
           {
               out.println("Data Not Inserted");
               out.println("<a href='ophome.jsp'>Click Here to Continue</a>");
               
           }            
        
  
        }
        catch(Exception e)
        {
            out.println("Exception in workserv.java: "+e.getMessage());
        }
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(workserv.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(workserv.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
