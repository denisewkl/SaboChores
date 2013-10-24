<%@include file="header-admin.jsp" %>
<script type="text/javascript">
 
function showform(a)
{
	if(a==1)
    	document.getElementById("overlay_form").style.display="block";
      
	else
		document.getElementById("overlay_form").style.display="none";
}
 
</script>

			
		<%
	 		List<Child> al = familyMgr.getChildren(currentParent.getEmpire());
			String message="";
	 	%>
	
	<!-- MAIN -->
	<div role="main" id="main">
		<div class="wrapper">
			
	 	<h2 class="heading" align="center">Child Rewards</h2>
<form onsubmit="" action = "/rewardCheck">
	 	<table width="100%">
	 	
	 	<tr>
	 	<td><h5>Child</h5></td>
	 	<td><h5>Reward</h5></td>
	 	</tr>
	 	<%
		for(Child c: al){
			if(c.getReward()!=0){
	 		
	 		%>
	 		<tr>
		 	<td><input type="checkbox" name="user" value='<%=c.getUserName() %>'><%=c.getUserName() %></td>
		 	<td><%="$"+c.getReward()%></td>
		 	</tr>
	 		<%
	 		}
		}
	 	%>
	 	
	 	</table>
	 	<p>
	 	<table width="100%">
	 	<tr>
	 	<td><input type="button" value="Back" onclick="goBack()"></td>
	 	<td><input type="button" value="Confirm" onclick="showform(1)" /></td>
	 	</tr>
	  	</table>
	  	<br>
	  	<%
	  	String msg=(String)request.getAttribute("msg");
	  	if(msg!=null){
	  		out.println(msg);
	  		
	  	}
	  	%>
	  	<div id="overlay_form" style="display:none">
		<h6>Reward</h6>
		<label>Confirm Reward Redemption?</label></br></br>
		<input type="button" value="No" name="choice" onclick="showform(2)"/>
		<input type="submit" value="Yes" name="choice" id="close"/>
		</div>
		
		</form>
	  	</p>

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