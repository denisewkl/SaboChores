<%@include file="header.jsp" %>

	<!-- MAIN -->
	<%
	List<String> allFamilyMembers = familyMgr.getAllFamilyMembers(currentChild);
		
	List<Chore> allChoresToThisUser = choreMgr.getChoreToSpecificMember(currentChild.getUserName());
	%> 
	
		Total chores to do by me: <%=allChoresToThisUser.size()%>
	
	
	<div role="main" id="main">
		<div class="wrapper">
			
	 	<h2 class="heading" align="center">Dashboard</h2>
		
	 	<table width="100%">
	 	<thead><h5>Chores</h5></thead>
	 	 
		
	 	<% for (Chore c: allChoresToThisUser) { %>
	 		<tr>
			 	<td><%=c.getChoreID()%>: <%=c.getTaskDescription()%> : <%=c.getChoreStatus()%></td>
			 	
			 	<% if (c.getChoreStatus().equalsIgnoreCase("Available")) { %>
			 		<form method = "post" action = "/chorecheck"> 
			 		<td><input type="submit" value="Available" id="submit" /></td>
			 		<td>Points: <%= c.getChorePoints() %> </td>
			 		
			 		<input type = "hidden" name = "choreStatus" value = "Available" />
			 		<input type = "hidden" name = "chore" value = "<%=c.getChoreID()%>" />
			 		</form>
			 	<% } else if (c.getChoreStatus().equalsIgnoreCase("In-Progress")) {%>
			 		<form method = "post" action = "/chorecheck"> 
			 		<td><input type="submit" value="In-Progress" id="submit" /></td>
			 		<td>Points: <%= c.getChorePoints() %> </td>
			 		<input type = "hidden" name = "choreStatus" value = "In-Progress" />
			 		<input type = "hidden" name = "chore" value = "<%=c.getChoreID()%>" />
			 		</form>
			 	<% } else if (c.getChoreStatus().equalsIgnoreCase("Saboed"))  {%>
			 		<form method = "post" action = "/chorecheck"> 
			 		<td><input type="submit" value="Saboed" id="submit" />
						Saboed by: <%=c.getSaboBy()%> 			 		
			 		</td>
			 		<td>Points: <%= c.getChorePoints() %> </td>
			 		<input type = "hidden" name = "choreStatus" value = "Saboed" />
			 		<input type = "hidden" name = "chore" value = "<%=c.getChoreID()%>" />
			 		</form>
			 	<% } else {%>
			 		<form method = "post" action = "/chorecheck"> 
			 		<td><input type="submit" value="Completed" id="submit" /></td>
			 		<td>Points: <%= c.getChorePoints() %> </td>
			 		<input type = "hidden" name = "choreStatus" value = "Completed" />
			 		<input type = "hidden" name = "chore" value = "<%=c.getChoreID()%>" />
			 		</form>
			 	<% } %>
		 	</tr>
	 	<% } %>
	 	
	 	</table>
	 	
	 	<p>
	 	<table width="100%">
	 	<tr>
	 	<td><input type="submit" value="Sabo Someone" id="pop2" /></td>
	 	<td><input type="submit" value="Exchange for $$" id="pop" />
	 	
	 	</td>
	 	</tr>
	 	<tr>
	 	<td>Requires x1 Sabo Tix</td>
	 	<td>Requires x1 $$ Tix</td>
	 	</tr>
	  	</table>
	  	</p>
	  
	<!-- pop form for exchange for money -->  
	<form id="overlay_form" style="display:none" action = "/exchangemoneycheck">
		<h6>Exchange Tickets for $$</h6>
		<label>How many tickets?</label><br>
		<input type="number" name="moneyTix" id="points" min="0" max="20" step="1" value="0"><br />
		
		<input type="Submit" value="Buy" />
		<a href="#" id="close" >Close</a>
	</form>
	<!-- pop form for sabo someone --> 
	<form id="overlay_form2" style="display:none" action = "/sabocheck">
		<h6>Sabo family members</h6>
		<label>Who?</label><br>
		<select name = "saboList"> 
			<%
				for (String name: allFamilyMembers) { %> 
					<option value ="<%=name%>"><%=name%></option>
			<%	}%>
		</select>
		<input type="Submit" value="Sabo" />
		<a href="#" id="close2" >Close</a>
	</form>



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