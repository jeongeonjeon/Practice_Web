package kr.co.mlec.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/exam")	//servlet 3.0이후의 web_xml대체 어노테이션, web_xml에 동일한 이름이 있는경우 에러난다.
public class ExamMethodServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
//		String hobby = req.getParameter("hobby");
		String[] hobby = req.getParameterValues("hobby");
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();

		StringBuilder sb = new StringBuilder();
		
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("이름 : "+name+"<br>");
		out.println("취미 : ");
//		for(String data : hobby) {
//			out.println(data+"&nbsp");
//		}
		
//		for(int i=0;i<hobby.length;i++) {
//			if(i!=1) {
//				out.println(", &nbsp;");
//			}
//			out.println(hobby[i]);
//		}
		
		for(int i=0;i<hobby.length;i++) {
			if(i!=1) {
				sb.append(", &nbsp;");
			}
			sb.append(hobby[i]);
		}
		
		out.println(sb.toString()+"<br>");
		out.println("</BODY>");
		out.println("</HTML>");
		
		out.flush();
		out.close();
	}
}
