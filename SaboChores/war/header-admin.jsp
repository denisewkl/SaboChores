<%@ page import="controller.*"%>
<%@ page import="entity.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="manager.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%@ page import="entity.Parent" %>

<meta charset="utf-8">
	
	
	
	<title>Sabo Chores</title>
	<meta name="description" content="">
	
	<!-- Mobile viewport optimized: h5bp.com/viewport -->
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	
	<link rel="stylesheet" media="screen" href="css/superfish.css" /> 
	<link rel="stylesheet" href="css/nivo-slider.css" media="all"  /> 
	<link rel="stylesheet" href="css/tweet.css" media="all"  />
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" media="all" href="css/lessframework.css"/>
	
	<!-- All JavaScript at the bottom, except this Modernizr build.
	   Modernizr enables HTML5 elements & feature detects for optimal performance.
	   Create your own custom Modernizr build: www.modernizr.com/download/ -->
	<script src="js/modernizr-2.5.3.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	
	<script type="text/javascript">
function toggle(Info) {
  var CState = document.getElementById(Info);
  CState.style.display = (CState.style.display != 'block')
                       ? 'block' : 'none';
}
</script>

	<script>
	function goBack()
	  {
	  window.history.back()
	  }
	</script>
	
</head>
<body>
<%
       //retrieving the username from the session.
		Parent currentParent = (Parent)session.getAttribute("username");

       if (currentParent==null) {
                response.sendRedirect("index.jsp");
                return;
      	}
	
   	ShopManager shopMgr = ShopManager.getInstance();
   	FamilyManager familyMgr = FamilyManager.getInstance();
   	ChoreManager choreMgr = ChoreManager.getInstance();
%>


	<!-- HEADER -->
	<header>
		<%
		
		
	
	

		%>
		<!-- header wrapper -->
		<div class="wrapper cf">
			<div id="logo">
				<table border="1" width="100%" font size="8px";>
				
				<tr>
				<td>&nbsp</td>
				<td>&nbsp</td>
				</tr>
				<tr>
				<td>&nbsp</td>
				<td>&nbsp</td>
				</tr>
				<tr>
				<td>Welcome, <%= currentParent.getUserName()%>&nbsp</td>
				<td></td>
				</tr>
				<tr>
				<td>Empire: <%= currentParent.getEmpire()%></td>
				<td><a href="logout.jsp">Logout</a></td>
				</tr>
				<tr>
				<td>&nbsp</td>
				<td>&nbsp</td>
				</tr>
				<tr>
				<td>&nbsp</td>
				<td>&nbsp</td>
				</tr>
				</table>

				
			</div>
		</div><!-- ENDS header wrapper -->
		
		
		
		<!-- nav -->
		<nav class="cf">
			<div class="wrapper cf">
				<ul id="nav" class="sf-menu">
					<li class="current-menu-item"><a href="admin-dashboard.jsp">DASHBOARD<i><b></b></i></a></li>
					<li><a href="admin-member.jsp">MEMBER MANAGEMENT<i><b></b></i></a></li>
					<li><a href="admin-rewards.jsp">View Child Rewards<i><b></b></i></a></li>
					<li><a href="admin-faq.jsp">FAQ<i><b></b></i></a></li>				</ul>
				<div id="combo-holder"></div>
			</div>
		</nav>
		<!-- ends nav -->
			
	</header>
	<!-- ENDS HEADER -->