package manager;

import entity.*; 
import java.util.*;

public class ChoreManager {

	List<Chore> allChores = new ArrayList<Chore>();
	
	//default constructor
	public ChoreManager() {
		//create new items in the list.
	}
	
	public List<Chore> getAllChores() {
		
		//Chore status
		//Available
		//In-Progress
		//Completed (Means pending on parents to approve and award the points over to the child)
		//Saboed (Someone sabo the mentioned Child)
		
		Chore chore1 = new Chore(1, "Sweep the floor", "In-Progress", 4, "agurz","");
		Chore chore2 = new Chore(2, "Clean up dinner table", "Available", 2, "freda","");
		Chore chore3 = new Chore(3, "Buy toilet paper", "Available", 2, "freda","");
		Chore chore4 = new Chore(4, "Bathe the dog", "Completed", 3, "agurz","");
		Chore chore5 = new Chore(5, "Bathe the cat", "Available", 3, "denise","");
		Chore chore6 = new Chore(6, "Bathe the hamster", "Saboed", 2, "agurz","freda");
		Chore chore7 = new Chore(7, "Change sofa seats", "Available", 4, "denise","");
		Chore chore8 = new Chore(8, "Wash the car", "Available", 6, "rafael","");
		Chore chore9 = new Chore(9, "Clean the window", "Available", 5, "agurz","");
		Chore chore10 = new Chore(10, "Clean the toilet", "Available", 4, "agurz","");

		allChores.add(chore1);
		allChores.add(chore2);
		allChores.add(chore3);
		allChores.add(chore4);
		allChores.add(chore5);
		allChores.add(chore6);
		allChores.add(chore7);
		allChores.add(chore8);
		allChores.add(chore9);
		allChores.add(chore10);
		
		return allChores;
	}
	
	//to get the specific chores by the username
	public List<Chore> getChoreToSpecificMember(String username) {
		List<Chore> choresToDoTemp = new ArrayList<Chore>();
		
		for (Chore c: this.getAllChores()) {
			if (c.getChoreTakenBy().equalsIgnoreCase(username)) {
				choresToDoTemp.add(c);
			}
		}
		
		return choresToDoTemp;
	}
	
	//add new chore to the arraylist.
	public void addChore (Chore c) {
		allChores.add(c);
	}
	
	//add new chore to the arraylist.
	public Chore getChore (int choreID) {
		for (Chore c: this.getAllChores()) {
			if (c.getChoreID() == choreID) {
				return c;
			}
		}
		return null;
	}
	
}
