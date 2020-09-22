package dao;

import vo.UserInfoVO;

public interface UserInfoDAO {
	int insertUserInfo(UserInfoVO ui);
	UserInfoVO selectUserInfoForLogin(UserInfoVO ui);
}
