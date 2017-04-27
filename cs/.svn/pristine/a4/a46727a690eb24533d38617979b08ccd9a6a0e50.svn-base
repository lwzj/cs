package bs.com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bs.com.bean.Food;
import bs.com.bean.Sales;
import bs.com.bean.Stock;
import bs.com.bean.User;
import bs.com.dao.ICSDao;
import bs.com.service.ICSService;

@Service("csService")
public class CSServiceImpl implements ICSService {

	@Autowired
	private ICSDao csDao;

	@Override
	public List<Food> queryFood(Map<String, Object> param) {
		return csDao.queryFood(param);
	}

	@Override
	public int addFood(Map<String, Object> param) {
		return csDao.addFood(param);
	}

	@Override
	public int delFood(Map<String, Object> param) {
		return csDao.delFood(param);
	}

	@Override
	public List<Sales> querySales(Map<String, Object> param) {
		return csDao.querySales(param);
	}

	@Override
	public int addSales(Map<String, Object> param) {
		return csDao.addSales(param);
	}

	@Override
	public List<Stock> queryStock(Map<String, Object> param) {
		return csDao.queryStock(param);
	}

	@Override
	public int addStock(Map<String, Object> param) {
		return csDao.addStock(param);
	}

	@Override
	public List<User> queryUser(Map<String, Object> param) {
		return csDao.queryUser(param);
	}

	@Override
	public int addUser(Map<String, Object> param) {
		return csDao.addUser(param);
	}

}
