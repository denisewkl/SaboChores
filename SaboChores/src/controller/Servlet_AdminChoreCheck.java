package controller;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import entity.*;
import manager.*;
import java.util.*;


public class Servlet_AdminChoreCheck  extends HttpServlet{

	//overwrites the doGet method
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		processRequest(request,response);
	}
	
	//overwrites the doPost method
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}
	
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		//getting managers
		ChoreManager choreMgr = ChoreManager.getInstance();
		FamilyManager familyMgr = FamilyManager.getInstance();
		
		//getting all the parameters from the user form.
		String choreCheckType = request.getParameter("choreCheckType");
		
		String[] chore= request.getParameterValues("chore");
		
		//System.out.println("Chore check type: " + choreCheckType);
		
		//if user is going to check not pending chores and delete it...
		if(chore==null){
			RequestDispatcher rd = request.getRequestDispatcher("admin-dashboard.jsp");
            request.setAttribute("msg","*Please select at least 1 chore to approve.");
            rd.forward(request, response);
		}
		else if (choreCheckType.equalsIgnoreCase("notPendingChores")) {
			//System.out.println("Uncompleted Chores");
			
			String a="";
			String choice=request.getParameter("choice");	
			
			if(choice.equals("Yes")) {
				//System.out.println("Chore is not empty and yes!");	
				for(int i=0; i<chore.length; i++){
					a=chore[i];
					int aInt = Integer.parseInt(a);
					Chore getChore=choreMgr.getChore(aInt);
							
					if(getChore.getChoreID() == aInt && (getChore.getChoreStatus().equals("Available")) || getChore.getChoreStatus().equals("Pending")){
						choreMgr.getAllChores().remove(choreMgr.getChore(aInt));
						response.sendRedirect("admin-dashboard.jsp");
					} else {
						RequestDispatcher rd = request.getRequestDispatcher("admin-dashboard.jsp");
			            request.setAttribute("msg","*In-progress or saboed chores cannot be deleted.");
			            rd.forward(request, response);
					}
				}
			
			}
			  
		} else { //if user is going to approve the pending chores. 			
			
			//getting the user selected chore. 
			for (String a: chore) {
				int choreID = Integer.parseInt(a);

				//getting the current pending chore.
				Chore currentPendingChore = choreMgr.getChore(choreID);
				
				//getting the owner of the child from the pending chore.
				String currentChildStr = currentPendingChore.getChoreTakenBy();
				
				//getting the current child with the children name string.
				Child currentChild = familyMgr.getChildrenByName(currentChildStr);
				
				//adding the currentChild points + the current pending chore points.
				currentChild.setPoints(currentChild.getPoints() + currentPendingChore.getChorePoints());
				
				//delete the completedCurrentChore from the list for the specific child. 
				choreMgr.removeChore(choreID, currentChildStr);
			}
			
			response.sendRedirect("admin-dashboard.jsp");
		}
		
			
	}

}
