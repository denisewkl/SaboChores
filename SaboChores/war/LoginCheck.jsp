<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        // setting up user list here. 
        HashMap<String, String> map = new HashMap<String, String>();
		map.put("child", "child");
		map.put("parent", "parent");
        
        //retrieving what the user's input here. 
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        
        //retrieving the password for the given password
        String authenticatedPassword = map.get(username);
        
  		//checking for credentials
  		
		if (map.containsKey(username) && authenticatedPassword.equalsIgnoreCase(password) && username.equalsIgnoreCase("child")) {//if this is child, login in as child.
			session.setAttribute("username",username);
            response.sendRedirect("child-dashboard.jsp");
		}else if (map.containsKey(username) && authenticatedPassword.equalsIgnoreCase(password) && username.equalsIgnoreCase("parent")) { //if parent.
			session.setAttribute("username",username);
        	response.sendRedirect("admin-dashboard.jsp");
		}else {//if error in login credentials
			response.sendRedirect("Error.jsp");
		}       
     %>   
    </body>
</html>


