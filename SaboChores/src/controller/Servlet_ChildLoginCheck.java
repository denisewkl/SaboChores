package controller;

import java.io.IOException;

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

public class Servlet_ChildLoginCheck extends HttpServlet{
	
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
			
			//retrieving what the user's input here. 
	        String username=request.getParameter("username");
	        String password=request.getParameter("password");
			
			//creating all the child out first.
			Child agurz = new Child("agurz","agurz","Good Kid","Empire 2", 100, 1000, 10000);
			Child freda = new Child("freda","freda","Angel","Empire 2", 100, 100, 1000);
			
			//creating all the parent out first.
			Parent denise = new Parent("denise","denise","Empire 1");
			Parent rafael = new Parent("rafael","rafael","Empire 3");
			
	        // setting up password here. 
	        HashMap<String, Object> map = new HashMap<String, Object>();
			map.put(agurz.getUserName(), agurz);
			map.put(freda.getUserName(), freda);
	   
	        //if (map.get(username) instanceof Child) { //if child comes here.
	        	
	        Child currentChild = (Child)map.get(username);
	        
	        if (currentChild == null) {
	        	response.sendRedirect("Error.jsp");
	        } else {
	        	       	
	        	if (currentChild.getUserName().equalsIgnoreCase(username) && currentChild.getPassword().equalsIgnoreCase(password)){
	        		session.setAttribute("username",currentChild);
	            	response.sendRedirect("child-dashboard.jsp");
	            	//System.out.println("Child page");
	        	} else {
	        		//System.out.println("Child, wrong credentials.");
	        		response.sendRedirect("Error.jsp");
	        	}
	        
	        }	
				
		}
}
