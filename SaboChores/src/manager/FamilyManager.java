package manager;

import entity.*; 

import java.util.ArrayList;
import java.util.List;


public class FamilyManager implements java.io.Serializable{
	
		
	List<Child> allChildren = new ArrayList<Child>();
	List<Parent> allParent = new ArrayList<Parent>();

	//default constructor
	public FamilyManager() {		
		//id,password,title,empire,points,sabotix,moneytix,reward
		Child agurz = new Child("agurz","agurz","Good Kid","Empire 2", 100, 1000, 10000,5);
		Child freda = new Child("freda","freda","Angel","Empire 2", 100, 100, 1000,10);
		Child john = new Child("john","john","Angel","Empire 2", 100, 100, 1000,15);
		Child min = new Child("min","min","Angel","Empire 3", 100, 100, 1000,20);
		Child serene = new Child("serene","serene","Angel","Empire 3", 100, 100, 1000,25);
		allChildren.add(agurz);
		allChildren.add(freda);
		allChildren.add(john);
		allChildren.add(min);
		allChildren.add(serene);
		
		//creating all the parent out first.
		//id,password,email,empire
		Parent denise = new Parent("denise","denise","denise@gmail.com","Empire 1");
		Parent rafael = new Parent("rafael","rafael","rafael@gmail.com","Empire 3");
		Parent robin = new Parent("robin","robin","robin@gmail.com","Empire 2");
		Parent jun = new Parent("jun","jun","jun@gmail.com","Empire 3");
		Parent joke = new Parent("joke","joke","joke@gmail.com","Empire 4");
		allParent.add(denise);
		allParent.add(rafael);
		allParent.add(robin);
		allParent.add(jun);
		allParent.add(joke);
	}
	
	/**
     * SingletonHolder is loaded on the first execution of Singleton.getInstance() 
     * or the first access to SingletonHolder.INSTANCE, not before.
     */
	private static class FamilyManagerHolder { 
        public static final FamilyManager INSTANCE = new FamilyManager();
	}
	
	public static FamilyManager getInstance() {
        return FamilyManagerHolder.INSTANCE;
	}
	
	//all childrens
	public List<Child> getAllChildren() {
		return allChildren;
	}
	
	//all parents
	public List<Parent> getAllParent() {

		return allParent;
	}
	
	public List<String> getAllFamilyMembers(Child currentChild) {
		List<String> allFamilyMembers = new ArrayList<String>();
		
		//if (currentChild.getEmpire())
		
		//System.out.println("Currentchild: " + currentChild.getEmpire());
		//adding other children that are in the same empire with him/her.
		for (Child c: getAllChildren()) {
			//if same empire and his/her name is not in the list, then add into the list.
			if (c.getEmpire().equalsIgnoreCase(currentChild.getEmpire()) && !currentChild.getUserName().equalsIgnoreCase(c.getUserName())) {
					allFamilyMembers.add(c.getUserName());
			}
		}
		
		//adding his/her parents
		for (Parent p: getAllParent()) {
			if (p.getEmpire().equalsIgnoreCase(currentChild.getEmpire())) {
				allFamilyMembers.add(p.getUserName());
			}
		}
		
		return allFamilyMembers;
	}

	public void addParent(Parent p){
		allParent.add(p);
	}
	
	//get child based on which empire
	public List<Child> getChildren(String empire){
		List<Child> temp=new ArrayList<Child>();
		for(Child c:this.allChildren){
			if(c.getEmpire().equals(empire)){
				temp.add(c);
			}
		}
		return temp;
	}
	
	public List<Child> getChildrenInChildDashBoard(Child currentChild){
		List<Child> temp=new ArrayList<Child>();
		for(Child c:this.allChildren){
			if(c.getEmpire().equals(currentChild.getEmpire()) && !currentChild.getUserName().equalsIgnoreCase(c.getUserName())){
				temp.add(c);
			}
		}
		return temp;
	}
	
	
	public Child getChildrenByName(String username){
		Child temp=null;
		for(Child c:this.allChildren){

			if(c.getUserName().equals(username)){
				temp= c;
				
			}
		}
		return temp;
		
	}
	
	//retrieving the particular user either child or parent
	public Object getUser (String username) {
		
		for (Child c: this.getAllChildren()) {
			if (c.getUserName().equalsIgnoreCase(username)) {
				return c;
			}
		}
		
		for (Parent p: this.getAllParent()) {
			if (p.getUserName().equalsIgnoreCase(username)) {
				return p;
			}
		}
		return null;
	}
	
	//removing the child from the list
	public void removeChild (Child c) {
		allChildren.remove(c);
	}
	
	//adding child to the list
	public void addChild (Child c) {
		allChildren.add(c);
	}
	
	//get all children that belongs to your empire
	public List<Child> getAllChildBelongsToYourEmpire (Parent p) {
		List<Child> childOfYourEmpire = new ArrayList<Child>();
		
		for (Child c: allChildren) {
			if (c.getEmpire().equalsIgnoreCase(p.getEmpire())) {
				childOfYourEmpire.add(c);
			}
		}		
		return childOfYourEmpire;		
	}
	
}
