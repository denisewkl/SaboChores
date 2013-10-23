<%@include file="header-admin.jsp" %>

<script type="text/javascript">
 
function showform(a)
{
	if(a==1)
    	document.getElementById("overlay_form").style.display="block";
      
	else
		document.getElementById("overlay_form").style.display="none";
}
 
//maintain the popup at center of the page when browser resized

 
</script>

	<!-- MAIN -->
	<div role="main" id="main">
		<div class="wrapper">
			
	 	<h2 class="heading" align="center">Dashboard</h2>
	 	
	 	<%
	 	//getting the list of chores that belongs to this currentParent empire.
	 	List<Chore> uncompletedChores = choreMgr.getAllNotCompletedChoresUnderThisEmpire(currentParent.getEmpire());
	 	List<Chore> completedChores = choreMgr.getAllCompletedChoresUnderThisEmpire(currentParent.getEmpire());
	 	%>
	 	
	 	
	 	<!-- Pending chores -->
	  	<form action = "/adminChoreCheck" method = "post">
	  		
	  		<!-- To check whether is it completed chores or uncompleted chores -->
	  		<input type = "hidden" name = "choreCheckType" value = "pendingChores" />
	  		
	  		
		 	<table width="100%">
		 		<thead><h5>Chores to approve</h5></thead>
			 	<%
			 	for(Chore c: completedChores){
				%>
			 		<tr>
					 	<td><input type="checkbox" name="chore" value='<%=c.getChoreID() %>'><%=c.getTaskDescription() %></td>
					 	<td><input type="submit" name="status" value="To approve?"></td>
					 	<td><%=c.getChorePoints() %> points</td>
				 	</tr>
		 		<%}%>
		 	</table>
	  		  	
	  	</form>
	  	<p></p>
	  	
	  	<!-- End of completed chores -->
	  	
	  	
	  	
	  	
	  	
	  	

	  	
	 	<!-- Uncompleted Chores -->
		<form action = "/adminChoreCheck" method = "post">
		
			<!-- To check whether is it completed chores or uncompleted chores -->
	  		<input type = "hidden" name = "choreCheckType" value = "notPendingChores" />
	  		
		 	<table width="100%">
		 		<thead><h5>Chores Status</h5></thead>
			 	<%
			 	for(Chore c: uncompletedChores){
				%>
		 		<tr>
			 		<td><input type="checkbox" name="chore" value='<%=c.getChoreID() %>'><%=c.getTaskDescription() %></td>
				 	<td><input type="button" name="status" value='<%=c.getChoreStatus() %>'></td>
				 	<td><%=c.getChorePoints() %> points</td>
			 	</tr>
			 	<%}%>
		 	</table>
		 	
		 	<p></p>
		 	<table width="100%">
			 	<tr>
				 	<td><input type="button" value="Delete Chore" onclick="showform(1)" /></td>
				 	<td><input type="submit" value="Add Chore" onclick="window.location.href='add-chore.jsp'; return false;" /></td>
			 	</tr>
		  	</table>
		  	
		  	<div id="overlay_form" style="display:none">
		  	<h6>Delete Chore</h6>
			<label>Are you sure you want to delete chore(s)?</label></br></br>
			<input type="button" value="No" name="choice" onclick="showform(2)"/>
			<input type="submit" value="Yes" name="choice" id="submit"/>
		  	</div>
		  		  	
		</form>
	  	<!-- End of uncompleted chores -->

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