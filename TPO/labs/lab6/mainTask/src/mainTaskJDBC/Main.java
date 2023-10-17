package mainTaskJDBC;

import java.util.List;

public class Main {
	public static void main(String[] args) {
		ConnectDatabase db = new ConnectDatabase();
		DBCommands dbCommands = new DBCommands(db);
		List<Souvenir> souvenirs1= dbCommands.GetList();
		System.out.println("FUNC1 ===>");
		for (var sou:souvenirs1) {
		 	System.out.println(sou.toString());
		}
		System.out.println("FUNC2 ===>");
		List<Souvenir> souvenirs2= dbCommands.GetListByCountry();
		for (var sou:souvenirs2) {
			System.out.println(sou.toString());
		}
		System.out.println("FUNC3 ===>");
		List<Manufacturer> Manufacturers= dbCommands.GetListByPrice();
		for (var Manufacturer:Manufacturers) {
			System.out.println(Manufacturer.toString());
		}
		System.out.println("FUNC4 ===>");
		List<Manufacturer> Manufacturers1= dbCommands.GetListByYear();
		for (var Manufacturer:Manufacturers1) {
			System.out.println(Manufacturer.toString());
		}
		System.out.println("FUNC5 ===>");
	}
}
