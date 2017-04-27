package bs.com.dao;

import java.util.List;
import java.util.Map;

import bs.com.bean.Food;
import bs.com.bean.Sales;
import bs.com.bean.Stock;
import bs.com.bean.User;


public interface ICSDao {

	public List<Food> queryFood(Map<String,Object> param);
	public int addFood(Map<String,Object> param);
	public int delFood(Map<String,Object> param);
	
	public List<Sales> querySales(Map<String,Object> param);
	public int addSales(Map<String,Object> param);
	
	public List<Stock> queryStock(Map<String,Object> param);
	public int addStock(Map<String,Object> param);
	
	public List<User> queryUser(Map<String,Object> param);
	public int addUser(Map<String,Object> param);
}
