package mainTaskErrorAndException;
import mainTaskErrorAndException.student.student;
import mainTaskErrorAndException.group.group;
import mainTaskErrorAndException.university.university;
import mainTaskErrorAndException.faculty.faculty;
import mainTaskErrorAndException.subject.subject;
public class Main {
	public static void main(String[] args) {
		try {
			//exception 1
			//subject subject1 = new subject(0,-2.1);
			//ex2
			//student student1 = new student(0);
			//student1.getSubjects();
			//ex3
			//group group1 = new group(0);
			//group1.getStudents();
			//ex4
			//faculty faculty1 = new faculty(0);
			//faculty1.getGroups();
			//ex5
			//university university1 = new university(0);
			//university1.getFaculties();
			
			
			subject subject1 = new subject(0,6);
			subject subject2 = new subject(1,10);
			subject subject3 = new subject(2,7);
			subject subject4 = new subject(1,8);
			
			student student1 = new student(0);
			student1.addSubj(subject1);
			student1.addSubj(subject2);
			student1.addSubj(subject4);
			
			student student2 = new student(1);
			student2.addSubj(subject1);
			
			student student3 = new student(2);
			student3.addSubj(subject4);
			
			group group1 = new group(0);
			group1.addStudent(student1);
			group1.addStudent(student2);
			
			System.out.println("Func1 ===> Average of student1 :"+student1.getAverage());
			faculty faculty1 = new faculty(0);
			faculty1.addGroup(group1);
			faculty faculty2 = new faculty(1);
			
			university university1 = new university(0);
			university1.addFaculty(faculty1);
			System.out.println("Func2 ===> Average in group faculty by subject: "+university1.getAverageSubjectAndGroup(0,0,1));
			
			System.out.println("Func3 ===> Average of subject in university: "+university1.getAverageSubject(0));
			
			
			
		}
		catch (Exception ex){
			System.out.println(ex.toString());
		}
	}
}