/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test.com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
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
@WebServlet(name = "distwork", urlPatterns = {"/distwork"})
public class distwork extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         String sid = request.getParameter("txtsid");
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet distwork</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet distwork at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
             // Database Connection Initialization
            Connection con = null;
            ResultSet rst = null;
            Statement stmt = null;
        
        //URL for Connectivity    
        String url = "jdbc:mysql://localhost:3306/project?user=root&password=prady";
        String driver = "com.mysql.jdbc.Driver";
        
        Class.forName(driver);
        con = DriverManager.getConnection(url);
        
        String city = "Indore";
        int walt=0;
        String locid = "L01";
        String wreq="5";
        String dow = "70";
        String dos = "1";
        
         String command = "Insert into site(`SiteId`,`city`,`Locid`,`wreq`,`dow`,`dos`,`workeralt`)"+"values(?,?,?,?,?,?,?)";
     PreparedStatement pstmt = con.prepareStatement(command);
 
     // out.println("Command for insertion in Sitetable initialized HERE");
            
            pstmt.setString(1,sid);
            pstmt.setString(2,city);
            pstmt.setString(3,locid);
            pstmt.setString(4,wreq);
            pstmt.setString(5,dow);
            pstmt.setString(6,dos);
            pstmt.setInt(7,walt);
            
            int i = pstmt.executeUpdate();
        
          if(i==1)
           {
               out.println("Data Inserted");
               out.println("<a href='ophome.jsp'>Click Here to Continue</a>");
           }
           else
           {
               out.println("Data Not Inserted");
               out.println("<a href='ophome.jsp'>Click Here to Continue</a>");
               
           }            
        
        
        
        } finally {            
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
            Logger.getLogger(distwork.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(distwork.class.getName()).log(Level.SEVERE, null, ex);
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
