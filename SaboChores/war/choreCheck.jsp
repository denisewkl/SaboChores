<%@ page import="java.util.*" %>
<%
	String chore=request.getParameter("nChore");
	String points=request.getParameter("points");
	String forArrayInput=chore+","+points+",Available";
	ArrayList<String> list=(ArrayList<String>)session.getAttribute("choreList");
	String error="";
	
	
		if(chore!=null && points!=null && !points.equals("0")){
			

			System.out.println(list.toString());
	
			list.add(forArrayInput);
			error="Chore Added!";
		}
		else{
			
			error="Enter chore  and points cannot be 0.";
			
		}
	session.setAttribute("error",error);
	session.setAttribute("choreList",list);
	response.sendRedirect("add-chore.jsp");
	%>