package bs.com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bs.com.bean.Sales;
import bs.com.bean.Stock;
import bs.com.bean.User;
import bs.com.service.ICSService;
import net.sf.json.JSONObject;

@RequestMapping("/")
@Controller
public class CsController {
	private static final SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	@Autowired
	private ICSService csService;
	@RequestMapping("login")
	public String login(HttpServletRequest request){
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			Map<String, Object> param = new HashMap<>();
			param.put("username", username);
			param.put("password", password);
			List<User> list = csService.queryUser(param );
			if(list.size()==0){
				return "error";
			}
			request.getSession().setAttribute("username", list.get(0).getUsername());
			if(list.get(0).getUsername().equals("admin")){
				return "index";
			}
		} catch (Exception e) {
		}
		return "salesadd";
	}
	@RequestMapping("addUser")
	public String addUser(HttpServletRequest request){
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			Map<String, Object> param = new HashMap<>();
			param.put("username", username);
			param.put("password", password);
			int code = csService.addUser(param);
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
		}
		return "user";
	}
	@RequestMapping("queryUser")
	@ResponseBody
	public JSONObject queryUser(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = new HashMap<>();
			List<User> list = csService.queryUser(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
		} catch (Exception e) {
		}
		return obj;
	}
	@RequestMapping("addSales")
	public String addSales(HttpServletRequest request){
		try {
			String fName = request.getParameter("fName");
			String num = request.getParameter("num");
			Map<String, Object> param = new HashMap<>();
			param.put("fName", fName);
			param.put("num", num);
			param.put("time", sf.format(new Date()));
			int code = csService.addSales(param);
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
		}
		return "user";
	}
	@RequestMapping("addStock")
	public String addStock(HttpServletRequest request){
		try {
			String fName = request.getParameter("fName");
			String num = request.getParameter("num");
			Map<String, Object> param = new HashMap<>();
			param.put("fName", fName);
			param.put("num", num);
			param.put("time", sf.format(new Date()));
			int code = csService.addStock(param);
			if(code!=1){
				return "error";
			}
		} catch (Exception e) {
		}
		return "user";
	}
	@RequestMapping("queryStock")
	@ResponseBody
	public JSONObject queryStock(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = new HashMap<>();
			List<Stock> list = csService.queryStock(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
		} catch (Exception e) {
		}
		return obj;
	}
	@RequestMapping("querySales")
	@ResponseBody
	public JSONObject querySales(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try {
			Map<String, Object> param = new HashMap<>();
			List<Sales> list = csService.querySales(param);
			obj.put("code", 200);
			obj.put("list", list);
			obj.put("size", list.size());
		} catch (Exception e) {
		}
		return obj;
	}
}
