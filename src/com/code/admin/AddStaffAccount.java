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

import com.code.conn.DbConnection;

/**
 * Servlet implementation class AddStaffAccount
 */
@WebServlet("/AddStaffAccount")
public class AddStaffAccount extends HttpServlet {
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
	
		String staff_name= request.getParameter("staff_name");
		
		String gender= request.getParameter("gender");
		
		String mobile= request.getParameter("mobile");
		String address= request.getParameter("address");

		String email= request.getParameter("email");
		String password= request.getParameter("password");
		String acc_type = request.getParameter("acc_type");
		
		System.out.println("Email ID: "+email);
		System.out.println("Password :  "+password);
		
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO `staff_details`(`acc_type`,`staff_name`, `gender`, `mobile`, `email`, `password`, `address`) VALUES ('"+acc_type+"','"+staff_name+"','"+gender+"','"+mobile+"','"+email+"','"+password+"','"+address+"')");
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				System.out.println("Staff Account is Add");
				response.sendRedirect("staffRegistration.jsp?regstaff=done");
			}
			else 
			{
				System.out.println("Staff Registration fail");
				response.sendRedirect("staffRegistration.jsp?fregstaff=fail	");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String id= request.getParameter("id");
		String sts= request.getParameter("sts");
		String status="DeActive";
		if(sts.equals("a"))
		{
			status="Active";
		}
		
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("UPDATE `service_boy` SET acc_status='"+status+"' where id='"+id+"'");
			int i=ps1.executeUpdate();
			if (i>0) 
			{
				response.sendRedirect("adminViewEmp.jsp?update=done");
			}
			else 
			{
				response.sendRedirect("adminViewEmp.jsp?fupdate=done");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}		
	}
		
}