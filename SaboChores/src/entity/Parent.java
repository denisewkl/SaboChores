package entity;

public class Parent implements java.io.Serializable{

	String username, password,email, empire;
	
	//public default constructor.
	public Parent() {
	}
	
	public Parent(String username, String password,String email, String empire) {
		this.username = username;
		this.password = password;
		this.email = email; 
		this.empire = empire; 
	}
	
	public String getUserName() {
		return this.username;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public String getEmpire() {
		return this.empire;
	}
	
}
