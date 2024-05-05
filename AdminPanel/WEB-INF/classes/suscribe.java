import java.io.PrintWriter;
import java.io.IOException;

import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.RequestDispatcher; 
import javax.servlet.ServletException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;

public class suscribe extends HttpServlet {
    public void init() throws ServletException {
        System.out.println("Init method is called, So object is create fo this request");
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        PrintWriter out = res.getWriter();
            res.setContentType("text/html");

        try {
            String Susmail = req.getParameter("submail");


            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection cnn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","#","#");
            PreparedStatement ps = cnn.prepareStatement("DB Query");


            ps.setString(1, Susmail);
            ps.executeUpdate();
        }
        catch(SQLException e1) {
            e1.printStackTrace();
        }
        catch(ClassNotFoundException e2) {
            e2.printStackTrace();
        }
        out.println("<html>");
        out.println("<head>");  // terminate style
        out.println("</head>");
        out.println("<body>");
        out.println("<h4>ThankYou for Suscribe</h4>");
        out.println("</body>");
        out.println("</html>");
        RequestDispatcher rd = req.getRequestDispatcher("Index.jsp");
        rd.forward(req, res);

    }
}