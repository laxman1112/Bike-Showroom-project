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
 * Servlet implementation class AddInsurancePlan
 */
@WebServlet("/AddInsurancePlan")
public class AddInsurancePlan extends HttpServlet {
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
	
		String insurance_name= request.getParameter("insurance_name");
		
		String bike_id= request.getParameter("bike_id");
		
		String insurance_included= request.getParameter("insurance_included");
		String ins_provider= request.getParameter("ins_provider");

		String duration= request.getParameter("duration");
		String amount= request.getParameter("amount");
		
		
		HttpSession session=request.getSession();
		String staff_id = session.getAttribute("staff_id").toString();
		
		
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO `insurance_details`(`insurance_name`, `insurance_included`, `ins_provider`, `duration`, `amount`, `bike_id`,`added_by`) VALUES ('"+insurance_name+"','"+insurance_included+"','"+ins_provider+"','"+duration+"','"+amount+"','"+bike_id+"','"+staff_id+"')");
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				System.out.println("Staff Account is Add");
				response.sendRedirect("staffAddInsurance.jsp?bid="+bike_id+"&ins=add");
			}
			else 
			{
				System.out.println("Staff Registration fail");
				response.sendRedirect("staffAddInsurance.jsp?bid="+bike_id+"&fins=add");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String i_id= request.getParameter("id");
		String bike_id= request.getParameter("bid");
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("UPDATE `insurance_details` SET status='Remove' where i_id='"+i_id+"'");
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				response.sendRedirect("staffAddInsurance.jsp?bid="+bike_id+"&rm=done");
			}
			else 
			{
				response.sendRedirect("staffAddInsurance.jsp?bid="+bike_id+"&frm=fail");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}		
	}
}