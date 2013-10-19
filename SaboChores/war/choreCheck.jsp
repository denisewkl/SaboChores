<%@include file="header-admin.jsp" %>
<%@ page import="java.util.*" %>
<%
	String chore=request.getParameter("nChore");
	String points=request.getParameter("points");
	Chore c=new Chore(choreMgr.getAllChores().size()+1,chore,"Available",Integer.parseInt(points),"","",currentParent.getEmpire());


	
	String error="";
	
	
		if(chore!=null && points!=null && !points.equals("0")){
			

	
			choreMgr.addChore(c);
			error="Chore Added!";
		}
		else{
			
			error="Enter chore  and points cannot be 0.";
			
		}
	session.setAttribute("error",error);
	response.sendRedirect("add-chore.jsp");
	

	%>