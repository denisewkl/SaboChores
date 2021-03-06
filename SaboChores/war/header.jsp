<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="entity.*" %>
<%@ page import="manager.*" %>
<%@ page import="java.util.*" %>

<html>
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
<script type="text/javascript">
 
$(document).ready(function(){
//open popup
$("#pop").click(function(){
$("#overlay_form").fadeIn(1000);
positionPopup();
});
 
//close popup
$("#close").click(function(){
$("#overlay_form").fadeOut(500);
});
});
 
//position the popup at the center of the page
function positionPopup(){
if(!$("#overlay_form").is(':visible')){
return;
}

}
 
//maintain the popup at center of the page when browser resized
$(window).bind('resize',positionPopup);
 
</script>

<script type="text/javascript">
 
$(document).ready(function(){
//open popup
$("#pop2").click(function(){
$("#overlay_form2").fadeIn(1000);
positionPopup();
});
 
//close popup
$("#close2").click(function(){
$("#overlay_form2").fadeOut(500);
});
});
 
//position the popup at the center of the page
function positionPopup(){
if(!$("#overlay_form2").is(':visible')){
return;
}

}
 
//maintain the popup at center of the page when browser resized
$(window).bind('resize',positionPopup);
 
</script>



</head>
<body>



	<!-- HEADER -->
	
	<%
	//retrieving the username from the session.
	Child currentChild = (Child)session.getAttribute("username");
	
	ShopManager shopMgr = ShopManager.getInstance();
	FamilyManager familyMgr = FamilyManager.getInstance();
	ChoreManager choreMgr = ChoreManager.getInstance();
		
	if (currentChild==null) {
    	response.sendRedirect("index.jsp");
   		return;
    }
	%>
	
	<header>
		
		<!-- header wrapper -->
		<div class="wrapper cf">
			<div id="logo">
				<table border="1" width="100%" font size="8px";>
					<form action = "logoutChild.jsp" method = "post">
					
					
					
					
					
					<tr>
						<td>&nbsp</td>
						<td>&nbsp</td>
					</tr>
					<tr>
						<td align = "left">
							Title: <%=currentChild.getTitle()%> <br />
							Empire: <%=currentChild.getEmpire()%> <br />
							Points: <%=currentChild.getPoints()%> <br />
							$ Tix: <%=currentChild.getMoneyTix()%> <br />
							Sabo Tix: <%=currentChild.getSaboTix()%> <br />
						</td>
						<td align = "right">Welcome, <%=currentChild.getUserName()%><br/> <input type = "submit" value = "Logout" /></td>
					</tr>
					<tr>
						<td>&nbsp</td>
						<td>&nbsp</td>
					</tr>
					
					</form>
				</table>		
				
			</div>
		</div><!-- ENDS header wrapper -->
		
		
		
		<!-- nav -->
		<nav class="cf">
			<div class="wrapper cf">
				<ul id="nav" class="sf-menu">
					<li class="current-menu-item"><a href="child-dashboard.jsp">DASHBOARD<i><b></b></i></a></li>
					<li><a href="child-profile.jsp">PROFILE<i><b></b></i></a>
					<li><a href="child-shop.jsp">SHOP<i><b></b></i></a></li>
					<li><a href="child-faq.jsp">FAQ<i><b></b></i></a></li>
				</ul>
				<div id="combo-holder"></div>
			</div>
		</nav>
		<!-- ends nav -->
			
	</header>
	<!-- ENDS HEADER -->