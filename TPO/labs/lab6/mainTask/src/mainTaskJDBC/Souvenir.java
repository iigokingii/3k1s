package mainTaskJDBC;

public class Souvenir {
	private int ID;
	private String Name;
	private String Producer;
	private String Date;
	private int Price;
	
	@Override
	public String toString() {
		return "id: "+ID + " name: "+Name + " producer: "+Producer + " date: "+Date + " price: "+Price;
	}
	
	public Souvenir(){
	
	}
	public Souvenir(int _ID, String _Name,String Producer,String Date,int Price){
		setID(_ID);
		setDate(Date);
		setName(_Name);
		setPrice(Price);
		setProducer(Producer);
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
	
	public String getProducer() {
		return Producer;
	}
	
	public void setProducer(String producer) {
		Producer = producer;
	}
	
	public String getDate() {
		return Date;
	}
	
	public void setDate(String date) {
		Date = date;
	}
	
	public int getPrice() {
		return Price;
	}
	
	public void setPrice(int price) {
		Price = price;
	}
}