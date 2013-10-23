<%@include file="header.jsp" %>


			

	
	<!-- MAIN -->
	<div role="main" id="main">
		<div class="wrapper">
			
	 	<h2 class="heading" align="center">Shop</h2>
<p>
	 	<table width="100%" align="center">
		<tr>
	 	<td><h6>Item</h6></td>
	 	<td><h6>Points</h6></td>
	 	<td><h6>Purchase</h6></td>
	 	</tr>
	 	<tr>
	 	<td>Sabo Tix</td>
	 	<td>20 pts</td>
	 	<td>
	 	
	 	<input type="submit" value="Buy" id="pop" /></td>
	 	</tr>
	 	<tr>
	 	<td>$$ Tix</td>
	 	<td>20 pts</td>	 	
	 	<td><input type="submit" value="Buy" id="pop2" /></td>
	 	</tr>
	 	 
	 	</table>


<!-- pop up form for sabo tix -->
<form id="overlay_form" style="display:none" action = "/shopcheck">
<h6>Sabo Tickets</h6>
<label>How many tickets?</label><br>
<input type="number" name="sabopoints" id="points" min="1" max="20" step="1" value="1"><br />
<input type = "hidden" name = "type" value = "sabo" />

<input type="Submit" value="Buy" />
<a href="#" id="close" >Close</a>
</form>

	 <!-- pop up form for $$ tix -->
<form id="overlay_form2" style="display:none" action = "/shopcheck">
<h6>$$ Tickets</h6>
<label>How many tickets?</label><br>
<input type="number" name="moneypoints" id="points" min="1" max="20" step="1" value="1"><br />
<input type = "hidden" name = "type" value = "money" />
<input type="Submit" value="Buy" />
<a href="#" id="close2" >Close</a>
</form>
<%
String error=(String)request.getAttribute("msg");

if(error!=null){
	%>
	<font color="red"><%=error %></font>
	<%
}
%>
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