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
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		String bike_id= request.getParameter("bid");
		
		HttpSession session=request.getSession();
		String cust_id = session.getAttribute("c_id").toString();
	
		
		try 
		{
			PreparedStatement ps2 = con.prepareStatement("SELECT * FROM `selling_details` WHERE cust_id='"+ cust_id+ "' AND bike_id='" + bike_id + "'");
			ResultSet rs2 = ps2.executeQuery();
			if (!rs2.next()) 
			{
			
				PreparedStatement ps1 = con.prepareStatement("INSERT INTO `selling_details`(`cust_id`, `bike_id`) VALUES ('"+cust_id +"','"+bike_id+"')");
				int i=ps1.executeUpdate();
				if (i>0) 
				{
					response.sendRedirect("custViewBikes.jsp?add=done");
				}
				else 
				{
					response.sendRedirect("custViewBikes.jsp?fadd=done");
				}
			}
			else
			{
				response.sendRedirect("custViewBikes.jsp?already=addedd");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}		
}