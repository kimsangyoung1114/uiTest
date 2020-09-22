package service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;

import dao.UserInfoDAO;
import dao.impl.UserInfoDAOImpl;
import service.UserInfoService;
import vo.UserInfoVO;

public class UserInfoServiceImpl implements UserInfoService{

		
	private UserInfoDAO udao = new UserInfoDAOImpl();
	
	@Override
	public int insertUserInfo(UserInfoVO ui) {
		
		return udao.insertUserInfo(ui);
	}

	
	@Override
	public boolean doLogin(UserInfoVO ui, HttpServletRequest  request) {

		ui = udao.selectUserInfoForLogin(ui);
	
		if(ui!=null) {
			
			HttpSession hs = (HttpSession) request.getSession();
			hs.setAttribute("ui",ui);
						
			return true;
		}
		
		return false;
	}
}
