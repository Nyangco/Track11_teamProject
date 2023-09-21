package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Board
 */
@WebServlet("/Board")
public class Board extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Board() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String gubun = request.getParameter("t_gubun");
		if(gubun == null) gubun ="qna_list";
		String viewPage ="";
		
		//QNA 리스트
		if(gubun.equals("qna_list")) {
			viewPage ="board/qna_list.jsp";
		//FAQ 리스트
		} else if(gubun.equals("faq_list")) {
			viewPage ="board/faq_list.jsp";
		//자유게시판
		} else if(gubun.equals("free_board")) {
			viewPage ="board/free_board.jsp";
		//QNA 상세	
		} else if(gubun.equals("qna_detail")) {
			viewPage ="board/qna_detail.jsp";
		//QNA 수정	
		} else if(gubun.equals("qna_update")) {
			viewPage ="board/qna_update.jsp";	
		//FAQ 상세	
		} else if(gubun.equals("faq_detail")) {
			viewPage ="board/faq_detail.jsp";
		//FAQ 수정	
		} else if(gubun.equals("faq_update")) {
			viewPage ="board/faq_update.jsp";	
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
