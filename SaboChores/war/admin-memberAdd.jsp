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

<script type="text/javascript">
 
function showform2(a)
{
	if(a==1)
    	document.getElementById("add_form").style.display="block";
      
	else
		document.getElementById("add_form").style.display="none";
}
 
</script>		
	
	<!-- MAIN -->
	<div role="main" id="main">
		<div class="wrapper">
		<form action = "/memberManagementCheck" method = "post">
		
			<table> 
				<tr>
					<td>
						Child Username
					</td>
					<td>
						Child password
					</td>
				</tr>
				
				<tr>
					<td>
						<input type = "text" name = "childUsername" />
					</td>
					<td>
						<input type = "text" name = "childPassword" />
					</td>
				</tr>
				
				<tr> 
					<td>
						<input type = "reset" value = "Clear" />
					</td>
					<td>
						<input type = "submit" value = "Register Child" />
					</td>
				</tr>
			</table>
			
			<input type = "hidden" value = "add" name = "type" />
			<input type = "hidden" value = "<%=currentParent.getEmpire() %>" name = "empire" />
			
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