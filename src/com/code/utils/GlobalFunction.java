package com.code.utils;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.code.conn.DbConnection;
import com.code.entity.Accesseries;
import com.code.entity.Finance;
import com.code.entity.Insurance;

public class GlobalFunction {

	
	static Connection con=DbConnection.getConnection();
	
	public HashMap<String,String> getStaffDetails(String staff_id)
	{
		HashMap<String,String> staffDetails=new HashMap<>();
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `staff_details` where staff_id='"+staff_id+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{ 
				staffDetails.put("staff_name", rs.getString("staff_name"));
				staffDetails.put("gender", rs.getString("gender"));
				staffDetails.put("mobile", rs.getString("mobile"));
				staffDetails.put("email", rs. getString("email"));
				staffDetails.put("staff_id", rs.getString("staff_id"));
				staffDetails.put("address", rs.getString("address"));
				staffDetails.put("acc_cdatetime", rs.getString("acc_cdatetime"));
				staffDetails.put("acc_status", rs.getString("acc_status"));
				
			}
			
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return staffDetails;
	}
	
	public HashMap<String,String> getCustomerDetails(String c_id)
	{
		HashMap<String,String> custDetails=new HashMap<>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `customer_details` where c_id='"+c_id+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{ 
				custDetails.put("c_name", rs.getString("c_name"));
				custDetails.put("gender", rs.getString("gender"));
				custDetails.put("mobile", rs.getString("mobile"));
				custDetails.put("email", rs. getString("email"));
				custDetails.put("c_id", rs.getString("c_id"));
				custDetails.put("address", rs.getString("address"));
				custDetails.put("acc_cdatetime", rs.getString("acc_cdatetime"));
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return custDetails;
	}
	
	public HashMap<String,String> getBikeDetails(String b_id)
	{
		HashMap<String,String> bikeDetails=new HashMap<>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `bike_details` where b_id='"+b_id+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{ 
				bikeDetails.put("bike_name", rs.getString("bike_name"));
				bikeDetails.put("bike_company", rs.getString("bike_company"));
				bikeDetails.put("about_bike", rs.getString("about_bike"));
				bikeDetails.put("model", rs. getString("model"));
				bikeDetails.put("b_year", rs.getString("b_year"));
				bikeDetails.put("colors", rs.getString("colors"));
				bikeDetails.put("fuel_type", rs.getString("fuel_type"));
				bikeDetails.put("added_date", rs.getString("added_date"));
				bikeDetails.put("b_id", rs.getString("b_id"));
				bikeDetails.put("bike_photo", rs.getString("bike_photo"));
				bikeDetails.put("status", rs.getString("status"));
				bikeDetails.put("bike_price", rs.getString("bike_price"));
				
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return bikeDetails;
	}
	
	
	
	public HashMap<String,String> getInsutanceDetails(String i_id)
	{
		HashMap<String,String> insuranceDetails=new HashMap<>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `insurance_details` where i_id='"+i_id+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{ 
				insuranceDetails.put("i_id", rs.getString("i_id"));
				insuranceDetails.put("insurance_name", rs.getString("insurance_name"));
				insuranceDetails.put("insurance_included", rs.getString("insurance_included"));
				insuranceDetails.put("ins_provider", rs. getString("ins_provider"));
				insuranceDetails.put("duration", rs.getString("duration"));
				insuranceDetails.put("amount", rs.getString("amount"));
				insuranceDetails.put("bike_id", rs.getString("bike_id"));
				insuranceDetails.put("status", rs.getString("status"));
				
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return insuranceDetails;
	}
	
	public HashMap<String,String> getFinanceDetails(String f_id)
	{
		HashMap<String,String> financeDetails=new HashMap<>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `financial_details` where f_id='"+f_id+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{ 
				financeDetails.put("f_id", rs.getString("f_id"));
				financeDetails.put("finance_duration", rs.getString("finance_duration"));
				financeDetails.put("rate_intrest", rs.getString("rate_intrest"));
				financeDetails.put("addedd_by", rs. getString("addedd_by"));
				financeDetails.put("status", rs.getString("status"));
				
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return financeDetails;
	}
	
	
	
	
	
	
	public HashMap<String,String> getAccesoriesDetails(String a_id)
	{
		HashMap<String,String> accDetails=new HashMap<>();
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `accessories_details` where a_id='"+a_id+"'");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{ 
				accDetails.put("acc_name", rs.getString("acc_name"));
				accDetails.put("a_id", rs.getString("a_id"));
				accDetails.put("bike_id", rs.getString("bike_id"));
				accDetails.put("amount", rs. getString("amount"));
				accDetails.put("status", rs.getString("status"));
				accDetails.put("cdate", rs.getString("cdate"));
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return accDetails;
	}
	
	
	public ArrayList<Insurance> getListOfInsuranceByBikeId(String b_id, String sts)
	{
		ArrayList<Insurance> insuranceDetailsList=new ArrayList<>();
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `insurance_details` where bike_id='"+b_id+"' AND status='"+sts+"'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Insurance insuranceDetails=new Insurance();
				insuranceDetails.setiId(rs.getString("i_id"));
				insuranceDetails.setInsuranceName(rs.getString("insurance_name"));
				insuranceDetails.setInsuranceIncluded(rs.getString("insurance_included"));
				insuranceDetails.setInsProvider(rs.getString("ins_provider"));
				insuranceDetails.setDuration(rs.getString("duration"));
				insuranceDetails.setAmount(rs.getString("amount"));
				insuranceDetails.setBikeId(rs.getString("bike_id"));
				insuranceDetails.setStatus(rs.getString("status"));
				
				insuranceDetails.setStatus(rs.getString("added_by"));
				
				insuranceDetailsList.add(insuranceDetails);			}
			
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return insuranceDetailsList;
	}
	
	public ArrayList<Accesseries> getListOfAccessoriesByBikeId(String b_id, String sts)
	{ 
		ArrayList<Accesseries> accessories=new ArrayList<>();
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `accessories_details` where bike_id='"+b_id+"' AND status='"+sts+"'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Accesseries accesseriesDetails=new Accesseries();
				accesseriesDetails.setaId(rs.getString("a_id"));
				accesseriesDetails.setAccName(rs.getString("acc_name"));
				accesseriesDetails.setBikeId(rs.getString("bike_id"));
				accesseriesDetails.setAmount(rs.getString("amount"));
				accesseriesDetails.setAdded_by(rs.getString("added_by"));
				accesseriesDetails.setStatus(rs.getString("status"));
				accessories.add(accesseriesDetails);			
			}
			
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return accessories;
	}

	public ArrayList<Finance> 	getListOfFinanseByBikeId(String b_id,String sts)
	{
		ArrayList<Finance> financeDetailsList=new ArrayList<>();
		
		try 
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `financial_details` where bike_id='"+b_id+"' AND status='"+sts+"'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Finance financeDetails=new Finance();
				financeDetails.setfId(rs.getString("f_id"));
				financeDetails.setBikeId(rs.getString("bike_id"));
				financeDetails.setFinanceDuration(rs.getString("finance_duration"));
				financeDetails.setRateOfInterest(rs.getString("rate_intrest"));
				financeDetails.setAddedBy(rs.getString("addedd_by"));
				financeDetails.setStatus(rs.getString("status"));
				
				financeDetailsList.add(financeDetails);			}
			
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return financeDetailsList;
	}

	
	
	
}
