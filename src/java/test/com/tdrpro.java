/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test.com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
@WebServlet(name = "tdrpro", urlPatterns = {"/tdrpro"})
public class tdrpro extends HttpServlet {

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
        String Sid = request.getParameter("txtid");
        String twr = request.getParameter("txtwr");
        String tdow = request.getParameter("txtdow");
        
        String tname = request.getParameter("txtname");
        String temail = request.getParameter("txtmail");
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet tdrpro</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet tdrpro at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
           
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
                   if (cookies[i].getName().equals("tender"))
                   {
                       ckno = Integer.parseInt(cookie.getValue()) + 1;
                       
                       break;
                   }
               }
            }
           else
           {
               Cookie rvc= new Cookie("tender","yes");
               rvc.setMaxAge(60*60*60);
               response.addCookie(rvc);
               ckno=1;
            }
           String id="T"+ckno;
           
           //Inserting in database
            int wr = Integer.parseInt(twr);
            int dow = Integer.parseInt(tdow);
             Connection con = null;
        ResultSet rst = null;
        Statement stmt = null;
        String url = "jdbc:mysql://localhost:3306/mnrega?user=root&password=prady";
        String driver = "com.mysql.jdbc.Driver";
            
        Class.forName(driver).newInstance();
        // out.println("In it");
        con = DriverManager.getConnection(url);
        String command = "Insert into tendertable(`Sid`,`wr`,`dow`,`appname`,`appemail`,`tno`)"+"values(?,?,?,?,?,?)";
        PreparedStatement pstmt = con.prepareStatement(command);
 
     // out.println("Command for insertion in Reqtable initialized HERE");
            
            pstmt.setString(1,Sid);
            pstmt.setInt(2,wr);
            pstmt.setInt(3,dow);
            pstmt.setString(4,tname);
            pstmt.setString(5,temail);
            pstmt.setString(6,id);
        int i = pstmt.executeUpdate();
           if(i==1)
           {
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
				InternetAddress.parse(temail));
			message.setSubject("Application Tender Registered");
			message.setText("Hello "+tname
				+ "\n\n Your Tender has been registered."
                                +"Your Tender ID is:  "+id
                                +" The results of the tender would be declared within some days. you would be informed by email regarding it.\nThank You."
                                + "\n\n\nThis is an autogenerated Email.Kindly do not reply. For any queries contact our managers.");
 
			Transport.send(message);
 
			//System.out.println("Email Done");
 
		} 
                catch (MessagingException e) {
                    out.println("Exception in sending email"+e.getLocalizedMessage());
			throw new RuntimeException(e);
		}
          out.println("Your Tender has been Registered. You would receive an confirmation Email on your provided Email ID.");
          out.println("Click");
          out.println("<a href='index.jsp'>Here</a>");
          out.println("to Continue.");
           
           }
           else
           {
               out.println("Data Not Inserted");
               out.println("<a href='ophome.jsp'>Click Here to Continue</a>");
               
           }            
            
        } catch(Exception e)
        {
            out.println("Exception in tdrpro.java"+e.getLocalizedMessage());
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
            Logger.getLogger(tdrpro.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(tdrpro.class.getName()).log(Level.SEVERE, null, ex);
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
