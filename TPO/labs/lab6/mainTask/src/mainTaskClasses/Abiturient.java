package mainTaskClasses;

public class Abiturient {
	int id;
	String surname;
	String name;
	String patronymic;
	String adress;
	String telephone;
	double[]marks;
	double sum;
	
	@Override
	public String toString() {
		return "id: "+id+" surname: "+surname+" name: "+name+" patronymic: "+patronymic;
	}
	public Abiturient(){
	
	}
	public Abiturient(int id) {
		this.id = id;
	}
	public Abiturient(int _id, String _name, String _surname, String _patronymic, String _adress ,double[]_marks){
		id=_id;
		name=_name;
		surname=_surname;
		patronymic=_patronymic;
		adress=_adress;
		marks=_marks;
	}
	public double[] getMarks() {
		return marks;
	}
	
	public void setMarks(double[] marks) {
		this.marks = marks;
	}
	
	public String getTelephone() {
		return telephone;
	}
	
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	
	public String getAdress() {
		return adress;
	}
	
	public void setAdress(String adress) {
		this.adress = adress;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPatronymic() {
		return patronymic;
	}
	
	public void setPatronymic(String patronymic) {
		this.patronymic = patronymic;
	}
	
	public void setSurname(String surname) {
		this.surname = surname;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	
	
	public String getSurname() {
		return surname;
	}
	
	public int getId() {
		return id;
	}
}
