package controller;


import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import entity.*;
import manager.*;

import java.util.*;

import entity.Child;
import entity.Parent;


public class Servlet_ParentRegisterCheck  extends HttpServlet{

	//overwrites the doGet method
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		processRequest(request,response);
	}
	
	//overwrites the doPost method
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}
	
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String empire=request.getParameter("empire");
		String msg="";

		FamilyManager familyMgr = FamilyManager.getInstance();
		List<Parent> allParents = familyMgr.getAllParent();
		
		boolean check=true;
		
      //getting the parent
		for (Parent b: allParents) {
			if (b.getUserName().equalsIgnoreCase(username)) {
				
				msg="Username already exists!";
				check=false;
				
				
			}else if(b.getEmpire().equalsIgnoreCase(empire)) {
				msg="Empire already exists!";
				check=false;
				
			}else if(username.equals("") || email.equals("") || password.equals("") || empire.equals("")){
				msg="All fields must be filled!";
				check=false;
			}
			}    	
			
			if(check==true){
			familyMgr.addParent(new Parent(username,password,email,empire));

			response.sendRedirect("admin-login.jsp");
			
			
			}else if(check==false){
			
			 RequestDispatcher rd = request.getRequestDispatcher("admin-register.jsp");
			 request.setAttribute("msg",msg);
			 rd.forward(request, response);
			 
			}
        
		
			
	}


}
