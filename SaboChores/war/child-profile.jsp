<%@include file="header.jsp" %>


			

	
	<!-- MAIN -->
	<div role="main" id="main">
		<div class="wrapper">
			
	 	<h2 class="heading" align="center" >Profile</h2></br>
	 	<div>
	 	<img src="img/avatar1.png" width="100px" >
	 	<table>

	 	<tr>
	 	<td>Name:  <%=currentChild.getUserName()%></br>
	 	Title:  <%=currentChild.getTitle()%></br>
	 	Empire:  <%=currentChild.getEmpire()%></br>
	 	Points:  <%=currentChild.getPoints()%></br>
	 	Sabo Tix:  <%=currentChild.getSaboTix()%></br>
	 	$$ Tix:  <%=currentChild.getMoneyTix()%>

	 	</td>
	 	</tr>
	 	</table>
		</div>
		
	 	
	  
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