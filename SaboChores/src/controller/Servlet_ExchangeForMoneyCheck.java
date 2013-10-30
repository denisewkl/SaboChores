package controller;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import entity.*;
import manager.*;


public class Servlet_ExchangeForMoneyCheck  extends HttpServlet{

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
		
		int numOfMoneyTix = Integer.parseInt(request.getParameter("moneyTix"));
		
		//check for child's money tix is more than the num of money tix he/she requested.
		if (currentChild.getMoneyTix() >= numOfMoneyTix) {
			currentChild.setMoneyTix(currentChild.getMoneyTix() - numOfMoneyTix);
			currentChild.setReward(currentChild.getReward()+numOfMoneyTix);
			
			response.sendRedirect("child-dashboard.jsp");
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("child-dashboard.jsp");
            request.setAttribute("msg","*Not enough money tix!");
            rd.forward(request, response);
		}
			
	}

}
