package controller;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.DetailsVO;

import com.google.gson.Gson;
import com.mysql.jdbc.Connection;

public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection cn;
	Statement st;
	ResultSet rs;
	String s;
	String eId = "", eFirstName = "", eLastName = "", eAddress = "",
			eGender = "", ePassword = "";

	DetailsVO ab;

	public Main() {
		try {

			Class.forName("com.mysql.jdbc.Driver");

			cn = (Connection) DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1/EmployeeDetails", "root", "root");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<DetailsVO> ls = new ArrayList<DetailsVO>();
		Gson gson = new Gson();
		String type = request.getParameter("type");

		if (type.equals("editdata")) {
			String recievedData = request.getParameter("dataIS");
			DetailsVO detailmodels = gson.fromJson(recievedData,
					DetailsVO.class);
			
			System.out.println("qwertyuiopagll;hjkyd " + detailmodels);
			System.out.println("edit data " + detailmodels.getEmp_Id());
			update(detailmodels);

		} else if (type.equals("adddata")) {
			String recievedData = request.getParameter("dataIS");
			DetailsVO detailmodels = gson.fromJson(recievedData,
					DetailsVO.class);

			insert(detailmodels);

		} else if (type.equals("deleteData")) {
			String recievedData = request.getParameter("dataIS");
			DetailsVO detailmodels = gson.fromJson(recievedData,
					DetailsVO.class);
			System.out.println("edited data " + detailmodels.getEmp_Id());
			delete(detailmodels);

		} else if (type.equals("getdata")) {
			// eId = request.getParameter("emp_Id");
			// eFirstName = request.getParameter("emp_FirstName");
			// eLastName = request.getParameter("emp_LastName");
			// eAddress = request.getParameter("emp_Address");
			// eGender = request.getParameter("emp_Gender");

			try {
				st = cn.createStatement();
				rs = st.executeQuery("select * from EDetails");

				while (rs.next()) {
					// System.out.println("inside loop");
					DetailsVO details = new DetailsVO();

					details.setEmp_Id(rs.getString("emp_Id"));
					details.setEmp_FirstName(rs.getString("emp_FirstName"));
					details.setEmp_LastName(rs.getString("emp_LastName"));
					details.setEmp_Address(rs.getString("emp_Address"));
					details.setEmp_Gender(rs.getString("emp_Gender"));
					details.setEmp_Password(rs.getString("emp_Password"));

					ls.add(details);

				}

				Gson g = new Gson();
				String str = g.toJson(ls);
				System.out.println("Json string is" + str);

				response.getWriter().write(str);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	public void insert(DetailsVO detailmodel) {
		try {
			s = "insert into EDetails values('" + detailmodel.getEmp_Id()
					+ "','" + detailmodel.getEmp_FirstName() + "','"
					+ detailmodel.getEmp_LastName() + "','"
					+ detailmodel.getEmp_Address() + "','"
					+ detailmodel.getEmp_Gender() + "','"
					+ detailmodel.getEmp_Password() + "')";
			st = cn.createStatement();
			st.executeUpdate(s);
		} catch (Exception e) {

			System.out.println(e.getMessage());
		}

	}

	public void update(DetailsVO detailmodel) {

		try {
			s = "update EDetails set emp_FirstName='"
					+ detailmodel.getEmp_FirstName() + "',emp_LastName='"
					+ detailmodel.getEmp_LastName() + "',emp_Address='"
					+ detailmodel.getEmp_Address() + "',emp_Gender='"
					+ detailmodel.getEmp_Gender() + "',emp_Password='"
					+ detailmodel.getEmp_Password() + "' where emp_Id="
					+ detailmodel.getEmp_Id();
			st = cn.createStatement();
			st.executeUpdate(s);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

	public void delete(DetailsVO detailmodel) {
		try {

			s = "delete from EDetails where emp_Id=" + detailmodel.getEmp_Id();
			st = cn.createStatement();
			st.executeUpdate(s);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
