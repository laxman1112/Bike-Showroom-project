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
 * Servlet implementation class UpdateTestRideRequest
 */
@WebServlet("/UpdateTestRideRequest")
public class UpdateTestRideRequest extends HttpServlet {
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
		
			String rrid = request.getParameter("rrid");
			String sts = request.getParameter("sts");
			String status="Accept";
			if(sts.equals("r"))
			{
				status="Reject";
			}
			

			HttpSession session=request.getSession();
			String staff_id = session.getAttribute("staff_id").toString();
			
			
			
			try 
			{
				PreparedStatement ps1 = con.prepareStatement("UPDATE `riding_request`SET status='"+status+"',staff_id='"+staff_id+"' where rr_id='"+rrid+"'");
				int i=ps1.executeUpdate();
				if (i>0) 
				{
					response.sendRedirect("staffViewTestRideReqDetails.jsp?update=done");
				}
				else 
				{
					response.sendRedirect("staffViewTestRideReqDetails.jsp?rupdate=done");
				}
			}
			catch (Exception e) 
			{
				System.out.println("Exc "+e);
			}
	}		
}