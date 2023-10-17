package mainTaskClasses;

public class Main {
	public static void main(String[] args) {
		double[] mark1 = new double[]{2,4,6};
		double[] mark2 = new double[]{7,8,9};
		double[] mark3 = new double[]{1,2,3};
		
		Abiturient abiturient1 = new Abiturient(0,"kirill","xx","vv","sss 14,64",mark1);
		Abiturient abiturient2 = new Abiturient(1,"evgeniy","xxxzzxx","weqwwev","ss 24,4",mark2);
		Abiturient abiturient3 = new Abiturient(2,"valeriy","xcxzczxc","wsdasd","ss 2,4",mark3);
		
		AbiturientList abiturientList = new AbiturientList(0);
		abiturientList.AddAbiturient(abiturient1);
		abiturientList.AddAbiturient(abiturient2);
		abiturientList.AddAbiturient(abiturient3);
		System.out.println("Func1:");
		abiturientList.badMarks();
		System.out.println("Func2:");
		abiturientList.HigherMarks(6);
		System.out.println("Func3:");
		abiturientList.SelectAbitur(2);
	}
	
	
	

}
