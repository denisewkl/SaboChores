<!doctype html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->

<%@ page import="entity.*" %>
<%@ page import="manager.*" %>
<%@ page import="java.util.*" %>

<head>
	<meta charset="utf-8">
	
	
	
	<title>Sabo Chores</title>
	<meta name="description" content="">
	
	<!-- Mobile viewport optimized: h5bp.com/viewport -->
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	
	<link rel="stylesheet" media="screen" href="css/superfish.css" /> 
	<link rel="stylesheet" href="css/nivo-slider.css" media="all"  /> 
	<link rel="stylesheet" href="css/tweet.css" media="all"  />
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" media="all" href="css/lessframework.css"/>
	
	<!-- All JavaScript at the bottom, except this Modernizr build.
	   Modernizr enables HTML5 elements & feature detects for optimal performance.
	   Create your own custom Modernizr build: www.modernizr.com/download/ -->
	<script src="js/modernizr-2.5.3.min.js"></script>
</head>
<body>


	<!-- HEADER -->
	<header>
		
		<!-- header wrapper -->
		<div class="wrapper cf">
			<div id="logo">
				<a href="index.html" ><img src="img/logo.png" alt="" /></a>
			</div>
		</div><!-- ENDS header wrapper -->
		
		
		
		<!-- nav -->
		<nav class="cf">
			<div class="wrapper cf">
				
				<div id="combo-holder"></div>
			</div>
		</nav>
		<!-- ends nav -->
			
	</header>
	<!-- ENDS HEADER -->
	
	
	<!-- MAIN -->
	<div role="main" id="main">
		<div class="wrapper">
		
		
		<!-- headline -->
		<div class="headline">
			Sign in as:
		</div>
		
	 	  <ul id="filter-container-feature" class="feature">
		 	<li>
			 	<a href="child-login.jsp" class="thumb" ><img src="img/childLogin.png" alt="" />
				 	
			 	</a>
			 	<div class="caption"> </div>
		 	</li>
		 	<li>
			 	<a href="admin-login.jsp" class="thumb" ><img src="img/parentLogin.png" alt="" />
				 	
			 	</a>
			 	<div class="caption"> </div>
		 	</li>
		 	
		 	
		 	
	 	 </ul>
	 	 <!-- ENDS feature -->
	  
	  
	  </div>
	</div>
	<!-- ENDS MAIN -->
	
	
	<footer>
	
		

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