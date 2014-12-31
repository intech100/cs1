package controller;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.DetailsVO;

import com.mysql.jdbc.Connection;

public class m1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String uname = "", password = "";
	Connection cn;
	Statement st;
	ResultSet rs;
	DetailsVO dvo = new DetailsVO();

	public m1() {

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		uname = request.getParameter("uName");
		password = request.getParameter("password");
		HttpSession session = request.getSession();
	
		session.setAttribute("users", uname);
		try {
			Class.forName("com.mysql.jdbc.Driver");

			cn = (Connection) DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1/EmployeeDetails", "root", "root");
			st = cn.createStatement();
			rs = st.executeQuery("select * from EDetails  where emp_FirstName ='"
					+ uname + "' and emp_Password='" + password + "'");

		} catch (Exception e) {
			System.out.println(e.getMessage());

		}

		try {
			if (rs.next()) {

				RequestDispatcher rd = request.getRequestDispatcher("Emp.jsp");
				rd.forward(request, response);
				// response.sendRedirect("Emp.jsp");

			} else {
				String s = "Please Enter Valid Username and Password ";
				request.setAttribute("Invalid", s);
				RequestDispatcher rd = request
						.getRequestDispatcher("Login.jsp");
				rd.forward(request, response);
				// response.sendRedirect("Login.jsp?type1=invalid");

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
