package controller;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import entity.*;
import manager.*;


public class Servlet_ShopCheck  extends HttpServlet{

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
				
		//Type of tix
		String type = request.getParameter("type");
		
		//if tix selected is sabo
		if (type.equalsIgnoreCase("sabo")) {
			String saboTix = request.getParameter("sabopoints");
			int numOfSaboTix = Integer.parseInt(saboTix);
			
			if (currentChild.getPoints() > numOfSaboTix * 20) {
				//updates the currentChild points a number of saboTix
				currentChild.setPoints(currentChild.getPoints() - numOfSaboTix * 20);
				currentChild.setSaboTix(currentChild.getSaboTix() + numOfSaboTix);
				response.sendRedirect("child-dashboard.jsp");
			} else {
				//goes to the error page becos not enough of points to exchange.
				response.sendRedirect("shopErrorMsg.jsp");
			}
			
		} else { //if tix selected is money
			String moneyTix = request.getParameter("moneypoints");
			int numOfMoneyTix = Integer.parseInt(moneyTix);
			
			if (currentChild.getPoints() > numOfMoneyTix * 20) {
				//update the currentChild points and number of money tix.
				currentChild.setPoints(currentChild.getPoints() - numOfMoneyTix * 20);
				currentChild.setSaboTix(currentChild.getMoneyTix() + numOfMoneyTix);
				response.sendRedirect("child-dashboard.jsp");
			} else {
				//goes to the error page becos not enuff points to exchange for tix
				response.sendRedirect("shopErrorMsg.jsp");
			}
			
		}
			
	}

}
