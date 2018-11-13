package kr.co.mlec.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

public class HelloServlet extends HttpServlet {

	
//	//이미  HttpServlet이 상속받고 있는 GenericServlet클래스에 init메소드가 정의되어있기 때문에 없어도 잘 실행된다.
//	@Override
//	public void init(ServletConfig config) throws ServletException {
//		System.out.println("[init] 최초 한번만 실행되는 메소드입니다.");
//	}

	//service는 우리가 재정의 해야하는 부분이다.
	@Override
	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
		System.out.println("[service] 실제 작업이 실행되는 메소드입니다.");
	}

	@Override
	public void destroy() {
		System.out.println("[destroy]...");
	}
}
