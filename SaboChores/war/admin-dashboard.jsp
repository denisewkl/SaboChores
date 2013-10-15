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
<!--  
<script type="text/javascript">
 
function showStatsform(a)
{
	if(a==1)
    	document.getElementById("status_form").style.display="block";
      
	else
		document.getElementById("status_form").style.display="none";
}
 
//maintain the popup at center of the page when browser resized

 
</script>

-->	
	<!-- MAIN -->
	<div role="main" id="main">
		<div class="wrapper">
			
	 	<h2 class="heading" align="center">Dashboard</h2>
	 	
	 	<%
	 	ArrayList<String> al = new ArrayList<String>();
	 	
	 	if(session.getAttribute("choreList")==null){
	 		al.add("Wash the Car,4,Available");
		 	al.add("Bathe the Dog,2,In Progress");
		 	session.setAttribute("choreList",al);
	 	}
	 	else{		
	 		al = (ArrayList<String>)session.getAttribute("choreList");
	 	}
	 	
	 	
	 	%>
<form onsubmit="">
	 	<table width="100%">
	 	<thead><h5>Chores</h5></thead>
	 	<%
	 	for(String s: al){
	 		String[] arr= s.split(",");
	 		
	 		%>
	 		<tr>
		 	<td><input type="checkbox" name="chore" value='<%=arr[0]+','+arr[1]+','+arr[2]%>'><%=arr[0] %></td>
		 	<td><input type="button" name="status" value='<%=arr[2] %>' disabled/></td>
		 	<td><%=arr[1] %> points</td>
		 	</tr>
	 		<%
	 	}
	 	%>
	 	
	 	</table>
	 	<p>
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
	  	<!--  
	  	<div id="status_form" style="display:none">
	  	<h6>Chore</h6>
	  	<%---
	  	String status=request.getParameter("status");
	  	String stats="";
	  	if(status!=null){
		  	if(status.equals("Available") || status.equals("Sabotaged!")){
		  		stats="Start on Chore?";
		  	}else if(status.equals("In Progress")){
		  			stats="Complete Chore?";
		  	}
	  	}
	  		
	  	
	  	
	  	--%>
		<label><%--=stats --%></label></br></br>
		<input type="button" value="No" name="choice" onclick="showStatsform(2)"/>
		<input type="submit" value="Yes" name="choice" id="submit"/>
	  	</div>-->
	  	
	  	</form>

	  	</p>
	  <%
	  String choice=request.getParameter("choice");
	  String chore[]= request.getParameterValues("chore");
	  System.out.println(choice);
	  if(chore != null && choice.equals("Yes"))
	  {
	  for(int i=0; i<chore.length; i++){
		for(int x=0; x<al.size();x++){
			if(al.get(x).equals(chore[i])){
				System.out.println(al.get(x));
				al.remove(x);

			}
		}
	  }
	  session.setAttribute("choreList", al);
	  response.sendRedirect("admin-dashboard.jsp");
	  }
	 
	  %>
	  
	  <div align="center"><a href="admin-rewards.jsp">View Child Rewards</a></div>
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