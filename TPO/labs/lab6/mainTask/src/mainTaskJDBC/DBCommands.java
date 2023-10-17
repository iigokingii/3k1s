package mainTaskJDBC;

import mainTaskJDBC.ConnectDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class DBCommands {
	private ConnectDatabase database;
	public DBCommands(ConnectDatabase database){
		this.database = database;
	}
	List<Souvenir> Souvenirs;
	public List<Souvenir>GetList(){
		List<Souvenir> objects= new ArrayList<Souvenir>();
		try {
			Connection con =database.getConnection();
			PreparedStatement statement =con.prepareStatement("SELECT * FROM MANUFACTURER INNER JOIN SOUVENIER ON MANUFACTURER.MANUFACTURER_ID=SOUVENIER.MANUFACTURER_ID where MANUFACTURER_NAME like '%MINSJ%';");
			ResultSet resultSet =statement.executeQuery();
			while (resultSet.next()){
				Souvenir object = new Souvenir();
				object.setName(resultSet.getString("SOUVENIER_NAME"));
				object.setID(resultSet.getInt("SOUVENIER_ID"));
				object.setPrice(resultSet.getInt("PRICE"));
				object.setProducer(resultSet.getString("MANUFACTURER_NAME"));
				object.setDate(resultSet.getString("DATE"));
				objects.add(object);
			}
			resultSet.close();
			statement.close();
			con.close();
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return objects;
	}
	public List<Souvenir>GetListByCountry(){
		List<Souvenir> objects= new ArrayList<Souvenir>();
		try {
			Connection con =database.getConnection();
			PreparedStatement statement =con.prepareStatement("SELECT * FROM MANUFACTURER INNER JOIN SOUVENIER ON MANUFACTURER.MANUFACTURER_ID=SOUVENIER.MANUFACTURER_ID where COUNTRY like '%BELARUS%';");
			ResultSet resultSet =statement.executeQuery();
			while (resultSet.next()){
				Souvenir object = new Souvenir();
				object.setName(resultSet.getString("SOUVENIER_NAME"));
				object.setID(resultSet.getInt("SOUVENIER_ID"));
				object.setPrice(resultSet.getInt("PRICE"));
				object.setProducer(resultSet.getString("MANUFACTURER_NAME"));
				object.setDate(resultSet.getString("DATE"));
				objects.add(object);
			}
			resultSet.close();
			statement.close();
			con.close();
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return objects;
	}
	public List<Manufacturer>GetListByPrice(){
		List<Manufacturer> objects= new ArrayList<Manufacturer>();
		try {
			Connection con =database.getConnection();
			PreparedStatement statement =con.prepareStatement("SELECT * FROM MANUFACTURER INNER JOIN SOUVENIER ON MANUFACTURER.MANUFACTURER_ID=SOUVENIER.MANUFACTURER_ID where PRICE<20;");
			ResultSet resultSet =statement.executeQuery();
			while (resultSet.next()){
				Manufacturer object = new Manufacturer();
				object.setName(resultSet.getString("MANUFACTURER_NAME"));
				object.setID(resultSet.getInt("MANUFACTURER_ID"));
				object.setCountry(resultSet.getString("COUNTRY"));
				objects.add(object);
			}
			resultSet.close();
			statement.close();
			con.close();
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return objects;
	}
	public List<Manufacturer>GetListByYear(){
		List<Manufacturer> objects= new ArrayList<Manufacturer>();
		try {
			Connection con =database.getConnection();
			PreparedStatement statement =con.prepareStatement("SELECT * FROM MANUFACTURER INNER JOIN SOUVENIER ON MANUFACTURER.MANUFACTURER_ID=SOUVENIER.MANUFACTURER_ID WHERE DATE LIKE '2020' AND SOUVENIER_NAME LIKE 'SOUVENIER1';");
			ResultSet resultSet =statement.executeQuery();
			while (resultSet.next()){
				Manufacturer object = new Manufacturer();
				object.setName(resultSet.getString("MANUFACTURER_NAME"));
				object.setID(resultSet.getInt("MANUFACTURER_ID"));
				object.setCountry(resultSet.getString("COUNTRY"));
				objects.add(object);
			}
			resultSet.close();
			statement.close();
			con.close();
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return objects;
	}
	public void DeleteManAndSouv(){
		List<Manufacturer> objects= new ArrayList<Manufacturer>();
		try {
			Connection con =database.getConnection();
			PreparedStatement statement =con.prepareStatement("DELETE FROM SOUVENIER WHERE SOUVENIER_ID = 0;");
			statement.executeQuery();
			System.out.println("Строка удалена");
			statement.close();
			con.close();
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}
	
	
	/*public void AddObject(DBObject obj) {
		try {
			Connection con = database.getConnection();
			String sql = "INSERT INTO DBOBJECTS VALUES (?,?)";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, obj.getName());
			statement.setString(2,obj.getSurname());
			statement.executeUpdate();
		}
		catch (Exception ex){
			ex.printStackTrace();
		}*/
	//}
}