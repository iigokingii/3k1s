package mainTaskErrorAndException.group;
import mainTaskErrorAndException.student.student;

import java.util.ArrayList;
import java.util.List;

public class group {
	public int id;
	public group(int ID){
		id = ID;
		students = new ArrayList<>();
	}
	public void addStudent(student student){
		students.add(student);
	}
	public List<student> students;
	public List<student> getStudents() throws ZeroStudentsException {
		if(students.size()==0){
			throw new ZeroStudentsException("group dont have students",0);
		}
		return students;
	}
}
class ZeroStudentsException extends Exception{
	
	private int number;
	public int getNumber(){return number;}
	public ZeroStudentsException(String message, int num){
		super(message);
		number=num;
	}
}
