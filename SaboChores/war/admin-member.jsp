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
	 	ArrayList<String> al = new ArrayList<String>();
			String message="";
			
	 	if(session.getAttribute("rewards")==null){
	 		al.add("Agurz,4,password");
		 	al.add("Freda,6,freda123");
		 	session.setAttribute("rewards",al);
	 	}
	 	else{		
	 		al = (ArrayList<String>)session.getAttribute("rewards");
	 	}
	 	
	 	
	 	%>
	 	<h2 class="heading" align="center">Member Management</h2>
<form onsubmit="">
	 	<table width="100%">
	 	
	 	<tr>
	 	<td><h5>Child</h5></td>
	 	<td><h5>Password</h5></td>
	 	</tr>
	 	<%
	 	for(String s: al){
	 		String[] arr= s.split(",");
	 		
	 		%>
	 		<tr>
		 	<td><input type="checkbox" name="user" value='<%=arr[0]+','+arr[1]+','+arr[2]%>'><%=arr[0] %></td>
		 	<td><%=arr[2] %></td>
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
		</div>
		
		<div id="add_form" style="display:none">
		<h6>Add Member to Household</h6>
		<label>Who would you like to add?</label></br>
		<input type="text" name="user_add"/>
		<input type="button" value="Back" name="choice" onclick="showform2(2)"/>
		<input type="submit" value="Add" name="choice"/>
		
		<%
		ArrayList<String> ul=(ArrayList<String>)session.getAttribute("allUserList");
		ArrayList<String> checkList=(ArrayList<String>)session.getAttribute("rewards");
		String addUser=request.getParameter("user_add");
		
				
			
		if(ul!=null && addUser!=null){
			for(String check:checkList){
				String[] checker= check.split(",");
				if((checker[0].toLowerCase()).equals(addUser.toLowerCase())){
					//message="User is already in your household.";
					//session.setAttribute("message",message);
				}
			}
					for(String x: ul){
						String[] array= x.split(",");
						
							if((addUser).toLowerCase().equals(array[0].toLowerCase())){
								checkList.add(x);
								response.sendRedirect("admin-member.jsp");
								
							}else{
								
								//message="User does not exist!";
								//session.setAttribute("message",message);
							}
							
						}

		}	
			
		
		%>
		</div>
		
		</form>
		
		<%
	  String choice=request.getParameter("choice");
	  String user[]= request.getParameterValues("user");
	  if(user != null && choice.equals("Yes"))
	  {
	  for(int i=0; i<user.length; i++){
		for(int x=0; x<al.size();x++){
			if(al.get(x).equals(user[i])){

				al.remove(x);

			}
		}
	  }
	  session.setAttribute("rewards", al);
	  response.sendRedirect("admin-member.jsp");
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