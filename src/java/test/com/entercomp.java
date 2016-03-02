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
import java.util.Properties;
import java.util.Random;
 
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
/**
 *
 * @author Ruchir
 */
@WebServlet(name = "entercomp", urlPatterns = {"/entercomp"})
public class entercomp extends HttpServlet {

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
      
        String name = request.getParameter("cname");
        String text = request.getParameter("ctext");
        String email = request.getParameter("cemail");
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet entercomp</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet entercomp at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
            String mydate = java.text.DateFormat.getDateTimeInstance().format(Calendar.getInstance().getTime());
           
            //Setting up Cookie for ID 
            Random r = new Random();
            int var=r.nextInt();
            int ckno=var;
           
           Cookie[] cookies =request.getCookies();
          // out.println("DATA Entered in Cookie !!");
           Cookie cookie = null;
           if(cookies!=null)
           {
               for(int i=0;i<cookies.length;i++)
               {
                   if (cookies[i].getName().equals("faculty"))
                   {
                       ckno = Integer.parseInt(cookie.getValue()) + 1;
                       
                       break;
                   }
               }
            }
           else
           {
               Cookie rvc= new Cookie("faculty","yes");
               rvc.setMaxAge(60*60*60);
               response.addCookie(rvc);
               ckno=1;
            }
           String id="C"+ckno;
           // out.println("/nCookie Done");
           //out.println("ckno :"+ckno);
          
            Connection con=null;
            Statement stmt=null;
            ResultSet rst = null;
            String url = "jdbc:mysql://localhost:3306/mnrega?user=root&password=prady";
            String driver = "com.mysql.jdbc.Driver";
            Class.forName(driver).newInstance();
             // out.println("In it");
            con = DriverManager.getConnection(url);
            String sql="Insert into complain values(?,?,?,?,?,?)";
          PreparedStatement pstmt = con.prepareStatement(sql);
           pstmt.setString(1,id);
            pstmt.setString(2,name);
            pstmt.setString(3,email);
            pstmt.setString(4,"Pending");
            pstmt.setString(5,text);
            pstmt.setString(6,mydate);
            
            //out.println("Complain Inserted !!!");
            
            int i = pstmt.executeUpdate();
           if(i==1){
           
           // Emailing    
                final String username = "mnrega.apr@gmail.com";
		final String password = "ashu.pradyu.cr";
 
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
            @Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("mnrega.apr@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(email));
			message.setSubject("Complain Registered");
			message.setText("Hello"+name
				+ "\n\n Your Complain has been registered."
                                +"Your Complain ID is:  "+id
                                +"You can check the status of the complain anytime on our portal.\nThank You."
                                + "\n\n\nThis is an autogenerated Email.Kindly do not reply. For any queries contact our managers.");
 
			Transport.send(message);
 
			//System.out.println("Email Done");
 
		} 
                catch (MessagingException e) {
                    out.println("Exception in sending email"+e.getLocalizedMessage());
			throw new RuntimeException(e);
		}
          out.println("Your Complain has been Registered. You would receive an confirmation Email on your provided Email ID.");
          out.println("Click");
          out.println("<a href='index.jsp'>Here</a>");
          out.println("to Continue.");
           }
           
        }
        catch(Exception e)
        {   
            out.println("Exception in entercomp.java"+e.getMessage());
        }finally {            
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
            Logger.getLogger(entercomp.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(entercomp.class.getName()).log(Level.SEVERE, null, ex);
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
