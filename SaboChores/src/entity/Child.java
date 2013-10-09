package entity;


public class Child implements java.io.Serializable {

	String username;
	String password;
	String title;
	String empire;
	int points;
	int saboTix;
	int moneyTix;
	
	//public constructor
	public Child() {	
	}
	
	//new child with the following attributes.
	public Child(String username, String password, String title, String empire, int points, int saboTix, int moneyTix) {
		this.username = username;
		this.password = password;
		this.title = title;
		this.empire = empire;
		this.points = points;
		this.saboTix = saboTix;
		this.moneyTix = moneyTix;
	}
		
	//setting the title of the child.
	public void setTitle(String title) {
		this.title = title;
	}
	
	//setting the empire the child is in.
	public void setEmpire(String empire) {
		this.empire= empire;
	}
	
	//setting the points for the child.
	public void setPoints(int points) {
		this.points= points;
	}
	
	//setting the number of sabo tix the child has.
	public void setSaboTix(int saboTix) {
		this.saboTix= saboTix;
	}
	
	//setting the number of money tix the child has.
	public void setMoneyTix(int moneyTix) {
		this.moneyTix= moneyTix;
	}
	
	//getting name of the child.
	public String getUserName() {
		return this.username;
	}
	
	//getting password of the child.
	public String getPassword() {
		return this.password;
	}
				
	//getting the title of the child.
	public String getTitle() {
		return this.title;
	}
	
	//getting the empire of the child.
	public String getEmpire() {
		return this.empire;
	}
	
	//getting the points of the child.
	public int getPoints() {
		return this.points;
	}
	
	//getting the sabotix of the child.
	public int getSaboTix() {
		return this.saboTix;
	}
	
	//getting the money tix of the child.
	public int getMoneyTix() {
		return this.moneyTix;
	}
	
	
}
