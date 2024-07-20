<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%

if(request.getParameter("ins")!=null)
{
	out.print("<script>alert('Add Successfully')</script>");
}
if(request.getParameter("fins")!=null)
{
	out.print("<script>alert('Insertion Fail')</script>");
}

if(request.getParameter("rm")!=null)
{
	out.print("<script>alert('Remove Successfully')</script>");
}
if(request.getParameter("frm")!=null)
{
	out.print("<script>alert('Remove Fail')</script>");
}

if(request.getParameter("logout")!=null)
{
	out.print("<script>alert('Logout Successfully..!')</script>");
}

if(request.getParameter("add")!=null)
{
	out.print("<script>alert('Add Bike Successfully')</script>");
}
if(request.getParameter("fail")!=null)
{
	out.print("<script>alert('fail please try Again..!')</script>");
}

if(request.getParameter("sts")!=null)
{
	out.print("<script>alert('Status Update Successfully')</script>");
}
if(request.getParameter("fail")!=null)
{
	out.print("<script>alert('Status Not Update.!')</script>");
}

if(request.getParameter("regstaff")!=null)
{
	out.print("<script>alert('Staff Account Create Successfully')</script>");
}
if(request.getParameter("fregstaff")!=null)
{
	out.print("<script>alert('Staff Account not Created...!')</script>");
}


if(request.getParameter("update")!=null)
{
	out.print("<script>alert('Update Successfully')</script>");
}
if(request.getParameter("fupdate")!=null)
{
	out.print("<script>alert('Update Operation Fail...!')</script>");
}

if(request.getParameter("login")!=null)
{
	out.print("<script>alert('Login Successfully..!')</script>");
}

if(request.getParameter("flogin")!=null)
{
	out.print("<script>alert('Incorrect Login Credentials..!')</script>");
}

if(request.getParameter("add")!=null)
{
	out.print("<script>alert('Add Successfully..!')</script>");
}

if(request.getParameter("fadd")!=null)
{
	out.print("<script>alert('Fail..!')</script>");
}

if(request.getParameter("already")!=null)
{
	out.print("<script>alert('Already Addedd..!')</script>");
}

if(request.getParameter("regcust")!=null)
{
	out.print("<script>alert('Registration Successfully')</script>");
}
if(request.getParameter("fregcust")!=null)
{
	out.print("<script>alert('Service Boy Acc Add Successfully')</script>");
}

if(request.getParameter("send")!=null)
{
	out.print("<script>alert('Request Send Successfully...!')</script>");
}
if(request.getParameter("fsend")!=null)
{
	out.print("<script>alert('Request Sending Fail...!')</script>");
}

if(request.getParameter("req")!=null)
{
	out.print("<script>alert('Request Send Successfully...!')</script>");
}

if(request.getParameter("freq")!=null)
{
	out.print("<script>alert('Request Sending Fail...!')</script>");
}


if(request.getParameter("rm")!=null)
{
	out.print("<script>alert('Remove Successfully...!')</script>");
}

if(request.getParameter("frm")!=null)
{
	out.print("<script>alert('Remove Operation Fail...!')</script>");
}















if(request.getParameter("freg")!=null)
{
	out.print("<script>alert('Registration Fail')</script>");
}



if(request.getParameter("add")!=null)
{
	out.print("<script>alert('Record Stored Successfully..!')</script>");
}

if(request.getParameter("fadd")!=null)
{
	out.print("<script>alert('Record Not Stored..!')</script>");
}

if(request.getParameter("update")!=null)
{
	out.print("<script>alert('Update Successfully..!')</script>");
}

if(request.getParameter("fupdate")!=null)
{
	out.print("<script>alert('Update Fail..!')</script>");
}


if(request.getParameter("download")!=null)
{
	out.print("<script>alert('Jobcart Download Successfully..!')</script>");
}

if(request.getParameter("fdownload")!=null)
{
	out.print("<script>alert('Jobcart download Fail..!')</script>");
}


if(request.getParameter("sts")!=null)
{
	out.print("<script>alert('Status Update Successfully..!')</script>");
}

if(request.getParameter("fsts")!=null)
{
	out.print("<script>alert('Status Update Fail..!')</script>");
}

if(request.getParameter("rsp")!=null)
{
	out.print("<script>alert('Response Update Successfully..!')</script>");
}

if(request.getParameter("frsp")!=null)
{
	out.print("<script>alert('Response Update Fail..!')</script>");
}

if(request.getParameter("payment")!=null)
{
	out.print("<script>alert('Payment Completed Successfully..!')</script>");
}

if(request.getParameter("fpayment")!=null)
{
	out.print("<script>alert('Payment Fail..!')</script>");
}

if(request.getParameter("fail")!=null)
{
	out.print("<script>alert('Please Check Selected Date, it's Wrong..!')</script>");
}

if(request.getParameter("notable")!=null)
{
	out.print("<script>alert('Not Able to Add Records..!')</script>");
}




if(request.getParameter("delete")!=null)
{
	out.print("<script>alert('Record Remove Successfully..!')</script>");
}
if(request.getParameter("fdelete")!=null)
{
	out.print("<script>alert('Record Remove Fail..!')</script>");
}


if(request.getParameter("nremove")!=null)
{
	out.print("<script>alert('Notification Remove Successfully..!')</script>");
}
if(request.getParameter("fnremove")!=null)
{
	out.print("<script>alert('Notification Remove Fail..!')</script>");
}

if(request.getParameter("notify")!=null)
{
	out.print("<script>alert('Notification sent Successfully..!')</script>");
}
if(request.getParameter("fnotify")!=null)
{
	out.print("<script>alert('Notification Sending Fail..!')</script>");
}


if(request.getParameter("reqc")!=null)
{
	out.print("<script>alert('Request Cancel Successfully..!')</script>");
}

if(request.getParameter("freq")!=null)
{
	out.print("<script>alert('Request canceling Fail..!')</script>");
}

if(request.getParameter("req")!=null)
{
	out.print("<script>alert('Request Sent Successfully..!')</script>");
}

if(request.getParameter("freq")!=null)
{
	out.print("<script>alert('Request sending Fail..!')</script>");
}



if(request.getParameter("veh")!=null)
{
	out.print("<script>alert('Vehicle Add Successfully..!')</script>");
}

if(request.getParameter("fveh")!=null)
{
	out.print("<script>alert('Vehicle Not Add..!')</script>");
}

if(request.getParameter("dveh")!=null)
{
	out.print("<script>alert('Vehicle Partially Deleted Successfully..!')</script>");
}

if(request.getParameter("fdveh")!=null)
{
	out.print("<script>alert('Vehicle delete Operation Fail..!')</script>");
}
if(request.getParameter("feedback")!=null)
{
	out.print("<script>alert('Feedback Sent Successfully..!')</script>");
}

if(request.getParameter("ffeedback")!=null)
{
	out.print("<script>alert('Feedback Not Send..!')</script>");
}



%>


