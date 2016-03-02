/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test.com;

import java.io.*;
import java.io.PrintWriter;
import java.sql.*;
import java.util.StringTokenizer;
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
@WebServlet(name = "allotserv", urlPatterns = {"/allotserv"})
public class allotserv extends HttpServlet {
    

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        FileReader file_in = new FileReader("D:\\citydet.txt");
        BufferedReader br = new BufferedReader(file_in);
        
        String list[] = new String[100];
        int c=0; // Counter for it !!
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String sid= request.getParameter("combo1");
        
        try {
            
            
            out.println("In try");
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet allotserv</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet allotserv at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
           // MY SQL  Connection
            out.println("Managing Connection");
            Connection con=null;
            Statement stmt=null;
            ResultSet rst1=null;
            String url = "jdbc:mysql://localhost:3306/mnrega?user=root&password=prady";
            String driver = "com.mysql.jdbc.Driver";
            String city="",locid="",dow="",dos="";
            int wreq=0;
             Class.forName(driver);
            con = DriverManager.getConnection(url);
            stmt = con.createStatement();
        out.println("First Query siteid");
            String sql="select * from site where SiteId='"+sid+"'";
        rst1= stmt.executeQuery(sql);
        while(rst1.next())
        {
             out.println("In while");
            city=rst1.getString(2);
            locid=rst1.getString(3);
            wreq= rst1.getInt(4);
            dow = rst1.getString(5);
            dos = rst1.getString(6);
        }
       if(wreq==0)
       {
           out.println("No worker requried");
           response.sendRedirect("operator.jsp");
       }
      
        // Extracting location array of the city
       out.println("Making Array"); 
       int order=0;
        String array[][]=new String[100][100];
        String line = br.readLine();
        while(line!=null)
        {
            StringTokenizer st = new StringTokenizer(line," ");
            if(st.nextToken().equalsIgnoreCase(city))
            {
                out.println("City Matched !!, making the array");
                String n = st.nextToken();
                order = Integer.parseInt(n);
                for(int i=0;i<order;i++)
                {
                    for(int j=0;j<order;j++)
                    {
                        array[i][j]=st.nextToken();
                    }
                }
                break;
            }
            line = br.readLine();
        }
        out.println("Outside the array");
        //Scanning the number of demands from the city !!
        String demarray[][] = new String[100][2];
        int count=0;
        String jcno;
       
        Statement stmt2 = con.createStatement();
       out.println("Query: Demand");
       String sql1 = "Select * from demand where city='"+city+"'";
            ResultSet rst = stmt.executeQuery(sql1);
            int wallot = 0; // Counter
            
            while(rst.next())
             {
                 jcno = rst.getString(1);
                 // Extracting the data of One labour at rst loop 
                 String sql2 = "Select locid from labour where jobcardno='"+jcno+"'";
                 ResultSet rst2 = stmt2.executeQuery(sql2);
                 while(rst2.next())
                 {
                     if(wallot>=wreq)
                    {
                        out.println("Already Allotted");
                         break;
                    }  
                     if(rst2.getString(1).equalsIgnoreCase(locid))
                     {
                        out.println("Query: Insert in workdetails1");
                        String command = "Insert into workerdetails1(Jobcardno,Siteworkedat,Moneyforsite,Daysofwork,Workfrom,Workto)"+"values(?,?,?,?,?,?)";
                        PreparedStatement pstmt = con.prepareStatement(command);
                
                        out.println("Statement prepared");
                        String money = "0";
                       list[c]=jcno;
                       c++;
                        //file_out.write(jcno);
                        //out.println("Written in file");
                        pstmt.setString(1,jcno);
                        pstmt.setString(2,sid);
                        pstmt.setString(3,money);
                        pstmt.setString(4,dow);
                        pstmt.setString(5,dos);
                        pstmt.setString(6,(dos+dow));
           
                        int i =pstmt.executeUpdate();
                        out.println("Insert in workdetails query executed");
                        if(i==1)
                        {
                            wallot++;
                        }
                     }
                     else
                     {
                         out.println("Inserting this in demarray !!"+jcno+","+rst2.getString(1));
                         out.println("<br>");
                         demarray[count][0] = jcno;
                         demarray[count][1] = rst2.getString(1);
                         count++;
                     }
                 }
                out.println("Outside the loop");
                 if(wallot==wreq)
                 {
                     out.println("Perfect Match");
                     break;
                 }  
             }
            
            if(wallot<wreq)
            {
                out.println((wreq-wallot)+"No of workers are required");
                //int count = wreq-wallot;
                String near="";
                String loc1 = locid.substring(1);
                int index = Integer.parseInt(loc1);
                String min1= array[0][index];
                int min = Integer.parseInt(min1);//Minimum !!
                int ind=0; // Index of minimum
                int orderchck=0;
               while((wreq>wallot)&&(orderchck<order))
               {
                   for(int i=0;i<order;i++)
                    {
                        if(i==index)
                        {
                            continue;
                        }
                        //Searching for nearest Location
                        String s1 = array[i][index];
                        int loc = Integer.parseInt(s1);
                        if(loc<min)
                        {
                            min=loc;
                            ind =i;
                        }
                    
                    }
                   orderchck++;
                   min1 = "L0"+min;
                   out.println("Minimum: "+min1);
                   array[ind][index]="100000"; // Assuming that the dist b/w two location of city would not be > this !!
                 out.println("Array declared");
                   // Looking out for worker from closest location
                   for(int i=0;i<count;i++)
                   {
                      out.println("Array Value : "+demarray[i][1]);
                       if(demarray[i][1].equalsIgnoreCase(min1))
                       {
                           out.println("In if");
                           String jcno1 = demarray[i][0];
                           String command = "Insert into workerdetails1(Jobcardno,Siteworkedat,Moneyforsite,Daysofwork,Workfrom,Workto)"+"values(?,?,?,?,?,?)";
                           PreparedStatement pstmt = con.prepareStatement(command);
                           out.println("Preparing statement");
                            String money = "0";
                            list[c]=jcno1;
                             c++;
                      
                            //file_out.write(jcno1);
                            pstmt.setString(1,jcno1);
                            pstmt.setString(2,sid);
                            pstmt.setString(3,money);
                            pstmt.setString(4,dow);
                            pstmt.setString(5,dos);
                            pstmt.setString(6,(dos+dow));
           
                            int l =pstmt.executeUpdate();
                            out.println("Statement executed");
                            if(l==1)
                            {
                                wallot++;
                            }
                       }
                       else
                       {
                           out.println("In else for count="+count);
                       }
                   }
               
               }
            }
            file_in.close();
            PreparedStatement st = con.prepareStatement("UPDATE site SET workeralt = ? WHERE SiteId='"+sid+"'");
        out.println("updating site table");
        st.setInt(1,wallot);
        
        int p=st.executeUpdate();

        out.println("Updated Site Table");
            // Allotment Complete !!! Now Deleting from the demand table
        for(int i=0;i<c;i++)
        {
          String djcno=list[i];
            out.println("Deleting: "+djcno);
        
           // sql = "delete from demand where Jobcardno='"+djcno+"'";
             out.println("In while");
             
            st = con.prepareStatement("delete from demand where Jobcardno=?");
             st.setString(1,djcno);
            out.println("Deleting");
            int s =st.executeUpdate();
            
            //Updating workerdetails2 table
        String sql3="Select Noofdemandfulfil from workerdetails2 where Jobcardno='"+djcno+"'";
        ResultSet rst3=stmt.executeQuery(sql3);
        int no=0;
        while(rst3.next()){
         no= rst3.getInt("Noofdemandfulfil");
        }
        no++;
         PreparedStatement st1 = con.prepareStatement("UPDATE workerdetails2 SET Noofdemandfulfil = ? WHERE Jobcardno='"+djcno+"'");
        out.println("updating site table");
        st1.setInt(1,no);
        
         p=st1.executeUpdate();
        
        }   
       // file_out.flush();
       // file_out.close();
       // response.sendRedirect("ophome.jsp");
        out.println("END");
                response.sendRedirect("operator.jsp");
        } 
        catch(Exception e)
        {
            out.println("Exception in allotserv.java"+e.getMessage());
            out.println("Stack : "+e.getLocalizedMessage());
        }finally
        {            
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
            Logger.getLogger(allotserv.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(allotserv.class.getName()).log(Level.SEVERE, null, ex);
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