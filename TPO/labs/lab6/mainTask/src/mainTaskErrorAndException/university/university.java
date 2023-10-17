package mainTaskErrorAndException.university;

import mainTaskErrorAndException.faculty.faculty;

import java.util.ArrayList;
import java.util.List;

public class university {
	public int id;
	public university(int ID){
		id = ID;
		faculties = new ArrayList<>();
	}
	public List<faculty> faculties;
	public void addFaculty(faculty faculty){
		faculties.add(faculty);
	}
	public double getAverageSubjectAndGroup(int facultyId,int groupId,int subjectId){
		double sum=0;
		for (var faculty: faculties) {
			if(faculty.id==facultyId){
				for (var group:faculty.groups) {
					if(group.id == groupId){
						for (var student:group.students) {
							for (var subject:student.subjects) {
								if(subject.id == subjectId){
									sum += subject.mark;
								}
							}
						}
						return sum/group.students.size();
					}
				}
			}
		}
		return -1;
	}
	public double getAverageSubject(int subjectId){
		double sum = 0;
		int studCount=0;
		for (var faculty: faculties) {
			for (var group:faculty.groups) {
				for (var student:group.students) {
					for (var subject:student.subjects) {
						if(subject.id == subjectId){
							sum += subject.mark;
							studCount++;
						}
					}
				}
				return sum/studCount;
			}
		}
		return -1 ;
	}
	public List<faculty> getFaculties() throws ZeroFacultiesException {
		if(faculties.size()== 0){
			throw new ZeroFacultiesException("university dont have faculties",0);
		}
		return faculties;
	}
	
}
class ZeroFacultiesException extends Exception{
	
	private int number;
	public int getNumber(){return number;}
	public ZeroFacultiesException(String message, int num){
		super(message);
		number=num;
	}
}
