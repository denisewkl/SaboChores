package manager;

import entity.*; 
import java.util.*;

public class ChoreManager implements java.io.Serializable {

	List<Chore> allChores = new ArrayList<Chore>();
	
	//default constructor
	public ChoreManager() {
		//create new items in the list.
		//Chore status
		//Available
		//In-Progress
		//Redeem Points (Award points to the user)
		//Saboed (Someone sabo the mentioned Child)
		
		
		//id, task description, task status, points, owner, saboed name, empire
		Chore chore1 = new Chore(1, "Sweep the floor", "In-Progress", 4, "agurz","", "Empire 2");
		Chore chore2 = new Chore(2, "Clean up dinner table", "In-Progress", 2, "freda","", "Empire 2");
		Chore chore3 = new Chore(3, "Buy toilet paper", "Available", 2, "","", "Empire 2");
		Chore chore4 = new Chore(4, "Bathe the dog", "Redeem", 3, "agurz","", "Empire 2");
		Chore chore5 = new Chore(5, "Bathe the cat", "In-Progress", 3, "denise","", "Empire 1");
		Chore chore6 = new Chore(6, "Bathe the hamster", "Saboed", 2, "agurz","freda", "Empire 2");
		Chore chore7 = new Chore(7, "Change sofa seats", "Available", 4, "","", "Empire 1");
		Chore chore8 = new Chore(8, "Wash the car", "Available", 6, "","", "Empire 3");
		Chore chore9 = new Chore(9, "Clean the window", "Available", 5, "","", "Empire 2");
		Chore chore10 = new Chore(10, "Clean the toilet", "Available", 4, "","", "Empire 2");

		
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
	}
	
	/**
     * SingletonHolder is loaded on the first execution of Singleton.getInstance() 
     * or the first access to SingletonHolder.INSTANCE, not before.
     */
	private static class ChoreManagerHolder { 
        public static final ChoreManager INSTANCE = new ChoreManager();
	}
	
	public static ChoreManager getInstance() {
        return ChoreManagerHolder.INSTANCE;
	}
	
	public List<Chore> getAllChores() {
		return allChores;
	}
	
	//to get the specific chores by the username
	public List<Chore> getChoreToSpecificMember(String username) {
		List<Chore> choresToDoTemp = new ArrayList<Chore>();
		
		Object user = FamilyManager.getInstance().getUser(username);
		
		if (user instanceof Child) {
			Child currentChild = (Child) user;
			
			for (Chore c: this.getAllChores()) {
				if (c.getEmpire().equalsIgnoreCase(currentChild.getEmpire()) //if same empire i add in AND
				&& (c.getChoreTakenBy().equalsIgnoreCase(username) || c.getChoreStatus().equalsIgnoreCase("Available")) //chore belongs to you OR chore status is available i add in. 
			
				) {
					choresToDoTemp.add(c);
				}
			}
		} else {
			Parent currentParent = (Parent) user;
			
			for (Chore c: this.getAllChores()) {
				if (c.getEmpire().equalsIgnoreCase(currentParent.getEmpire())) {
					choresToDoTemp.add(c);
				}
			}
		}
		
		return choresToDoTemp;
	}
	
	//get all chores that are not completed. 
	public List<Chore> getChoreToSabo (String username) {
		List<Chore> choresToSabo = new ArrayList<Chore>();
		
		
		Object user = FamilyManager.getInstance().getUser(username);
		
		if (user instanceof Child) {
			Child currentChild = (Child) user;
			for (Chore c: this.getAllChores()) {
				if (c.getEmpire().equalsIgnoreCase(currentChild.getEmpire()) &&
						c.getChoreStatus().equalsIgnoreCase("Available") || c.getChoreStatus().equalsIgnoreCase("Saboed")) {
					choresToSabo.add(c);
				}
			}		
		} else {
			Parent curentParent = (Parent) user;
			for (Chore c: this.getAllChores()) {
				if (c.getChoreStatus().equalsIgnoreCase("Available") || c.getChoreStatus().equalsIgnoreCase("Saboed")) {
					choresToSabo.add(c);
				}
			}		
		}
		
		
		return choresToSabo;
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
	
	//removing the specific chore with the given username and empire
	public void removeChore (int choreID, String username) {
				
		for (int i = 0; i < allChores.size(); i++) {
			Chore c = allChores.get(i);
			
			//if chore ID matches and it belongs to the specific user.
			if (c.getChoreID() == choreID && c.getChoreTakenBy().equalsIgnoreCase(username)) {
				allChores.remove(i);
			}
		}
		
	}
	
}
