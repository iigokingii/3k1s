package mainTaskJDBC;

public class Manufacturer {
	private int ID;
	private String Name;
	private String Country;
	public Manufacturer(){
	
	}
	
	@Override
	public String toString() {
		return "Manufacturer{" +
				"ID=" + ID +
				", Name='" + Name + '\'' +
				", Country='" + Country + '\'' +
				'}';
	}
	
	public Manufacturer(int _ID, String _Name, String _Country){
		setID(_ID);
		setName(_Name);
		setCountry(_Country);
	}
	public void setName(String name) {
		Name = name;
	}
	public void setID(int ID) {
		this.ID = ID;
	}
	public String getName() {
		return Name;
	}
	public int getID() {
		return ID;
	}
	public String getCountry() {
		return Country;
	}
	
	public void setCountry(String country) {
		Country = country;
	}
}
