package controller;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import entity.*;
import manager.*;
import java.util.*;


public class Servlet_ChoreCheck  extends HttpServlet{

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
		
		//getting all necessary information inputted by the user from the previous form.
		Child currentChild = (Child)session.getAttribute("username");
		String choreStatus = request.getParameter("choreStatus");
		int choreID = Integer.parseInt(request.getParameter("chore"));
		
		//System.out.println("Chore button clicked: " + choreStatus);
		
		
		//getting all chores.
		ChoreManager choreMgr = new ChoreManager();
		List<Chore> allChores = choreMgr.getAllChores();
		Chore currentChore = choreMgr.getChore(choreID);
		
		//System.out.println("Chore: " + currentChore.getTaskDescription());
		System.out.println("BEFORE Chore button clicked: " + currentChore.getChoreStatus());
				
		//if Available
		if (choreStatus.equalsIgnoreCase("Available")) {
			currentChore.setStatus("In-Progress");
			currentChore.setChoreTakenBy(currentChild.getUserName());
			System.out.println("AFTER Chore button clicked: " + currentChore.getChoreStatus());
			response.sendRedirect("child-dashboard.jsp");
		}
		
		//if In-Progress
		if (choreStatus.equalsIgnoreCase("In-Progress")) {
			currentChore.setStatus("Completed");
			response.sendRedirect("child-dashboard.jsp");
		}
		
		//if Completed
		if (choreStatus.equalsIgnoreCase("Completed")) {
			response.sendRedirect("child-dashboard.jsp");		
		}
		
		//if Saboed
		if (choreStatus.equalsIgnoreCase("Saboed")) {
			currentChore.setStatus("In-Progress");
			response.sendRedirect("child-dashboard.jsp");
		}
			
	}

}
