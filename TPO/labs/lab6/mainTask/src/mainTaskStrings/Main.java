package mainTaskStrings;

import java.util.*;

public class Main {
	public static void main(String[] args) {
		String text = "Когда человек сознательно или интуитивно выбирает себе в жизни какую-то цель, жизненную задачу, он невольно дает себе оценку.";
		//5
		String[]words = text.split(" ");
		int position = 0;
		String firstWord=words[position];
		String LastWord="";
		for (int i = 0;i<words.length;i++) {
			if(words[i].endsWith(".")){
				LastWord = words[i].substring(0, words[i].length()-1);
				words[position]=LastWord;
				words[i]=firstWord;
				position = i+1;
			}
		}
		String str = Arrays.toString(words);
		System.out.println("(5)Edited string: "+str);
		
		
		
		//16
		String [] Words = text.split(" ");
		String stroke="some text";
		for (int i = 0;i<Words.length;i++) {
			if(Words[i].length()==5)
				Words[i]=stroke;
		}
		str = Arrays.toString(Words);
		System.out.println("(16)Edited string: "+str);
		
		
		
		//12
		String []S =text.split(" ");
		for (int i=0;i<S.length;i++){
			if(S[i].length()==11&&CheckFirstLetter(S[i])){
				S=remove(S,i);
			}
		}
		System.out.println("(12)Edited string: "+Arrays.toString(S));
		
		//8
		List<String> words2 = new LinkedList<String>(Arrays.asList(text.split("[\\s\\p{Punct}]+")));
		Collections.sort(words2, CompareByFirstConsonant.getInstance());
		
		for (ListIterator<String> iterator = words2.listIterator(); iterator.hasNext(); ) {
			if (!startsWithVovel(iterator.next()))
				iterator.remove();
		}
		System.out.println("(8)Edited string: "+words2);
		
		//4
		String text2 ="Только такая цель позволяет человеку прожить свою жизнь с достоинством и получить настоящую радость. Да, радость! Подумайте: если человек ставит себе задачей увеличивать в жизни добро, приносить людям счастье, какие неудачи могут его постигнуть? Не тому помочь? Но много ли людей не нуждаются в помощи?";
		String[] ass = text2.split(" ");
		String []sa=new String[text2.length()];
		int index = 0;
		System.out.println("(4)Edited string: ");
		for (int i=0;i<ass.length;i++){
			sa[index] = ass[i];
			index++;
			if(ass[i].endsWith("?")){
				for(int j = 0; j<sa.length;j++){
					if(index>j){
						if(sa[j].length()==4){
							System.out.println(sa[j]);
						}
					}
					
				}
			}
			else if(ass[i].endsWith(".")||ass[i].endsWith("!")){
				index = 0;
			}
		}
		
		
		
		
	}
	
	
	
	
	
	
	
	public static String[] remove(String[] values, int index) {
		var result = new String[values.length - 1];
		for (var i = 0; i < values.length; i++) {
			if (i != index) {
				var newIndex = i < index ? i : i - 1;
				result[newIndex] = values[i];
			}
		}
		return result;
	}
	private static boolean CheckFirstLetter(String word){
		char[]arr =new char[]{'й','ц','к','н','г','ш','щ','з','х','ф','в','п','р','л','д','ж','ч','с','м','т','ь','б'};
		for (int i =0;i<arr.length;i++){
			if(word.charAt(0)== arr[i]){
				return true;
			}
		}
		return false;
	}
	public static boolean startsWithVovel(String s) {
		return s.length() > 0 && !CompareByFirstConsonant.isConsonant(s.charAt(0));
	}
}

class CompareByFirstConsonant implements Comparator<String> {
	private final static Comparator<String> instance = new CompareByFirstConsonant();
	private final static String CONSONANTS = "BCDFGHJKLMNPQRSTVXZWYЙЦКНГШЩЗХЪФВПРЛДЖЧСМТЬБ";
	
	public static Comparator<String> getInstance() {
		return instance;
	}
	
	public static boolean isConsonant(Character c) {
		return CONSONANTS.indexOf(Character.toUpperCase(c)) > -1;
	}
	
	private Character getFirstConsonant(String string) {
		for (int i = 0; i < string.length(); ++i)
			if (isConsonant(string.charAt(i)))
				return string.charAt(i);
		return Character.MIN_VALUE;
	}
	
	@Override
	public int compare(String a, String b) {
		Character consonantA = getFirstConsonant(a);
		Character consonantB = getFirstConsonant(b);
		return consonantA.compareTo(consonantB);
	}
}
