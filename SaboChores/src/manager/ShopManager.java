package manager;

import entity.*; 
import java.util.List;


public class ShopManager implements java.io.Serializable{

	//default constructor
	public ShopManager() {
		//create new items in the list.
	}
	
	/**
     * SingletonHolder is loaded on the first execution of Singleton.getInstance() 
     * or the first access to SingletonHolder.INSTANCE, not before.
     */
	private static class ShopManagerHolder { 
        public static final ShopManager INSTANCE = new ShopManager();
	}
	
	public static ShopManager getInstance() {
        return ShopManagerHolder.INSTANCE;
	}
	
}
