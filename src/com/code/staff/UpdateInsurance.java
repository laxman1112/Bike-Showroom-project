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
 * Servlet implementation class UpdateInsurance
 */
@WebServlet("/UpdateInsurance")
public class UpdateInsurance extends HttpServlet {
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
		
		String i_id= request.getParameter("id");
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("UPDATE `insurance_details` SET status='Remove' where i_id='"+i_id+"'");
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				response.sendRedirect("viewInsuranceDetails.jsp?rm=done");
			}
			else 
			{
				response.sendRedirect("viewInsuranceDetails.jsp?frm=fail");
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
