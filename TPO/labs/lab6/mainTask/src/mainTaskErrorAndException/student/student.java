package mainTaskErrorAndException.student;

import mainTaskErrorAndException.subject.subject;

import java.util.ArrayList;
import java.util.List;

public class student {
	public student(int ID){
		id = ID;
		subjects = new ArrayList<>();
	};
	public int id;
	public List<subject> subjects;
	public void addSubj(subject subject){
		subjects.add(subject);
	}
	public double getAverage(){
		double average = 0;
		for (var t :
			 subjects) {
			average +=t.mark;
		}
		return average/subjects.size();
	}
	
	public List<subject> getSubjects() throws ZeroSubjectsException {
		if(subjects.size()== 0){
			throw new ZeroSubjectsException("Student dont have subject",0);
		}
		return subjects;
	}
}
class ZeroSubjectsException extends Exception{
	
	private int number;
	public int getNumber(){return number;}
	public ZeroSubjectsException(String message, int num){
		super(message);
		number=num;
	}
}
