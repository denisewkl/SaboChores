package controller;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import entity.*;
import manager.*;
import java.util.*;


public class Servlet_SaboCheck  extends HttpServlet{

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
		
		Child currentChild = (Child)session.getAttribute("username");
		//FamilyManager familyMgr = FamilyManager.getInstance();
		ChoreManager choreMgr = ChoreManager.getInstance();
		
		//getting the values from the selected option from child-dashboard, sabo option.
		String[] saboedNameArray = request.getParameterValues("saboedName");
		String[] saboedTaskArray = request.getParameterValues("saboedTask");
		
		//putting the values from the array to the string.
		String saboedName = saboedNameArray[0];
		int saboedTaskID = Integer.parseInt(saboedTaskArray[0]);
		
		//getting the chore using the specific ID.
		Chore saboedChore = choreMgr.getChore(saboedTaskID);
		
		//check whether child has enuff sabo tix.
		if (currentChild.getSaboTix()>= 1) {
			//setting the saboed chore status to saboed
			choreMgr.setChoreStatus(saboedChore, "Saboed");
			
			//setting the chore to the saboed name;
			saboedChore.setChoreTakenBy(saboedName);
			
			//setting the chore saboby name
			saboedChore.setSaboBy(currentChild.getUserName());
			
			//deduct the sabo tix from the current user.
			currentChild.setSaboTix(currentChild.getSaboTix() - 1);
			
			response.sendRedirect("child-dashboard.jsp");
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("child-dashboard.jsp");
            request.setAttribute("msg","You do not have enough sabo tix!");
            rd.forward(request, response);
		}
		
		
		
			
	}

}
