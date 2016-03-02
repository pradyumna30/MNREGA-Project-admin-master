/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test.com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Properties;
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


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
/**
 *
 * @author Ruchir
 */
@WebServlet(name = "appten", urlPatterns = {"/appten"})
public class appten extends HttpServlet {
    private String ldate;
    private String name;
    private String email;

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
        String tno = request.getParameter("radio");
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet appten</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet appten at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
            Connection con=null;
            Statement stmt=null;
            Statement stmt1=null;
            ResultSet rst=null;
            String url = "jdbc:mysql://localhost:3306/mnrega?user=root&password=prady";
        String driver = "com.mysql.jdbc.Driver";
        String sid="";
        
        Class.forName(driver);
        con = DriverManager.getConnection(url);
        stmt=con.createStatement();
        stmt1=con.createStatement();
        String city="",locid="";
        int wreq = 0,dow=0;
        String sql="select * from tendertable where tno='"+tno+"'";
        rst=stmt.executeQuery(sql);
        while(rst.next())
        {
            sid= rst.getString(3);
            wreq=rst.getInt(4);
            dow=rst.getInt(5);
            name=rst.getString(1);
            email=rst.getString(2);
            
            String sql2="select * from anncprj where sid='"+sid+"'";
            ResultSet rst2 = stmt1.executeQuery(sql2);
            while(rst2.next())
            {
                city=rst2.getString(2);
                locid=rst2.getString(3);
                ldate=rst2.getString(4);
                
            }
            out.println(ldate);
        }
        String command = "Insert into site values(?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstmt = con.prepareStatement(command);
        pstmt.setString(1,sid);
        pstmt.setString(2,city);
        pstmt.setString(3,locid);
        pstmt.setInt(4,wreq);
        pstmt.setInt(5,dow);
        pstmt.setString(6,ldate);
        pstmt.setInt(7,0);
        pstmt.setString(8,"Work In Progress");
        pstmt.setString(9,"No");
        
        
        int i =pstmt.executeUpdate();
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
				InternetAddress.parse(email));
			message.setSubject("Tender Final");
			message.setText("Hello"+name
				+ "\n\n Your Tender has been accepted."
                                +"For Site-ID :  "+sid
                                +"For Location-ID :  "+locid
                                +"In City :  "+city
                                +"Starting Date for Work is:  "+ldate
                                +"You can check the status of the site anytime on our portal.\nThank You."
                                + "\n\n\nThis is an autogenerated Email.Kindly do not reply. For any queries contact our managers.");
 
			Transport.send(message);
 
			//System.out.println("Email Done");
 
		} 
                catch (MessagingException e) {
                    out.println("Exception in sending email"+e.getLocalizedMessage());
			throw new RuntimeException(e);
		}
          out.println("The Tender  has been finalised. Company would receive an confirmation Email on the Email ID.");
          out.println("Click");
          out.println("<a href='adminhome.jsp'>Here</a>");
          out.println("to Continue.");
           }
        
        
        
        
        
        
        
        } 
        catch(Exception e)
        {
                out.println(e);
        
        }
        finally {            
            out.close();
        }
    }
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
            Logger.getLogger(appten.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(appten.class.getName()).log(Level.SEVERE, null, ex);
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
