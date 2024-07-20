package com.code.customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.conn.DbConnection;

/**
 * Servlet implementation class CustomerRegistration
 */
@WebServlet("/CustomerRegistration")
public class CustomerRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection con;
	public void init(ServletConfig config) throws ServletException 
	{
		try 
		{
			con=DbConnection.getConnection();
		} 
		catch (Exception e) 
		{
			System.out.println("Exception "+e);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		String c_name= request.getParameter("cust_name");
		
		String gender= request.getParameter("gender");
		
		String mobile= request.getParameter("mobile");
		String address= request.getParameter("address");

		String email= request.getParameter("email");
		String password= request.getParameter("password");
		
		System.out.println("Email ID: "+email);
		System.out.println("Password :  "+password);
		
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO `customer_details`(`c_name`, `gender`, `mobile`, `email`, `address`, `password`) VALUES ('"+c_name+"','"+gender+"','"+mobile+"','"+email+"','"+address+"','"+password+"')");
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				System.out.println("Staff Account is Add");
				response.sendRedirect("customerLogin.jsp?regcust=don");
			}
			else 
			{
				System.out.println("Staff Registration fail");
				response.sendRedirect("customerRegistration.jsp?fregcust=don");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}		
}