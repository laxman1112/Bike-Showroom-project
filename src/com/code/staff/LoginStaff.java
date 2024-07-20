package com.code.staff;

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
 * Servlet implementation class LoginStaff
 */
@WebServlet("/LoginStaff")
public class LoginStaff extends HttpServlet {
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
		String acc_type = request.getParameter("acc_type");
	
		System.out.println("email "+email);
		System.out.println("Password "+password);
		
		HttpSession session = request.getSession();

		try 
		{
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `staff_details` WHERE email='"+ email+ "' AND password='" + password + "' AND acc_type='"+acc_type+"'");
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) 
			{
				session.setAttribute("email", email);
				session.setAttribute("staff_id", rs.getString("staff_id"));
				session.setAttribute("staff_name", rs.getString("staff_name"));
				session.setAttribute("u_type", rs.getString("acc_type"));
				System.out.println("Login Successful..");
				response.sendRedirect("staffHome.jsp?login=done");
			}
			else 
			{
				System.out.println("Login Fail");
				response.sendRedirect("employeeLogin.jsp?flogin=login");
			}

		} catch (Exception e) 
		{
			System.out.println("Exeception Occure:-" + e);
			response.sendRedirect("employeeLogin.jsp");
		}
	}
}
