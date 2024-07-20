package com.code.customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.util.resources.LocaleData;

import com.code.conn.DbConnection;

/**
 * Servlet implementation class TestRideRequest
 */
@WebServlet("/TestRideRequest")
public class TestRideRequest extends HttpServlet {
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
		
		if(request.getParameter("rrid")!=null)
		{
			String rrid = request.getParameter("rrid");
			try 
			{
				PreparedStatement ps1 = con.prepareStatement("UPDATE `riding_request`SET status='Cancel' where rr_id='"+rrid+"'");
				int i=ps1.executeUpdate();
				if (i>0) 
				{
					System.out.println("Test Ride Request Send ");
					response.sendRedirect("custViewBikes.jsp?req=send");
				}
				else 
				{
					System.out.println("Staff Registration fail");
					response.sendRedirect("custViewBikes.jsp?freq=send");
				}
			}
			catch (Exception e) 
			{
				System.out.println("Exc "+e);
			}

		}
		else
		{
			String bike_id= request.getParameter("bid");
			String cDate = LocalDate.now().toString();
			HttpSession session=request.getSession();
			String cust_id = session.getAttribute("c_id").toString();
			try 
			{
				
				PreparedStatement ps2 = con.prepareStatement("SELECT * FROM `riding_request` WHERE c_id='"+ cust_id+ "' AND b_id='" + bike_id + "'");
				ResultSet rs2 = ps2.executeQuery();
				if (!rs2.next()) 
				{
					PreparedStatement ps1 = con.prepareStatement("INSERT INTO `riding_request`(`c_id`, `b_id`, `req_date`) VALUES ('"+cust_id+"','"+bike_id+"','"+cDate+"')");
					int i=ps1.executeUpdate();
					if (i>0) 
					{
						System.out.println("Test Ride Request Send ");
						response.sendRedirect("custViewBikes.jsp?req=send");
					}
					else 
					{
						System.out.println("Staff Registration fail");
						response.sendRedirect("custViewBikes.jsp?freq=send");
					}
				}
				else {
					response.sendRedirect("custViewBikes.jsp?already=send");
				}
			}
			catch (Exception e) 
			{
				System.out.println("Exc "+e);
			}
		}
	}		
}