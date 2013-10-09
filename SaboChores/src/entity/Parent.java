package entity;

public class Parent implements java.io.Serializable{

	String username, password, empire;
	
	//public default constructor.
	public Parent() {
	}
	
	public Parent(String username, String password, String empire) {
		this.username = username;
		this.password = password;
		this.empire = empire; 
	}
	
	public String getUserName() {
		return this.username;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public String getEmpire() {
		return this.empire;
	}
	
}
