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
		
		
		FamilyManager familyMgr = FamilyManager.getInstance();
		List<String> allMembers = familyMgr.getAllFamilyMembers(currentChild);
		
		
		
			
	}

}
