package controller;

import javax.servlet.*;
import javax.servlet.http.*;

import java.io.*;
import entity.*;
import manager.*;
import java.util.*;


public class Servlet_MemberManagement  extends HttpServlet{

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
		
		Parent currentParent = (Parent)session.getAttribute("username");
		FamilyManager familyMgr = FamilyManager.getInstance();
		ChoreManager choreMgr = ChoreManager.getInstance();
		
		//getting all child
		//List<Child> allChildren = familyMgr.getAllChildren();
		
		//getting all childrens that belongs to your family empire name
		List<Child> allChildrenUnderYourEmpire = familyMgr.getChildren(currentParent.getEmpire());
		
		//to know whether is delete or add.
		String memberManagement = request.getParameter("type");
		//System.out.println("Type: " + memberManagement);
		
		//if delete child from empire
		if (memberManagement.equalsIgnoreCase("delete")) {
			
			//getting the specific user from the form displayed to user. this is only used for delete
			String user[]= request.getParameterValues("user");
			String childToDelete = user[0];
			
			//System.out.println("Its Delete!");
			
			for (int i = 0; i < allChildrenUnderYourEmpire.size(); i++) {
				Child c = allChildrenUnderYourEmpire.get(i);
				
				//if child name matches
				if (c.getUserName().equalsIgnoreCase(childToDelete)) {
					familyMgr.removeChild(c);
					//break;
				}
			}
			
			//System.out.println("All children left: " + allChildren.size());
			response.sendRedirect("admin-member.jsp");	
			
		} else { //if add child to empire 
			
			//getting the new registered child username and password inputted by the parent
			String childUm = request.getParameter("childUsername");
			String childP = request.getParameter("childPassword");
			
			String childUsername = childUm.trim();
			String childPassword = childP.trim();
			
			//getting the parent empire name
			String empire = request.getParameter("empire");
			//System.out.println("Empire: " + empire);
			
			//System.out.println("New child username: " + childUsername);
			
			boolean childExist = false;
			
			for (Child c: allChildrenUnderYourEmpire) {

				//check if new child existed in your empire before
				if (c.getUserName().equalsIgnoreCase(childUsername)) {
					childExist = true;
				}
				
			}
			
			//do the logic here of ading new child.
			if (childExist) {
				response.sendRedirect("error.jsp");
			} else {
				//String username, String password, String title, String empire, int points, int saboTix, int moneyTix,int reward) {
				Child newChild = new Child(childUsername,childPassword,"Level 1",empire,100,0,0,0);
				familyMgr.addChild(newChild);
				response.sendRedirect("admin-dashboard.jsp");
			}
			
		}		
			
	}

}
