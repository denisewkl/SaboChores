package manager;

import entity.*; 

import java.util.ArrayList;
import java.util.List;


public class FamilyManager implements java.io.Serializable{
	
		
	List<Child> allChildren = new ArrayList<Child>();
	List<Parent> allParent = new ArrayList<Parent>();

	//default constructor
	public FamilyManager() {
		Child agurz = new Child("agurz","agurz","Good Kid","Empire 2", 100, 1000, 10000);
		Child freda = new Child("freda","freda","Angel","Empire 2", 100, 100, 1000);
		Child john = new Child("john","john","Angel","Empire 2", 100, 100, 1000);
		Child min = new Child("min","min","Angel","Empire 3", 100, 100, 1000);
		Child serene = new Child("serene","serene","Angel","Empire 3", 100, 100, 1000);
		allChildren.add(agurz);
		allChildren.add(freda);
		allChildren.add(john);
		allChildren.add(min);
		allChildren.add(serene);
		
		//creating all the parent out first.
		Parent denise = new Parent("denise","denise","Empire 1");
		Parent rafael = new Parent("rafael","rafael","Empire 3");
		Parent robin = new Parent("robin","robin","Empire 2");
		Parent jun = new Parent("jun","jun","Empire 3");
		Parent joke = new Parent("joke","joke","Empire 4");
		allParent.add(denise);
		allParent.add(rafael);
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

	//retrieving the particular child
	public Child getChild (String username) {
		
		for (Child c: this.getAllChildren()) {
			if (c.getUserName().equalsIgnoreCase(username)) {
				return c;
			}
		}
		
		return null;
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
	
}
