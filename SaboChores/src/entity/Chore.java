package entity;


public class Chore implements java.io.Serializable {
	
	int choreID, points;
	String taskDesc, status, takenBy, saboBy, empire;
	
	//public constructor
	public Chore() {	
	}
	
	//new child with the following attributes.
	public Chore(int choreID, String taskDesc, String status, int points, String takenBy, String saboBy, String empire) {
		this.choreID = choreID;
		this.taskDesc = taskDesc;
		this.status = status;
		this.points = points;
		this.takenBy = takenBy;
		this.saboBy = saboBy;
		this.empire = empire;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public void setChoreTakenBy(String username) {
		this.takenBy = username;
	}
	
	public void setSaboBy(String username) {
		this.saboBy = username;
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
	
	public String getEmpire() {
		return this.empire;
	}
	
}
