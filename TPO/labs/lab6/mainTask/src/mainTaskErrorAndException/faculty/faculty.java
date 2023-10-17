package mainTaskErrorAndException.faculty;

import mainTaskErrorAndException.group.group;

import java.util.ArrayList;
import java.util.List;

public class faculty {
	public int id;
	public faculty(int ID){
		id = ID;
		groups = new ArrayList<>();
	}
	public List<group> groups;
	public void addGroup(group group){
		groups.add(group);
	}
	public List<group> getGroups() throws ZeroGroupsException {
		if(groups.size() == 0){
			throw new ZeroGroupsException("faculty dont have groups",0);
		}
		return groups;
	}
}
class ZeroGroupsException extends Exception{
	private int number;
	public int getNumber(){return number;}
	public ZeroGroupsException(String message, int num){
		super(message);
		number=num;
	}
}
