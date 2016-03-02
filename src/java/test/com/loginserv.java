package test.com;
import java.util.Date;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.Calendar;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;


@WebServlet(name = "loginserv", urlPatterns = {"/loginserv"})
public class loginserv extends HttpServlet {
// It doesn't matter what IDE you use. It doesn't even matter if you don't use an IDE. The J2EE servlet API doesn't have anything to do with IDEs. It cannot, since there's no IDE on a production server.

//On the other hand, the servlet API does provide a "service()" method and all incoming HTTP service requests for that servlet's URL pattern will be sent to it.

//You can override the service() method if you want. The HttpServletRequest class does so in order to route GET requests to an API-defined doGet() method and POST requests go to doPost().

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException,Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mnrega", "root", "prady");

             String uname = request.getParameter("Uname");
            PreparedStatement ps=con.prepareStatement("select * from login where Uname=? and Pass=? and Type=?");
            ps.setString(1, uname);
            ps.setString(2, request.getParameter("Pass"));
            ps.setString(3, request.getParameter("List"));
           // out.println(request.getParameter("unm"));
            ResultSet rs=ps.executeQuery();
            
           //Inserting into Log Table.. !!
            String mydate = java.text.DateFormat.getDateTimeInstance().format(Calendar.getInstance().getTime());
            String sql = "Insert into log(id,logint,stamp,logoutt) values(?,?,?,?)";
            HttpSession session = request.getSession();
            session.setAttribute("theName",uname );
            // Setting up the session
            Random r = new Random();
            int next1 = r.nextInt();
            session.setAttribute("random",next1);
            String next = ""+next1;
            PreparedStatement s1 = con.prepareStatement(sql);
            s1.setString(1,uname);
            s1.setString(2,mydate);
            s1.setString(3,next);
            s1.setString(4,"");
            if(rs.next())
            {  
                if("Operator".equals(request.getParameter("List")))
               {
                   s1.executeUpdate();
                   response.sendRedirect("operator.jsp");
               }
               else if("Manager".equals(request.getParameter("List")))
               {
                   s1.executeUpdate();
                   response.sendRedirect("managerhome.jsp");
               }
                
             
               else if("Accountant".equals(request.getParameter("List")))
               {
                   s1.executeUpdate();
                   response.sendRedirect("Accountantview.jsp");
               }
            
               else if("Administrator".equals(request.getParameter("List")))
               { 
                   s1.executeUpdate();
                   response.sendRedirect("adminhome.jsp");}
               
            
            else if("surveyor".equalsIgnoreCase(request.getParameter("List")))
               { 
                   s1.executeUpdate();
                   response.sendRedirect("Surveyorview.jsp");}
            }
             else 
               response.sendRedirect("error.html");
            
            
        } catch (Exception e) {
            out.print("exception "+e.getLocalizedMessage());
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
            Logger.getLogger(loginserv.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(loginserv.class.getName()).log(Level.SEVERE, null, ex);
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
