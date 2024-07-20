package com.code.staff;

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
 * Servlet implementation class AddFinancialsOffers
 */
@WebServlet("/AddFinancialsOffers")
public class AddFinancialsOffers extends HttpServlet {
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
	
		String duration= request.getParameter("duration");
		
		String bike_id= request.getParameter("bike_id");
		
		String rate_intrest= request.getParameter("rate_intrest");
 		
		HttpSession session=request.getSession();
		String staff_id = session.getAttribute("staff_id").toString();
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO `financial_details`(`bike_id`, `finance_duration`, `rate_intrest`, `addedd_by`) VALUES ('"+bike_id+"','"+duration+"','"+rate_intrest+"','"+staff_id+"')");
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				System.out.println("Finance Offer is Add");
				response.sendRedirect("staffAddFinance.jsp?bid="+bike_id+"&ins=add");
			}
			else 
			{
				System.out.println("Finance Offer Adding fail");
				response.sendRedirect("staffAddFinance.jsp?bid="+bike_id+"&fins=add");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String f_id= request.getParameter("id");
		String bike_id= request.getParameter("bid");
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("UPDATE `financial_details` SET status='Remove' where f_id='"+f_id+"'");
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				response.sendRedirect("staffAddFinance.jsp?bid="+bike_id+"&rm=done");
			}
			else 
			{
				response.sendRedirect("staffAddFinance.jsp?bid="+bike_id+"&frm=fail");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}		
	}
}