package mainTaskErrorAndException.subject;

public class subject {
	public int id;
	public subject(int ID, double mark) throws SetMarkException {
		id = ID;
		setMark(mark);
	}
	public double mark;
	
	public void setMark(double mark) throws SetMarkException {
		if(mark<0 || mark>10){
			throw new SetMarkException("mark less than 0 or bigger than 10",mark);
		}
		this.mark = mark;
	}
}
class SetMarkException extends Exception{
	
	private double number;
	public double getNumber(){return number;}
	public SetMarkException(String message, double num){
		
		super(message);
		number=num;
	}
}
