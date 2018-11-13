package kr.co.mlec.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//http://localhost:9999/Lecture_Web/method?id=hong 요청처리 --web.xml에 써줘야함
public class methodServlet extends HttpServlet{
	
	@Override
//	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
//		System.out.println("요청처리...");
		
		request.setCharacterEncoding("utf-8");
		
		//url은 실제 주소을 의미하고, uri는 가상의 주소를 의미한다.
		String method = request.getMethod();
		String uri = request.getRequestURI();
		StringBuffer url = request.getRequestURL();
		String id = request.getParameter("id");
		
		//콘솔에 출력
		System.out.println("method: "+method);
		System.out.println("uri : "+uri);
		System.out.println("url : "+url.toString());
		System.out.println("id : "+id);
		
		//웹브라우저에 출력
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		out.println("<html>");
		out.println("	<head>");
		out.println("	</head>");
		out.println("	<body>");
		out.println("=====================================<br>");
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;출력결과<br>");
		out.println(" 파라미터(id) : "+id+"<br>");
		out.println(" 요청방식 : "+method+"<br>");
		out.println(" 요청 URL : "+url+"<br>");
		out.println(" 요청 URI : "+uri+"<br>");
		out.println("=====================================<br>");
		out.println("	</body>");
		out.println("</html>");
		
		out.flush();
		out.close();
		
	}//end of doGet()

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}





