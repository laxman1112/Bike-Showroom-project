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
 * Servlet implementation class CustomerLogin
 */
@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static Connection con = null;

	public void init(ServletConfig config) throws ServletException {
		try 
		{
			con = DbConnection.getConnection();
		} 
		catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String email = request.getParameter("email");
		String password = request.getParameter("password");
	
		System.out.println("email "+email);
		System.out.println("Password "+password);
		
		HttpSession session = request.getSession();

		try 
		{
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `customer_details` WHERE email='"+ email + "' AND password='" + password + "'");
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) 
			{
				session.setAttribute("email", email);
				session.setAttribute("u_type", "Customer");
				session.setAttribute("c_name", rs.getString("c_name"));
				session.setAttribute("c_id", rs.getString("c_id"));
				System.out.println("Login Successful..");
				response.sendRedirect("customerHome.jsp?login=done");
			}
			else 
			{
				System.out.println("Login Fail");
				response.sendRedirect("customerLogin.jsp?flogin=fail");
			}

		} catch (Exception e) 
		{
			System.out.println("Exeception Occure:-" + e);
			response.sendRedirect("customerLogin.jsp");
		}
	}
}
