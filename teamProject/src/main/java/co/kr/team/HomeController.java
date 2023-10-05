package co.kr.team;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import command.faq.DBfaq_delete;
import command.faq.DBfaq_write;
import command.faq.Faq_detail;
import command.faq.Faq_list;
import command.faq.Faq_write;
import command.member.DBjoin;
import command.member.DBlogin;
import command.member.DBmember_update;
import command.member.Logout;
import command.member.Mypage;
import command.product.DBmanage_create;
import command.product.DBmanage_update;
import command.product.Manage_create;
import command.product.Manage_detail;
import command.product.Manage_list;
import command.purchase.Detail;
import command.purchase.Shop;
import command.qna.DBqna_write;
import command.qna.Qna_detail;
import command.qna.Qna_list;
import command.qna.DBqna_delete;
import command.qna.DBqna_update;
import command.qna.Qna_write;
import common.CommonExecute;
import common.CommonTemplate;
import dto.ModelDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired JdbcTemplate template;
	
	@Autowired
	public void setTemplate() {
		CommonTemplate.setTemplate(template);
	}
	
	@RequestMapping("/")
	public String PJT(HttpServletRequest request, Model model,
					@ModelAttribute ModelDto mdto,
					@RequestParam(value="t_gubun",defaultValue="index") String gubun ) {
		String page = "alert";
		HttpSession session = request.getSession();
		
		//인덱스
		if(gubun.equals("index")) {
			page = "index";
		}
		//Product
		else if(gubun.equals("basket")) {

			page = "product/basket";
		}else if(gubun.equals("detail")) {
			CommonExecute ce = new Detail();
			ce.execute(model, mdto, session);
			page = "product/detail";
		}else if(gubun.equals("manage_create")) {
			CommonExecute ce = new Manage_create();
			ce.execute(model, mdto, session);
			page = "product/manage_create";
		}else if(gubun.equals("DBmanage_create")) {
			DBmanage_create ce = new DBmanage_create();
			ce.execute(model, request);
		}else if(gubun.equals("manage_detail")) {
			CommonExecute ce = new Manage_detail();
			ce.execute(model, mdto, session);
			page = "product/manage_detail";
		}else if(gubun.equals("manage_list")) {
			CommonExecute ce = new Manage_list();
			ce.execute(model, mdto, session);
			page = "product/manage_list";
		}else if(gubun.equals("manage_statistics")) {

			page = "product/manage_statistics";
		}else if(gubun.equals("manage_update")) {
			CommonExecute ce = new Manage_detail();
			ce.execute(model, mdto, session);
			page = "product/manage_update";
		}else if(gubun.equals("DBmanage_update")) {
			DBmanage_update ce = new DBmanage_update();
			ce.execute(model, request);
		}else if(gubun.equals("purchase_complete")) {

			page = "product/purchase_complete";
		}else if(gubun.equals("purchase")) {

			page = "product/purchase";
		}else if(gubun.equals("shop")) {
			CommonExecute ce = new Shop();
			ce.execute(model, mdto, session);
			page = "product/shop";
		}
		//Member
		else if(gubun.equals("join")) {
			page = "member/join";
		}else if(gubun.equals("DBjoin")) {
			CommonExecute ce = new DBjoin();
			ce.execute(model, mdto, session);
		}else if(gubun.equals("login")) {
			page = "member/login";
		}else if(gubun.equals("DBlogin")) {
			CommonExecute ce = new DBlogin();
			ce.execute(model, mdto, session);
		}else if(gubun.equals("logout")) {
			CommonExecute ce = new Logout();
			ce.execute(model, mdto, session);
		}else if(gubun.equals("mypage")) {
			CommonExecute ce = new Mypage();
			ce.execute(model, mdto, session);
			page = "member/mypage";
		}else if(gubun.equals("member_update")) {
			CommonExecute ce = new Mypage();
			ce.execute(model, mdto, session);
			page = "member/member_update";
		}else if(gubun.equals("DBmember_update")) {
			CommonExecute ce = new DBmember_update();
			ce.execute(model, mdto, session);
		}else if(gubun.equals("purchase_detail")) {

			page = "member/purchase_detail";
		}else if(gubun.equals("purchase_list")) {

			page = "member/purchase_list";
		}else if(gubun.equals("refund")) {

			page = "member/refund";
		}
		//board
		else if(gubun.equals("faq_detail")) {
			CommonExecute ce = new Faq_detail();
			ce.execute(model, mdto, session);
			page = "board/faq_detail";
		}else if(gubun.equals("faq_list")) {
			CommonExecute ce = new Faq_list();
			ce.execute(model, mdto, session);
			page = "board/faq_list";
		}else if(gubun.equals("faq_update")) {
			CommonExecute ce = new Faq_detail();
			ce.execute(model, mdto, session);	
			page = "board/faq_update";
		}else if(gubun.equals("faq_delete")) {
			CommonExecute ce = new DBfaq_delete();
			ce.execute(model, mdto, session);
		}else if(gubun.equals("faq_write")) {
			CommonExecute ce = new Faq_write();
			ce.execute(model, mdto, session);
			page = "board/faq_write";
		}else if(gubun.equals("DBfaq_write")) {
			CommonExecute ce = new DBfaq_write();
			ce.execute(model, mdto, session);
		}else if(gubun.equals("free_board")) {

			page = "board/free_board";
		}else if(gubun.equals("qna_detail")) {
			CommonExecute ce = new Qna_detail();
			ce.execute(model, mdto, session);
			page = "board/qna_detail";
		}else if(gubun.equals("qna_list")) {
			CommonExecute ce = new Qna_list();
			ce.execute(model, mdto, session);
			page = "board/qna_list";
		}else if(gubun.equals("qna_update")) {
			CommonExecute ce = new Qna_detail();
			ce.execute(model, mdto, session);
			page = "board/qna_update";
		}else if(gubun.equals("DBqna_update")) {
			CommonExecute ce = new DBqna_update();
			ce.execute(model, mdto, session);
		}else if(gubun.equals("qna_write")) {
			CommonExecute ce = new Qna_write();
			ce.execute(model, mdto, session);
			page = "board/qna_write";
		}else if(gubun.equals("DBqna_write")) {
			CommonExecute ce = new DBqna_write();
			ce.execute(model, mdto, session);
		}else if(gubun.equals("qna_delete")) {
			CommonExecute ce = new DBqna_delete();
			ce.execute(model, mdto, session);
		}else {
			System.out.println("no t_gubun");
		}
		
		return page;
	}
}
