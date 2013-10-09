<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="entity.Child" %>
<%@ page import="entity.Parent" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
        //creating all the child out first.
		Child rafael = new Child("rafael","rafael","Sabo Kid","Empire 1", 10, 10, 10);
		Child agurz = new Child("agurz","agurz","Good Kid","Empire 2", 100, 1000, 10000);
		Child freda = new Child("freda","freda","Angel","Empire 2", 100, 100, 1000);
		
		//String username, String password, String empire
		Parent denise = new Parent("denise","denise","Empire 1");
		
		//creating all the parent out first.
		
        
        // setting up password here. 
        HashMap<String, Object> map = new HashMap<String, Object>();
		map.put(rafael.getUserName(), rafael);
		map.put(agurz.getUserName(), agurz);
		map.put(freda.getUserName(), freda);
		map.put(denise.getUserName(), denise);
				       
        //retrieving what the user's input here. 
        String username=request.getParameter("username");
        String password=request.getParameter("password");
   
        if (map.get(username) instanceof Child) { //if child comes here.
        	
        	Child currentChild = (Child)map.get(username);
        	
        	if (currentChild.getUserName().equalsIgnoreCase(username) && currentChild.getPassword().equalsIgnoreCase(password)){
        		session.setAttribute("username",currentChild);
            	response.sendRedirect("child-dashboard.jsp");
        	} else {
        		System.out.println("Child, wrong credentials.");
        		response.sendRedirect("Error.jsp");
        	}
        	
        } else if (map.get(username) instanceof Parent) { //if parent comes here.
        	
        	Parent currentParent = (Parent)map.get(username);
        	
        	if (currentParent.getUserName().equalsIgnoreCase(username) && currentParent.getPassword().equalsIgnoreCase(password)){
        		session.setAttribute("username",currentParent);
        		response.sendRedirect("admin-dashboard.jsp");
        	} else {
        		System.out.println("Parent, wrong credentials.");
        		response.sendRedirect("Error.jsp");
        	}
        	
        }
     
     %>   
    </body>
</html>


