package com.jsj.lang;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LanguageController")
public class LanguageController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		String language = request.getParameter("language");
		HttpSession session = request.getSession();
		
		System.out.println("언어 선택됨: "+language);
		
		session.setAttribute("language", language);
		
		response.setStatus(HttpServletResponse.SC_OK);
	}
}
