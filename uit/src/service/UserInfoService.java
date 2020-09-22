package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import vo.UserInfoVO;

public interface UserInfoService {
	int insertUserInfo(UserInfoVO ui);
	boolean doLogin(UserInfoVO ui,HttpServletRequest  request);
}
