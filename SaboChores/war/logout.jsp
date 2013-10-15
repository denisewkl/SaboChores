<%@include file="header-admin.jsp" %>
<%
session.invalidate();
response.sendRedirect("index.jsp");
%>