/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test.com;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.Anchor;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chapter;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Section;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.sql.*;
import java.util.Date;

/**
 *
 * @author Ruchir
 */
@WebServlet(name = "cityrep", urlPatterns = {"/cityrep"})
public class cityrep extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static String FILE = "D:\\nverrep.pdf";
  private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18,
      Font.BOLD);
  private static Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,
      Font.NORMAL, BaseColor.RED);
  private static Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16,
      Font.BOLD);
  private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12,
      Font.BOLD);
  
  private static void addMetaData(Document document) {
    document.addTitle("REPORT");
    document.addSubject("Complains");
    document.addKeywords("MNREGA PORTAL");
    document.addAuthor("Ruchir Sharma");
    document.addCreator("Admin@Mnregaportal");
  }
  static String city;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        city=request.getParameter("city");
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet listprj</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet listprj at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
            Document document = new Document();
      PdfWriter.getInstance(document, new FileOutputStream(FILE));
      document.open();
      out.println("Adding Meta Data");
      addMetaData(document);
      out.println("Adding Title Page");
      addTitlePage(document);
      out.println("Adding Content");      
       addContent(document);
       out.println("Content Added");
       
            
      document.close();
      out.println("Document generated at : D:\\nverrep.pdf");
      out.println("<br><br>");
      
      out.println("Click");
      out.println("<a href='Surveyorview.jsp'>Here</a>");
      out.println("to Continue");
      
        }catch(Exception e)
        {
            out.println("Exception in cityrep.java"+e.getMessage());
        } finally {            
            out.close();
        }
    }
         private static void addTitlePage(Document document)
      throws DocumentException {
        
    Paragraph preface = new Paragraph();
    // We add one empty line
    addEmptyLine(preface, 1);
    // Lets write a big header
    preface.add(new Paragraph("Status REPORT", catFont));

    addEmptyLine(preface, 1);
    // Will create: Report generated by: _name, _date
    preface.add(new Paragraph("Report generated by: " + System.getProperty("user.name") + ", " + new Date(), //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
        smallBold));
    addEmptyLine(preface, 3);
    preface.add(new Paragraph("This document gives the details of labours which are not verified city wise ",
        smallBold));

    addEmptyLine(preface, 8);

    preface.add(new Paragraph("This document version is subjected to the time of Generation ).",
        redFont));
    document.add(preface);
    // Start a new page
    document.newPage();
  }
  private static void addContent(Document document) throws Exception {
    Anchor anchor = new Anchor("MNREGA ", catFont);
    anchor.setName("LIST");

    // Second parameter is the number of the chapter
    Chapter catPart = new Chapter(new Paragraph(anchor), 1);

    Paragraph subPara = new Paragraph("", subFont);
    Section subCatPart = catPart.addSection(subPara);
    subCatPart.add(new Paragraph("SITE DESCRIPTION "));

   
   
    // Add a table
    createTable(subCatPart);

    // Now add all this to the document
    document.add(catPart);

   

  }

  private static void createTable(Section subCatPart)
      throws Exception {
      int comp=0,tot=0;
     //out.println("In Create TAble");
      //DATABASE CONNECTIVITY
      Connection con = null;
      Statement stmt = null;
      ResultSet rst  = null;
        String url = "jdbc:mysql://localhost:3306/mnrega?user=root&password=prady";
        String driver = "com.mysql.jdbc.Driver";
        
        Class.forName(driver);
        con = DriverManager.getConnection(url);
        stmt=con.createStatement();
        String sql = "Select * from labour where lcity='"+city+"' AND vcheck='no'";
        rst=stmt.executeQuery(sql);
         PdfPTable table = new PdfPTable(5);
    
         // t.setBorderColor(BaseColor.GRAY);
         // t.setPadding(4);
         // t.setSpacing(4);
         // t.setBorderWidth(1);

        PdfPCell c1 = new PdfPCell(new Phrase("Job Card Number"));
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(c1);

        c1 = new PdfPCell(new Phrase("Name of Labour"));
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(c1);

         c1 = new PdfPCell(new Phrase("Gender"));
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(c1);
    
             
        c1 = new PdfPCell(new Phrase("Date Applied"));
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(c1);
        
        c1 = new PdfPCell(new Phrase("Location ID"));
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(c1);
        while(rst.next())
        {
            comp++;
            
                table.addCell(rst.getString(7));
                table.addCell(rst.getString(2));
                table.addCell(rst.getString(4));
                table.addCell(rst.getString(6));
                table.addCell(rst.getString(9));
                            
       
    
        }
        subCatPart.add(table);
        
        List list = new List(true, false, 10);
    list.add(new ListItem("SUMMARY"));
    
    list.add(new ListItem("For CITY: "+city));
    
    list.add(new ListItem("Total Labours who are not verified: "+comp));
    
 
    
    
   
    subCatPart.add(list);
    }

 

  private static void addEmptyLine(Paragraph paragraph, int number) {
    for (int i = 0; i < number; i++) {
      paragraph.add(new Paragraph(" "));
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
        processRequest(request, response);
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
        processRequest(request, response);
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
