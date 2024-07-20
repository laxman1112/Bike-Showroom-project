package com.code.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.conn.DbConnection;

/**
 * Servlet implementation class AddAccessoriesDetails
 */
@WebServlet("/AddAccessoriesDetails")
public class AddAccessoriesDetails extends HttpServlet {
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
	
		String bike_id= request.getParameter("bike_id");
		
		String accessories_name= request.getParameter("accessories_name");
		
		String amount= request.getParameter("amount");
		HttpSession session=request.getSession();
		String staff_id = session.getAttribute("staff_id").toString();
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO `accessories_details`(`acc_name`, `bike_id`, `amount`,`added_by`) VALUES ('"+accessories_name+"','"+bike_id+"','"+amount+"','"+staff_id+"')");
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				System.out.println("Accesseroies is Add");
				response.sendRedirect("staffAddAccessories.jsp?bid="+bike_id+"&ins=add");
			}
			else 
			{
				System.out.println("Acc Adding fail");
				response.sendRedirect("staffAddAccessories.jsp?bid="+bike_id+"&fins=add");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String a_id= request.getParameter("id");
		String bike_id= request.getParameter("bid");
		
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("UPDATE `accessories_details` SET status='Remove' where a_id='"+a_id+"'");
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				response.sendRedirect("staffAddAccessories.jsp?bid="+bike_id+"&rm=done");
			}
			else 
			{
				response.sendRedirect("staffAddAccessories.jsp?bid="+bike_id+"&frm=fail");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}		
	}
}