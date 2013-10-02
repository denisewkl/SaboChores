<%@include file="header-admin.jsp" %>

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

			

	
	<!-- MAIN -->
	<div role="main" id="main">
		<div class="wrapper">
			
	 	<h2 class="heading" align="center">Dashboard</h2>

	 	<table width="100%">
	 	<thead><h5>Chores</h5></thead>
	 	<tr>
	 	<td><input type="checkbox" name="chore" value="car">1. Wash the Car</td>
	 	<td><input type="submit" value="Available" id="submit" /></td>
	 	<td>4 pts</td>
	 	</tr>
	 	<tr>
	 	<td><input type="checkbox" name="chore" value="bathe">2. Bathe the Dog </td>
	 	<td><input type="submit" value="Available" id="submit" /></td>
	 	<td>2 pts</td>
	 	</tr>
	 	</table>
	 	<p>
	 	<table width="100%">
	 	<tr>
	 	<td><input type="submit" value="Delete Chore" id="pop" /></td>
	 	<td><input type="submit" value="Add Chore" id="submit" /></td>
	 	</tr>
	  	</table>
<!-- pop up form for delete chore -->
<form id="overlay_form" style="display:none">
<h6>Delete Chore</h6>
<label>Are you sure you want to delete chore(s)?</label></br></br>
<input type="button" value="No" name="no" id="close"/>
<input type="button" value="Yes" name="Yes" id="close"/>
</form>
	
	  	</p>
	  
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