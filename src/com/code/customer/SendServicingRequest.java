package com.code.customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.conn.DbConnection;

/**
 * Servlet implementation class SendServicingRequest
 */
@WebServlet("/SendServicingRequest")
public class SendServicingRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static Connection con;

	public void init(ServletConfig config) throws ServletException {
		try {
			con = DbConnection.getConnection();
		} catch (Exception e) {
			System.out.println("Exception " + e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		String app_date = request.getParameter("app_date");
		String bike_number = request.getParameter("bike_number");
		String vehicel_issue = request.getParameter("vehicel_issue");

		HttpSession session = request.getSession();
		String cust_id = session.getAttribute("c_id").toString();

		try 
		{
				PreparedStatement ps1 = con.prepareStatement("INSERT INTO `servicing_request`(`bike_number`, `cust_id`, `vehicle_issue`, `app_date`) VALUES ('"+bike_number+"','"+cust_id+"','"+vehicel_issue+"','"+app_date+"')");
				int i = ps1.executeUpdate();
				if (i > 0) 
				{
					response.sendRedirect("servicingRequest.jsp?send=done");
				} else {
					response.sendRedirect("servicingRequest.jsp?fsend=done");
				}
		} catch (Exception e) 
		{
			System.out.println("Exc " + e);
		}
	}
}