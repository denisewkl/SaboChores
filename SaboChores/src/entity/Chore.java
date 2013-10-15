package entity;


public class Chore implements java.io.Serializable {
	
	int choreID, points;
	String taskDesc, status, takenBy, saboBy;
	
	//public constructor
	public Chore() {	
	}
	
	//new child with the following attributes.
	public Chore(int choreID, String taskDesc, String status, int points, String takenBy, String saboBy) {
		this.choreID = choreID;
		this.taskDesc = taskDesc;
		this.status = status;
		this.points = points;
		this.takenBy = takenBy;
		this.saboBy = saboBy;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public void setChoreTakenBy(String username) {
		this.takenBy = username;
	}
	
	public int getChoreID() {
		return this.choreID;
	}
	
	public String getTaskDescription() {
		return this.taskDesc;
	}
	
	public String getChoreStatus() {
		return this.status;
	}
	
	public int getChorePoints() {
		return this.points;
	}
	
	public String getChoreTakenBy() {
		return this.takenBy;
	}
	
	public String getSaboBy() {
		return this.saboBy;
	}
	
}