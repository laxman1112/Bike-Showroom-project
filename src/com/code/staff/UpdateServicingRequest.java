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
 * Servlet implementation class UpdateServicingRequest
 */
@WebServlet("/UpdateServicingRequest")
public class UpdateServicingRequest extends HttpServlet {
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
		
			String sreq_id = request.getParameter("sid");
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
				PreparedStatement ps1 = con.prepareStatement("UPDATE `servicing_request` SET  status='"+status+"',staff_id='"+staff_id+"' where sreq_id='"+sreq_id+"'");
				int i=ps1.executeUpdate();
				if (i>0) 
				{
					response.sendRedirect("staffViewServicingReq.jsp?update=done");
				}
				else 
				{
					response.sendRedirect("staffViewServicingReq.jsp?rupdate=done");
				}
			}
			catch (Exception e) 
			{
				System.out.println("Exc "+e);
			}
	}		
}