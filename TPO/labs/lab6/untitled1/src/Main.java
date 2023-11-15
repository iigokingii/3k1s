
import java.util.ArrayList;

public class Main {
	static void merge (ArrayList<Integer> a, ArrayList<Integer> b ){
		int currentElementPosition = 0;
		int arrayListsSize = a.size();
		for (int i = 0 ; i<arrayListsSize; i++){
			int Ai = a.get(i);
			int Bi = b.get(i);
			if(Ai<Bi || Ai==Bi){
				int index = 0;
				int tempAi = 0;
				for (int j = i;j<a.size();j++) {
					tempAi = a.get(j);
					if(tempAi>Bi){
						index = j;
						break;
					}
				}
				if(index!=0 && tempAi!=0){
					a.remove(index);
					a.add(++currentElementPosition,Bi);
					a.add(++currentElementPosition,tempAi);
				}
				else{
					a.add(Bi);
				}
			}
			else if(Ai>Bi){
				a.remove(Ai);
				a.add(currentElementPosition++,Bi);
				a.add(currentElementPosition++,Ai);
			}
		}
		for (var t:a
		) {
			System.out.println(t);
		}
	}
	public static void main(String[] args) {
		ArrayList <Integer> s1 = new ArrayList();
		s1.add(1);
		s1.add(3);
		s1.add(5);
		ArrayList <Integer> s2 = new ArrayList();
		s2.add(2);
		s2.add(6);
		s2.add(8);
		merge(s1,s2);
		
	}
}