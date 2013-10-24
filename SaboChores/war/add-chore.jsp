<%@include file="header-admin.jsp" %>


			

	
	<!-- MAIN -->
	<div role="main" id="main">
		<div class="wrapper">

	 	<h2 class="heading" align="center">Add Chore</h2>
<form action="choreCheck.jsp">
	 	<table width="100%">
	 	<thead><h5>Chores</h5></thead>
	 	<tr>
	 	<td>Name of Chore: </td>
	 	<td><input type="text" name="nChore"/></td>
	 	</tr>
	 	<tr>
	 	<td>Points allocated: </td>
	 	<td><input type="number" name="points" id="points" min="1" max="20" step="1" value="0"></td>
	 	</tr>
	 	</table>
	 	<p>
	 	<table width="100%">
	 	<tr>
	 	<td><input type="button" value="Back" onclick="JavaScript:window.location='admin-dashboard.jsp';"></td>
	 	<td><input type="submit" value="Confirm" id="submit" /></td>
	 	</tr>
	  	</table>
	  	</form>
	  	</p>
	  
		<%
		
		String errorMsg=(String)session.getAttribute("error");
		if(errorMsg!=null){
			 out.println(errorMsg);
			session.removeAttribute("error");
		}
		
		%>
	  </div>
	</div>
	<!-- ENDS MAIN -->
	
	<footer>
	
		<!-- wrapper -->
		<div class="wrapper cf">

	</footer>

<!-- JavaScript at the bottom for fast page loading -->
	
	<!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if offline -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.7.1.min.js"><\/script>')</script>
	
	<!-- scripts concatenated and minified via build script -->
	<script src="js/custom.js"></script>
	
	<!-- superfish -->
	<script  src="js/superfish-1.4.8/js/hoverIntent.js"></script>
	<script  src="js/superfish-1.4.8/js/superfish.js"></script>
	<script  src="js/superfish-1.4.8/js/supersubs.js"></script>
	<!-- ENDS superfish -->
	
	<script src="js/tweet/jquery.tweet.js" ></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/jquery.nivo.slider.js" ></script>
	<script src="js/css3-mediaqueries.js"></script>
	<script src="js/tabs.js"></script>
	<script  src="js/poshytip-1.1/src/jquery.poshytip.min.js"></script>
	<!-- end scripts -->

</body>
</html>