/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Calendar;
import java.util.Random;
//import java.util.Iterator;
//import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import mypack.MyCon;
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//mport org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author SAI
 */
public class addnewservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            String adhar = request.getParameter("adarno");
            String mydate = java.text.DateFormat.getDateTimeInstance().format(Calendar.getInstance().getTime());
            Random r = new Random();
            int var = r.nextInt();
            int ckno = var;

            Cookie[] cookies = request.getCookies();
            // out.println("DATA Entered in Cookie !!");
            Cookie cookie = null;
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals("nrega")) {
                        ckno = Integer.parseInt(cookie.getValue()) + 1;

                        break;
                    }
                }
            } else {
                Cookie rvc = new Cookie("nrega", "yes");
                rvc.setMaxAge(60 * 60 * 60);
                response.addCookie(rvc);
                ckno = 1;
            }
            String id = "C" + ckno;
  out.println(id);
            HttpSession session = request.getSession();
            out.println(adhar);
            session.setAttribute("adhar", adhar);
            Connection con = MyCon.getConnection();
            PreparedStatement ps = con.prepareStatement("insert into labour values(?,?,?,?,?,?,?,?,?)");
            ps.setInt(1, Integer.parseInt(request.getParameter("adarno")));
            ps.setString(2, request.getParameter("lname"));
            ps.setString(3, request.getParameter("ldob"));
            ps.setString(4, (request.getParameter("lgender")));
            ps.setString(5, (request.getParameter("lcity")));
            ps.setString(6, mydate);
            ps.setString(7, id);
            ps.setString(8, "no");
            ps.setString(9, (request.getParameter("lid")));
            // ps.setInt(9,(request.getParameter("Photoid")))
            //ps.setBytes(9,b);



            // ps1.setBytes(1,b); 
            int i = ps.executeUpdate();


           
            if (i > 0) {
                out.println("record inserted <a href=Image.jsp>Upload The image of worker</a>  ");
            } else {
                System.out.println("Error In Adding");
            }

        } catch (Exception e) {
            out.println("error while inserting wrong data inserted <a href=operator.jsp>home</a>  ");
            out.println("U Have Entered Wrong Data please Check The following ");
            out.print(e);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
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
            Logger.getLogger(addnewservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
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
            Logger.getLogger(addnewservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
