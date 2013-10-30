package controller;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import entity.*;
import manager.*;
import java.util.*;


public class Servlet_RewardCheck  extends HttpServlet{

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
		
		FamilyManager familyMgr = FamilyManager.getInstance();
		
		String choice=request.getParameter("choice");
		String[] user= request.getParameterValues("user");
		
		if(user==null){
			RequestDispatcher rd = request.getRequestDispatcher("admin-rewards.jsp");
            request.setAttribute("msg","*Please select at least one.");
            rd.forward(request, response);
		}
		else if(user != null && choice.equals("Yes")) {
			for(int i=0; i<user.length; i++){;
				Child getChild=familyMgr.getChildrenByName(user[i]);
		
				if(user[i].equals(getChild.getUserName())){
					familyMgr.getChildrenByName(user[i]).setReward(0);
				}
			}
			response.sendRedirect("admin-rewards.jsp");
		}
		
		
		
			
	}

}
