package mainTaskCollections;

import java.util.ArrayList;
import java.util.List;

public class Taksopark {
	int id;
	List<Car> carList;
	public Taksopark(int _id){
		id = _id;
		carList = new ArrayList<>();
	}
	public void addTransport(Car car){
		carList.add(car);
	}
	public void getAllCost(){
		double sum=0;
		for (var t:carList) {
			sum+=t.cost;
		}
		System.out.println("All cost: "+sum);
	}
	public Car findCarBySpeed(int maxspeed){
		for (var t:carList) {
			if(t.speed>0 && t.speed<=maxspeed){
				return t;
			}
		}
		return null;
	}
}
