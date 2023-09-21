package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Product
 */
@WebServlet("/Product")
public class Product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Product() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String gubun = request.getParameter("t_gubun");
		if(gubun == null) gubun ="shop";
		String viewPage ="";
		
		//상품목록
		if(gubun.equals("shop")) {
			viewPage ="product/shop.jsp";
		//관리페이지
		} else if(gubun.equals("manage_list")) {
			viewPage ="product/manage_list.jsp";
		//장바구니	
		} else if(gubun.equals("basket")) {
			viewPage ="product/basket.jsp";
		//판매통계
		} else if(gubun.equals("manage_statistics")) {
			viewPage ="product/manage_statistics.jsp";
		//관리 페이지 신규 등록	
		} else if(gubun.equals("manage_create")) {
			viewPage ="product/manage_create.jsp";
		//장바구니 구매하기
		} else if(gubun.equals("purchase")) {
			viewPage ="product/purchase.jsp";
		//상품구매 상세
		} else if(gubun.equals("detail")) {
			viewPage ="product/detail.jsp";
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
