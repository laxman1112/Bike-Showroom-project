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

import com.code.conn.DbConnection;

/**
 * Servlet implementation class UpdateFinanceOffer
 */
@WebServlet("/UpdateFinanceOffer")
public class UpdateFinanceOffer extends HttpServlet {
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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String f_id= request.getParameter("id");
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("UPDATE `financial_details` SET status='Remove' where f_id='"+f_id+"'");
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				response.sendRedirect("viewFinanceDetails.jsp?rm=done");
			}
			else 
			{
				response.sendRedirect("viewFinanceDetails.jsp?frm=fail");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
