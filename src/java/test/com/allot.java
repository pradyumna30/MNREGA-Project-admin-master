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
@WebServlet(name = "allot", urlPatterns = {"/allot"})
public class allot extends HttpServlet {

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
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet allot</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet allot at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */ Connection con = null;
        Connection con1 = null;
        ResultSet rst = null;
        
        Statement stmt = null;
         Statement stmt1 = null;
         Statement stmt2 = null;
        //URL for Connectivity    
        String url = "jdbc:mysql://localhost:3306/mnrega?user=root&password=prady";
        String driver = "com.mysql.jdbc.Driver";
        
        Class.forName(driver);
        con = DriverManager.getConnection(url);
        con1 = DriverManager.getConnection(url);
        Connection con2 = DriverManager.getConnection(url);
        
        stmt = con.createStatement();
        stmt1 = con1.createStatement();
        stmt2 = con2.createStatement();
        
       
        String sql = "select * from site";
        String city,locid,wreq,dow,dos,wallot1;
        ResultSet rst1 = stmt.executeQuery(sql);
        while(rst1.next())
        {
            city = rst1.getString(2);
            locid = rst1.getString(3);
            wreq= rst1.getString(4);
            dow = rst1.getString(5);
            dos = rst1.getString(6);
            wallot1 = rst1.getString(7);
            int wallot = Integer.parseInt(wallot1);
            
            String jcno;
           
            String sql1 = "Select * from demand where city='"+city+"'";
            rst = stmt1.executeQuery(sql1);
            while(rst.next())
             {
                jcno = rst.getString(1);
               
                String command = "Insert into workerdetails1(Jobcardno,Siteworkedat,Moneyforsite,Daysofwork,Workfrom,Workto)"+"values(?,?,?,?,?,?)";
                PreparedStatement pstmt = con.prepareStatement(command);
                
                String money = "0";
            
                 pstmt.setString(1,jcno);
                 pstmt.setString(2,rst1.getString(1));
                 pstmt.setString(3,money);
                 pstmt.setString(4,dow);
                 pstmt.setString(5,dos);
                 pstmt.setString(6,(dos+dow));
           
                 int i =pstmt.executeUpdate();
                 if(i==1)
                     wallot++;
             }
            String command = "UPDATE site SET workeralt='"+wallot+"'WHERE SiteId=' "+rst1.getString(1)+"'";
             stmt2.executeUpdate(command);                    
                
                  
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
            Logger.getLogger(allot.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(allot.class.getName()).log(Level.SEVERE, null, ex);
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
