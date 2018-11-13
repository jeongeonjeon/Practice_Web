package kr.co.mlec.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/table")
public class TableServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String row = req.getParameter("row");
		String col = req.getParameter("col");
		
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<table border='1' cellpadding='10' cellspacing='0'>");
		if(row==""||row==null) {
			row = "5";
		}
		if(col==""||col==null) {
			col = "5";
		}
		int i_row = Integer.parseInt(row);
		int i_col = Integer.parseInt(col);
		

		for(int i=0;i<i_row;i++) {
			out.println("<tr>");
			for(int j=0;j<i_col;j++) {
				out.println("<td>");
				out.println("cell("+i+","+j+")");
				out.println("</td>");
			}
			out.println("</tr>");
		}
		out.println("</table>");
		out.println("</BODY>");
		out.println("</HTML>");
		
		out.flush();
		out.close();
		
	}
}
