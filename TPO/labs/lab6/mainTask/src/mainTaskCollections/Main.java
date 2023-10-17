package mainTaskCollections;

public class Main {
	public static void main(String[] args) {
		LightCar lightCar1 = new LightCar(0,10000,9,1500,180);
		LightCar lightCar2 = new LightCar(1,7000,8,1000,150);
		HeavyCar heavyCar1 = new HeavyCar(0,20000,20,10000,30);
		HeavyCar heavyCar2 = new HeavyCar(0,30000,40,21000,40);
		
		Taksopark taksopark = new Taksopark(0);
		taksopark.addTransport(lightCar1);
		taksopark.addTransport(lightCar2);
		taksopark.addTransport(heavyCar1);
		taksopark.addTransport(heavyCar2);
		taksopark.getAllCost();
		var car = taksopark.findCarBySpeed(30);
		if(car!=null)
			System.out.println("id: "+car.id +" speed: "+ car.speed);
	}
}
