<%@include file="header.jsp" %>

	<!-- MAIN -->
	<%
	List<Child> allChildrenInSameEmpire = familyMgr.getChildrenInChildDashBoard(currentChild);		
	List<Chore> allChoresToThisUser = choreMgr.getChoreToSpecificMember(currentChild.getUserName());
	List<Chore> getChoreToSabo = choreMgr.getChoreToSabo(currentChild.getUserName());
	%>
	
	
	<div role="main" id="main">
		<div class="wrapper">
			
	 	<h2 class="heading" align="center">Dashboard</h2>
		
	 	<table width="100%">
	 	
	 	<tr>
	 		<td width = "25%"><h5>Chores</h5></td>
	 		<td width = "25%" align = "center"><h5>Points</h5></td>
	 		<td width = "25%"><h5>Status</h5></td>
	 		<td width = "25%"><h5></h5></td>
	 	</tr> 
		
	 	<% for (Chore c: allChoresToThisUser) { %>
	 		<tr>
			 	<td><%=c.getTaskDescription()%></td>
			 	<% if (c.getChoreStatus().equalsIgnoreCase("Available")) { %>
			 		<form method = "post" action = "/chorecheck"> 
				 		<td align = "center"><%= c.getChorePoints() %> </td>
				 		<td align = "center">Available</td>
				 		<td align = "center"><input type="submit" value="Start" id="submit" /></td>
				 		<input type = "hidden" name = "choreStatus" value = "Available" />
				 		<input type = "hidden" name = "chore" value = "<%=c.getChoreID()%>" />
			 		</form>
			 	<% } else if (c.getChoreStatus().equalsIgnoreCase("In-Progress")) {%>
			 		<form method = "post" action = "/chorecheck">
				 		<td align = "center"><%= c.getChorePoints() %> </td>
				 		<td align = "center">In-Progress</td>
				 		<td align = "center"><input type="submit" value="Complete" id="submit" /></td>
				 		<input type = "hidden" name = "choreStatus" value = "In-Progress" />
				 		<input type = "hidden" name = "chore" value = "<%=c.getChoreID()%>" />
			 		</form>
			 	<% } else if (c.getChoreStatus().equalsIgnoreCase("Saboed"))  {%>
			 		<form method = "post" action = "/chorecheck"> 
				 		<td align = "center"><%= c.getChorePoints() %> </td>
				 		<td align = "center">Saboed by <%=c.getSaboBy()%></td>
				 		<td align = "center"><input type="submit" value="Start" id="submit" /></td>
				 		<input type = "hidden" name = "choreStatus" value = "Saboed" />
				 		<input type = "hidden" name = "chore" value = "<%=c.getChoreID()%>" />
			 		</form>
			 	<% } else {%>
			 		<form method = "post" action = ""> 
				 		<td align = "center"><%= c.getChorePoints() %> </td>
				 		<td align = "center">Pending</td>
				 		<td align = "center">Parent approving</td>			 		
				 		<input type = "hidden" name = "choreStatus" value = "" />
				 		<input type = "hidden" name = "chore" value = "<%=c.getChoreID()%>" />
			 		</form>
			 	<% } %>
		 	</tr>
	 	<% } %>
	 	
	 	</table>
	 	
	 	<p>
	 	<table width="100%">
	 	<tr>
	 	<td>
	 		<%
			//if no family or chores to select from to sabo
			if (allChildrenInSameEmpire.size() != 0 && getChoreToSabo.size() != 0) { %>
				<input type="submit" value="Sabo Someone" id="pop2" />
				<%String error=(String)request.getAttribute("msg");
					if (error != null) {
						out.println(error);
					}
				%>
			<%}%>
		</td>
	 	<td>
	 		<%
			//if no family or chores to select from to sabo
			if (currentChild.getMoneyTix() >= 1) { %>
	 		<input type="submit" value="Exchange for $$" id="pop" />				
	 		<%}%>
			
	 	</td>
	 	</tr>
	 	<tr>
	 	<td>
	 		<%
			//if no family or chores to select from to sabo
			if (allChildrenInSameEmpire.size() != 0 && getChoreToSabo.size() != 0) { %>
				Requires x1 Sabo Tix
				
			<%} %>
		</td>
	 	<td>
	 		<%
			//if no family or chores to select from to sabo
			if (currentChild.getMoneyTix() >= 1) { %>
				Requires x1 $$ Tix
			<%} %>	
		</td>
	 	</tr>
	  	</table>
	  	</p>
	  
	<!-- pop form for exchange for money -->  
	<form id="overlay_form" style="display:none" action = "/exchangemoneycheck">
		<h6>Exchange Tickets for $$</h6>
		<label>How many tickets?</label><br>
		<input type="number" name="moneyTix" id="points" min="0" max="20" step="1" value="1"><br />
		
		<input type="Submit" value="Exchange" />
		<input type="button" value="Close" id="close"/>
	</form>
	<!-- pop form for sabo someone --> 
	
		<form id="overlay_form2" style="display:none" action = "/sabocheck">
			<h6>Sabo family members</h6>
			<label>Who?</label><br>
			<select name = "saboedName"> 
				<%
					for (Child c: allChildrenInSameEmpire) { 
						if (c.getEmpire().equalsIgnoreCase(currentChild.getEmpire())) {%>
						 
						<option value ="<%=c.getUserName()%>"><%=c.getUserName()%></option>
				<%		}
					}%>
			</select>
			<br />
			Chore to sabo: <br />
			<select name = "saboedTask"> 
				<%
					for (Chore c: getChoreToSabo) { %> 
						<option value ="<%=c.getChoreID()%>"><%=c.getTaskDescription()%></option>
				<%	}%>
			</select>
			<br />
			<input type="Submit" value="Sabo" />
			<input type="button" value="Close" id="close2"/>
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