package com.code.admin;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.code.conn.DbConnection;


/**
 * Servlet implementation class AddBikeDetails
 */
@WebServlet("/AddBikeDetails")
public class AddBikeDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	final String UPLOAD_DIRECTORY = "C:/workspace/BikeShowroomApp/WebContent/bike_photos/";
	static int i = 0;

	public void init(ServletConfig config) throws ServletException
	{
		try
		{
			con = DbConnection.getConnection();

		}
		catch (Exception e1) 
		{

			e1.printStackTrace();
		}
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		if (ServletFileUpload.isMultipartContent(request)) 
		{
			try 
			{
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				System.out.println("ABCD");
				String FileName = "";
				String FileExtention = "";
				long FileSize = 0;

				for (FileItem item1 : multiparts)
				{
					if (!item1.isFormField()) 
					{

						System.out.println("4");
						String name = new File(item1.getName()).getName();
						item1.write(new File(UPLOAD_DIRECTORY + File.separator+name));
						FileName = item1.getName();
						FileExtention = item1.getContentType();
						FileSize = item1.getSize();
					}
				}

				String  bike_company = "", about_bike = "", model = "", b_year = "",colors="",fuel_type="";
				
				
				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("bike_company"))
					{
						bike_company = (String) item.getString();
					}
				}
				
				String b_name="";
				
				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("bike_name"))
					{
						b_name = (String) item.getString();
					}
				}
				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("fuel_type"))
					{
						fuel_type = (String) item.getString();
					}
				}
				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("colors"))
					{
						colors = (String) item.getString();
					}
				}

				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("about_bike")) 
					{
						about_bike = (String) item.getString();
					}
				}

				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("model"))
					{
						model = (String) item.getString();
					}
				}

				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("b_year"))
					{
						b_year = (String) item.getString();
					}
				}

				String bike_price="";
				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("bike_price"))
					{
						bike_price = (String) item.getString();
					}
				}

				
				System.out.println("FileName " + FileName);
				System.out.println("File Extension " + FileExtention);
				System.out.println("File Size " + FileSize);
				
				try 
				{
					PreparedStatement ps1 = con.prepareStatement("INSERT INTO `bike_details`(`bike_name`, `bike_company`, `about_bike`, `model`, `b_year`, `colors`, `fuel_type`,`bike_photo`,`bike_price`) VALUES ('"+b_name+"','"+bike_company+"','"+about_bike+"','"+model+"','"+b_year+"','"+colors+"','"+fuel_type+"','"+FileName+"','"+bike_price+"')");
					int rs = ps1.executeUpdate();
					if (rs > 0) 
					{
						System.out.println("Product Insert Done ");
						response.sendRedirect("adminAddBike.jsp?add=product");
					} else 
					{
						System.out.println("Product Not Insert Something Wrong ");
						response.sendRedirect("adminAddBike.jsp?fail=upload");
					}
				} 
				catch (Exception e) 
				{
					System.out.println("Exception e" +e);
				}
			}
			catch (Exception ex) 
			{
				System.out.println("Exception e" +ex);
			}
		}
		else 
		{
			System.out.println("Condition False");
			response.sendRedirect("adminAddBike.jsp?fail=uplaod");
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String b_id = request.getParameter("bid");
		String status="Remove";
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("UPDATE `bike_details` SET status='"+status+"' where b_id='"+b_id+"'");
			int rs = ps1.executeUpdate();
			if (rs > 0) 
			{
				System.out.println("Status Update Done ");
				response.sendRedirect("adminViewBikes.jsp?sts=update");
			} else 
			{
				System.out.println("Status Update fail ");
				response.sendRedirect("adminViewBikes.jsp?fsts=update");
			}
		} 
		catch (Exception e) 
		{
			System.out.println("Exception e" +e);
		}
		
	}
}
