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
		<%
	 		List<Child> al = familyMgr.getChildren(currentParent.getEmpire());
			String message="";
			
	 
	 	
	 	%>
	 	<h2 class="heading" align="center">Member Management</h2>
<form onsubmit="" action="/memberManagementCheck">
	 	<table width="100%">
	 	
	 	<tr>
	 	<td><h5>Child</h5></td>
	 	<td><h5>Password</h5></td>
	 	</tr>
	 	<%
	 	for(Child c: al){
	 		
	 		%>
	 		<tr>
		 	<td><input type="checkbox" name="user" value='<%=c.getUserName() %>'><%=c.getUserName() %></td>
		 	<td><%=c.getPassword() %></td>
		 	</tr>
	 		<%
	 	}
	 	%>
	 	
	 	</table>
	 	<p>
	 	<table width="100%">
	 	<tr>
	 	<td><input type="button" value="Delete" onclick="showform(1)"></td>
	 	<td><input type="button" value="Add" onclick="showform2(1)" /></td>
	 	</tr>
	  	</table>
	  	</p>
	  
		<div id="overlay_form" style="display:none">
		<h6>Delete User</h6>
		<label>Confirm Delete User?</label></br></br>
		<input type="button" value="No" name="choice" onclick="showform(2)"/>
		<input type="submit" value="Yes" name="choice" id="close"/>
		<input type = "hidden" value = "delete" name = "type" />
		</div>
		
		<div id="add_form" style="display:none">
		<h6>Add Member to Household</h6>
		<label>Who would you like to add?</label></br>
		<input type="text" name="user_add"/>
		<input type="button" value="Back" name="choice" onclick="showform2(2)"/>
		<input type="submit" value="Add" name="choice"/>
		<input type = "hidden" value = "add" name = "type" />
		</div>
		
		</form>
		<%

		if(session.getAttribute("addError")!=null){
			out.println(session.getAttribute("addError"));
			session.setAttribute("addError","");
		}
		%>
		<%
	  String choice=request.getParameter("choice");
	  String user[]= request.getParameterValues("user");
	  String a="";

	  if(user != null && choice.equals("Yes"))
	  {
		  for(int i=0; i<user.length; i++){
			  a=user[i];
			  Child getChild=familyMgr.getChildrenByName(a);

				if((getChild.getUserName()).equals(a)){

					familyMgr.getChildrenByName(a).setEmpire("");
					

					response.sendRedirect("admin-member.jsp");
					break;
				}
				
			
		  }
	  
	  }
	  %>
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