<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        
        if((username.equals("rafael") && password.equals("password")))
            {
            session.setAttribute("username",username);
            response.sendRedirect("child-dashboard.jsp");
            }
        else if((username.equals("denise") && password.equals("password")))
        {
        session.setAttribute("username",username);
        response.sendRedirect("admin-dashboard.jsp");
        }
        else
            response.sendRedirect("Error.jsp");
        %>
    </body>
</html>


