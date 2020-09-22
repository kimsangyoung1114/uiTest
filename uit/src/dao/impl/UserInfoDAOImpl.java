package dao.impl;

import org.apache.ibatis.session.SqlSession;


import dao.UserInfoDAO;
import servlet.MybatisServlet;
import vo.UserInfoVO;

public class UserInfoDAOImpl implements UserInfoDAO{

	@Override
	public int insertUserInfo(UserInfoVO ui) {
		try(SqlSession ss = MybatisServlet.getSession()){
			int insert =ss.insert("UserInfo.insertUserInfo", ui);
			ss.commit();
			return insert;
			
			}
	
	}

	@Override
	public UserInfoVO selectUserInfoForLogin(UserInfoVO ui) {
		try(SqlSession ss = MybatisServlet.getSession()){
			
			return ss.selectOne("UserInfo.selectUserInfoForLogin",ui);

			
			
		}
	
	}
	
	public static void main(String[] args) {
		
		UserInfoDAO udao = new UserInfoDAOImpl();
		UserInfoVO uv = new UserInfoVO();
		uv.setUiId("test");
		uv.setUiPassword("test");
		System.out.println(udao.selectUserInfoForLogin(uv));
		
		
		
		
		
	}

}
