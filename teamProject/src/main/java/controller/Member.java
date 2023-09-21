package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Member
 */
@WebServlet("/Member")
public class Member extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String gubun = request.getParameter("t_gubun");
		if(gubun == null) gubun ="memberLogin";
		String viewPage ="";
		
		//회원가입폼
		if(gubun.equals("memberJoin")) {
			viewPage ="member/join.jsp";
		//로그인 폼
		} else if(gubun.equals("memberLogin")) {
			viewPage ="member/login.jsp";
		//마이 페이지	
		} else if(gubun.equals("memberMypage")) {
			viewPage ="member/mypage.jsp";
		//구매 이력
		} else if(gubun.equals("purchase_list")) {
			viewPage ="member/purchase_list.jsp";
		//구매 이력 상세보기	
		} else if(gubun.equals("purchase_detail")) {
			viewPage ="member/purchase_detail.jsp";
		//반품	
		} else if(gubun.equals("refund")) {
			viewPage ="member/refund.jsp";
		//회원정보변경	
		} else if(gubun.equals("update")) {
			viewPage ="member/update.jsp";
		}	
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
