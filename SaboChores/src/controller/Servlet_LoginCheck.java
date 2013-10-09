package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import entity.*;
import manager.*;

import entity.Child;

public class Servlet_LoginCheck {
	
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
			
			System.out.println(currentChild);
				
		}
}
