package kr.co.mlec.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Info")
public class InfoServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String gender = req.getParameter("gender");
		String[] mail = req.getParameterValues("mail");
		String job = req.getParameter("job");
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		boolean noti =false;
		boolean ad =false;
		boolean ship =false;
		for(int i=0;i<mail.length;i++) {
			if(mail[i].equals("notice")) {
				noti=true;
			}else if(mail[i].equals("ad")) {
				ad = true;
			}else if(mail[i].equals("ship")) {
				ship = true;
			}
		}
		String notiStr = (noti)?"받음":"받지않음";
		String adStr = (ad)?"받음":"받지않음";
		String shipStr = (ship)?"받음":"받지않음";

		
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("</HEAD>");
		out.println("<h1>개인 정보 출력</h1><br>");
		out.println("이름 : "+name+"<br>");
		out.println("아이디 : "+id+"<br>");
		out.println("암호 : "+pw+"<br>");
		out.println("성별 : "+gender +"<br>");
		out.println("공지메일 : "+notiStr+"<br>");
		out.println("광고메일 : "+adStr+"<br>");
		out.println("배송 확인 메일 : "+shipStr+"<br>");
		out.println("직업 : "+job+"<br>");
		out.println("</BODY>");
		out.println("</HTML>");
		
		out.flush();
		out.close();
		
	}

}
