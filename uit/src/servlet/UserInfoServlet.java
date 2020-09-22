package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.UserInfoDAO;
import dao.impl.UserInfoDAOImpl;
import service.UserInfoService;
import service.impl.UserInfoServiceImpl;
import vo.UserInfoVO;

@WebServlet("/ajax/user")
public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserInfoService uis = new UserInfoServiceImpl();   
    private Gson gs = new Gson();
    private UserInfoDAO udao = new UserInfoDAOImpl();
  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		BufferedReader br = request.getReader();
		String str;
		StringBuffer sb = new StringBuffer();
		while((str=br.readLine())!=null){
		sb.append(str);
	
		}
		UserInfoVO ui = gs.fromJson(sb.toString(), UserInfoVO.class);
		Map<String,Object> rMap = new HashMap<>();
		if("insert".equals(ui.getCmd())) {
			rMap.put("result",uis.insertUserInfo(ui));
			
			}else if("login".equals(ui.getCmd())) {
					
				if(uis.doLogin(ui, request)==true) {
					rMap.put("result",uis.doLogin(ui, request));
					System.out.println(rMap);
					}

			}
	
		String json = gs.toJson(rMap);
		PrintWriter pw = response.getWriter();
		pw.print(json);
		
		}
	}


