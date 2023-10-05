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

import command.member.DBjoin;
import command.member.DBlogin;
import command.member.DBmember_update;
import command.member.Logout;
import command.member.Mypage;
import command.member.Purchase_detail;
import command.member.Purchase_list;
import command.product.DBmanage_create;
import command.product.DBmanage_update;
import command.product.Manage_create;
import command.product.Manage_detail;
import command.product.Manage_list;
import command.product.Statistics_list;
import command.purchase.Basket;
import command.purchase.DBbasket;
import command.purchase.DBpurchase;
import command.purchase.Detail;
import command.purchase.Purchase;
import command.purchase.Purchase_complete;
import command.purchase.Shop;
import common.CommonExecute;
import common.CommonTemplate;
import common.CommonUtil;
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
		String sLevel = (String)session.getAttribute("sLevel");
		int sl = 0;
		if(sLevel!=null) sl = Integer.parseInt(sLevel);
		else sl=-1;
		
		//비회원 접근 가능
		if(sl>=-1) {

			//인덱스
			if(gubun.equals("index")) {
				page = "index";
			}
			
			//Product & Purchase
			else if(gubun.equals("detail")) {
				CommonExecute ce = new Detail();
				ce.execute(model, mdto, session);
				page = "product/detail";
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
			}
			
			//board
			else if(gubun.equals("faq_detail")) {

				page = "board/faq_detail";
			}else if(gubun.equals("faq_list")) {

				page = "board/faq_list";
			}else if(gubun.equals("free_board")) {

				page = "board/free_board";
			}else if(gubun.equals("qna_detail")) {

				page = "board/qna_detail";
			}else if(gubun.equals("qna_list")) {

				page = "board/qna_list";
			}
			
		//이메일 미인증 회원 접근 가능
		}if(sl>=0) {
			
			//Member
			if(gubun.equals("logout")) {
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
			}
			
		//일반 회원 접근 가능
		}if(sl>=1) {
			
			//Product & Purchase
			if(gubun.equals("basket")) {
				CommonExecute ce = new Basket();
				ce.execute(model, mdto, session);
				page = "product/basket";
			}else if(gubun.equals("DBbasket")) {
				DBbasket ce = new DBbasket();
				ce.execute(request, model);
			}else if(gubun.equals("purchase")) {
				CommonExecute ce = new Purchase();
				ce.execute(model, mdto, session);
				page = "product/purchase";
			}else if(gubun.equals("DBpurchase")) {
				DBpurchase ce = new DBpurchase();
				ce.execute(model, mdto, session, request);
			}else if(gubun.equals("purchase_complete")) {
				CommonExecute ce = new Purchase_complete();
				ce.execute(model, mdto, session);
				page = "product/purchase_complete";
			}
			
			//Member
			else if(gubun.equals("purchase_detail")) {
				CommonExecute ce = new Purchase_detail();
				ce.execute(model, mdto, session);
				page = "member/purchase_detail";
			}else if(gubun.equals("purchase_list")) {
				CommonExecute ce = new Purchase_list();
				ce.execute(model, mdto, session);
				page = "member/purchase_list";
			}else if(gubun.equals("refund")) {

				page = "member/refund";
			}
			
		//관리자 접근 가능
		}if(sl>=2) {
			
			//Product & Purchase
			if(gubun.equals("manage_create")) {
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
				CommonExecute ce = new Statistics_list();
				ce.execute(model, mdto, session);
				page = "product/manage_statistics";
			}else if(gubun.equals("manage_update")) {
				CommonExecute ce = new Manage_detail();
				ce.execute(model, mdto, session);
				page = "product/manage_update";
			}else if(gubun.equals("DBmanage_update")) {
				DBmanage_update ce = new DBmanage_update();
				ce.execute(model, request);
			}
			
			//board
			else if(gubun.equals("faq_update")) {

				page = "board/faq_update";
			}else if(gubun.equals("faq_write")) {

				page = "board/faq_write";
			}else if(gubun.equals("qna_update")) {

				page = "board/qna_update";
			}else if(gubun.equals("qna_write")) {

				page = "board/qna_write";
			}
		}		
		if(gubun.equals("root")) {
			String dir = CommonUtil.getFile_dir(session);
			System.out.print(dir);
			model.addAttribute("msg",dir);
			model.addAttribute("url","index");
		}
		return page;
	}
}
