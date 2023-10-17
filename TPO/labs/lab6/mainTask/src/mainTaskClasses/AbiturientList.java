package mainTaskClasses;

import java.util.*;

public class AbiturientList {
	ArrayList<Abiturient> abiturients ;
	int id ;
	public  AbiturientList(int _id){
		id = _id;
		abiturients = new ArrayList<>();
	}
	public void AddAbiturient(Abiturient abiturient){
		abiturients.add(abiturient);
	}
	public void badMarks(){
		List<Abiturient> badAbiturients = new ArrayList<>();
		for (var abitur:abiturients) {
			for (var mark:abitur.marks) {
				if(mark<4){
					badAbiturients.add(abitur);
					break;
				}
			}
		}
		for (var abiturient:badAbiturients) {
			System.out.println(abiturient.toString());
		}
	}
	public void HigherMarks(float _mark){
		List<Abiturient> goodAbiturients = new ArrayList<>();
		double sum =0;
		for (var abitur:abiturients) {
			for (var mark:abitur.marks) {
				sum+=mark;
			}
			if(sum>_mark)
				goodAbiturients.add(abitur);
			sum=0;
		}
		for (var abiturient:goodAbiturients) {
			System.out.println(abiturient.toString());
		}
	}
	public void SelectAbitur(int number){
		Double sum = 0.0;
		for (var abiturient:abiturients) {
			for (var mark:abiturient.marks) {
				sum +=mark;
			}
			abiturient.sum = sum;
		}
		
		int j;
		for (int i = 1; i < abiturients.size(); i++) {
			Abiturient swap = abiturients.get(i);
			for (j = i; j > 0 && swap.sum < abiturients.get(j - 1).sum; j--) {
				var t = abiturients.get(j - 1);
				abiturients.remove(j);
				abiturients.add(j,t);
			}
			abiturients.remove(j);
			abiturients.add(j,swap);
		}
		List<Abiturient>SelectedAbiturients=new ArrayList<>();
		for (int i = 0;i<number;i++){
			System.out.println(abiturients.get(i).toString());
		}
	}
	
	
}
