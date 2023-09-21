package co.kr.team;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.ModelDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String PJT(HttpServletRequest request, Model model,
					@ModelAttribute ModelDto mdto,
					@RequestParam(value="t_gubun",defaultValue="index") String gubun ) {
		String page = "alert";
		
		//인덱스
		if(gubun.equals("index")) {
			page = "index";
		}
		//Product
		else if(gubun.equals("basket")) {

			page = "product/basket";
		}else if(gubun.equals("detail")) {

			page = "product/detail";
		}else if(gubun.equals("manage_create")) {

			page = "product/manage_create";
		}else if(gubun.equals("manage_detail")) {

			page = "product/manage_detail";
		}else if(gubun.equals("manage_list")) {

			page = "product/manage_list";
		}else if(gubun.equals("manage_statistics")) {

			page = "product/manage_statistics";
		}else if(gubun.equals("manage_update")) {

			page = "product/manage_update";
		}else if(gubun.equals("purchase_complete")) {

			page = "product/purchase_complete";
		}else if(gubun.equals("purchase")) {

			page = "product/purchase";
		}else if(gubun.equals("shop")) {

			page = "product/shop";
		}
		//Member
		else if(gubun.equals("join")) {

			page = "member/join";
		}else if(gubun.equals("login")) {

			page = "product/login";
		}else if(gubun.equals("mypage")) {

			page = "product/mypage";
		}else if(gubun.equals("purchase_detail")) {

			page = "product/purchase_detail";
		}else if(gubun.equals("purchase_list")) {

			page = "product/purchase_list";
		}else if(gubun.equals("refund")) {

			page = "product/refund";
		}else if(gubun.equals("update")) {

			page = "product/update";
		}
		//board
		else if(gubun.equals("faq_detail")) {

			page = "board/faq_detail";
		}else if(gubun.equals("faq_list")) {

			page = "board/faq_list";
		}else if(gubun.equals("faq_update")) {

			page = "board/faq_update";
		}else if(gubun.equals("faq_write")) {

			page = "board/faq_write";
		}else if(gubun.equals("free_board")) {

			page = "board/free_board";
		}else if(gubun.equals("qna_detail")) {

			page = "board/qna_detail";
		}else if(gubun.equals("qna_list")) {

			page = "board/qna_list";
		}else if(gubun.equals("qna_update")) {

			page = "board/qna_update";
		}else if(gubun.equals("qna_write")) {

			page = "board/qna_write";
		}
		
		return page;
	}
	
}
