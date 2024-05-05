import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;

import java.io.IOException;
import java.io.PrintWriter;


public class subadmin extends HttpServlet {

	public void init() {
		System.out.println("init() called in the subadmin servlet");
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {


		String sub_name = req.getParameter("subadminname");
		String sub_pass = req.getParameter("subadminpass");

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","#","#");
			PreparedStatement ps = con.prepareStatement("DB Query");


			ps.setString(1, sub_name);
			ps.setString(2, sub_pass);

			ps.executeUpdate();
		}
		catch(SQLException e1) {
			e1.printStackTrace();
		}
		catch(ClassNotFoundException e2) {
			e2.printStackTrace();
		}
		RequestDispatcher rd = req.getRequestDispatcher("dashboard.jsp");
		rd.forward(req, res);

	}
}