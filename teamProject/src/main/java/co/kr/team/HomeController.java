package co.kr.team;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import command.member.DBchangePW;
import command.member.DBconfirmEmail;
import command.member.DBfindID;
import command.member.DBfindPW;
import command.member.DBjoin;
import command.member.DBlogin;
import command.member.DBmember_update;
import command.member.DBrefund;
import command.member.Logout;
import command.member.Manage_member_list;
import command.member.Manage_member_delete;
import command.member.Manage_member_view;
import command.member.Mypage;
import command.member.Purchase_detail;
import command.member.Purchase_list;
import command.member.Refund;
import command.product.DBmanage_create;
import command.product.DBmanage_update;
import command.product.Manage_create;
import command.product.Manage_detail;
import command.product.Manage_list;
import command.product.Sold_detail;
import command.product.Sold_list;
import command.product.Statistics_list;
import command.purchase.Basket;
import command.purchase.DBbasket;
import command.purchase.DBpurchase;
import command.purchase.Detail;
import command.purchase.Purchase;
import command.purchase.Purchase_complete;
import command.purchase.Shop;
import command.qna.DBqna_delete;
import command.qna.DBqna_reply;
import command.qna.DBqna_update;
import command.qna.DBqna_write;
import command.qna.Qna_detail;
import command.qna.Qna_list;
import command.qna.Qna_reply;
import command.qna.Qna_write;
import common.CommonExecute;
import common.CommonTemplate;
import common.CommonUtil;
import dao.MemberDao;
import dao.ProductDao;
import dao.PurchaseDao;
import dto.ModelDto;
import dto.StatisticsDto;

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
			}else if(gubun.equals("findID")) {
				page = "member/findID";
			}else if(gubun.equals("DBfindID")) {
				CommonExecute ce = new DBfindID();
				ce.execute(model, mdto, session);
			}else if(gubun.equals("findPW")) {
				page = "member/findPW";
			}else if(gubun.equals("DBfindPW")) {
				CommonExecute ce = new DBfindPW();
				ce.execute(model, mdto, session);
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
			}else if(gubun.equals("qna_reply")) {
				CommonExecute ce = new Qna_reply();
				ce.execute(model, mdto, session);
				page = "board/qna_reply";
			}else if(gubun.equals("DBqna_reply")) {
				CommonExecute ce = new DBqna_reply();
				ce.execute(model, mdto, session);
			}else if(gubun.equals("qna_delete")) {
				CommonExecute ce = new DBqna_delete();
				ce.execute(model, mdto, session);
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
			}else if(gubun.equals("changePW")) {
				page = "member/member_changePW";
			}else if(gubun.equals("DBchangePW")) {
				CommonExecute ce = new DBchangePW();
				ce.execute(model, mdto, session);
			}else if(gubun.equals("confirmEmail")) {
				page = "member/member_confirmEmail";
			}else if(gubun.equals("DBconfirmEmail")) {
				CommonExecute ce = new DBconfirmEmail();
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
				CommonExecute ce = new Refund();
				ce.execute(model, mdto, session);
				page = "member/refund";
			}else if(gubun.equals("DBrefund")) {
				CommonExecute ce = new DBrefund();
				ce.execute(model, mdto, session);
			}
			
		//관리자 접근 가능
		}if(sl>=2) {
			
			//Member
			if(gubun.equals("manage_member_list")) {
				CommonExecute ce = new Manage_member_list();
				ce.execute(model, mdto, session);
				page = "member/manage_member_list";
			}else if(gubun.equals("manage_member_view")) {
				CommonExecute ce = new Manage_member_view();
				ce.execute(model, mdto, session);
				page = "member/manage_member_view";
			}else if(gubun.equals("manage_member_delete")) {
				CommonExecute ce = new Manage_member_delete();
				ce.execute(model, mdto, session);
			}
			
			//Product & Purchase
			else if(gubun.equals("manage_create")) {
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
			}else if(gubun.equals("sold_list")) {
				CommonExecute ce = new Sold_list();
				ce.execute(model, mdto, session);
				page = "product/sold_list";
			}else if(gubun.equals("sold_detail")) {
				CommonExecute ce = new Sold_detail();
				ce.execute(model, mdto, session);
				page = "product/sold_detail";
			}
			
			//board
			else if(gubun.equals("faq_update")) {
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
	
	@RequestMapping("Statics_month")
	public void Statistics(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("utf-8");
			PrintWriter out = response.getWriter();
			ProductDao dao = new ProductDao();
			
			String month = request.getParameter("t_month");
			
			ArrayList<String> arr_1 = dao.getTC_TS(month);
			ArrayList<StatisticsDto> arr_2 = dao.getPC(month);
			ArrayList<StatisticsDto> arr_3 = dao.getCC(month);
			String t_count = arr_1.get(0);
			String t_sell = arr_1.get(1);
			if(t_sell==null) t_sell="0";
			
			HashMap<String, Object> hM = new HashMap<String, Object>();
			JSONObject jsob1 = new JSONObject();
			JSONObject jsob2 = new JSONObject();
			JSONArray jsar1 = new JSONArray();
			JSONArray jsar2 = new JSONArray();
			JSONObject finaljsob = new JSONObject();
			
			for(int k=0; k<arr_2.size(); k++) {
				hM = new HashMap<String, Object>();
				hM.put("label",arr_2.get(k).getProduct_no());
				hM.put("value",arr_2.get(k).getCount());
				jsob1 = new JSONObject(hM);
				jsar1.add(jsob1);
			}for(int k=arr_2.size();k<5;k++) {
				hM = new HashMap<String, Object>();
				hM.put("label","");
				hM.put("value","");
				jsob1 = new JSONObject(hM);
				jsar1.add(jsob1);
			}
			
			
			for(int k=0; k<arr_3.size(); k++) {
				hM = new HashMap<String, Object>();
				hM.put("label",arr_3.get(k).getId());
				hM.put("value",arr_3.get(k).getPrice());
				jsob2 = new JSONObject(hM);
				jsar2.add(jsob2);
			}for(int k=arr_3.size();k<5;k++) {
				hM = new HashMap<String, Object>();
				hM.put("label","");
				hM.put("value","");
				jsob2 = new JSONObject(hM);
				jsar2.add(jsob2);
			}
			
			finaljsob.put("t_t_count_m", t_count);
			finaljsob.put("t_t_sell_m", t_sell);
			finaljsob.put("t_p_count_m",jsar1);
			finaljsob.put("t_c_cell_m",jsar2);
			
			out.print(finaljsob);
		}catch(UnsupportedEncodingException e) {
			System.out.println("인코딩 오류");
			e.printStackTrace();
		}catch(IOException e) {
			System.out.println("입출력 오류");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("Change_status")
	public void Change_status(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("utf-8");
			PrintWriter out = response.getWriter();
			PurchaseDao dao = new PurchaseDao();
			
			String pn = request.getParameter("t_purchase_no");
			pn = pn.substring(0, 6)+"_"+pn.substring(6);
			
			int k = dao.changeStatus(pn,request.getParameter("t_status"));
			out.print(k);
		}catch(UnsupportedEncodingException e) {
			System.out.println("인코딩 오류");
			e.printStackTrace();
		}catch(IOException e) {
			System.out.println("입출력 오류");
			e.printStackTrace();
		}
	}
	
	//중복 닉네임 서버에서 확인
	@RequestMapping("MemberCheckNick")
	public void memberCheckNick(HttpServletRequest request, HttpServletResponse response)
	{
		MemberDao dao = new MemberDao();
		String nickname = request.getParameter("t_nickname");
		int count = dao.memberCheckNick(nickname);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		out.print(count);
	}
	//중복 이메일 서버에서 확인
	@RequestMapping("MemberCheckEmail")
	public void memberCheckEmail(HttpServletRequest request, HttpServletResponse response)
	{
		MemberDao dao = new MemberDao();
		String email = request.getParameter("t_email");
		int count = dao.memberCheckEmail(email);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		out.print(count);
	}
	
	//중복 아이디 서버에서 확인
	@RequestMapping("MemberCheckId")
	public void memberCheckId(HttpServletRequest request, HttpServletResponse response)
	{
		MemberDao dao = new MemberDao();
		String id = request.getParameter("t_id");
		int count = dao.memberCheckId(id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(count);
		
	}
	
	//장바구니 담기 - 아이디 품목번호 조합이 없으면 새로 만들고 있으면 count를 더함
	@RequestMapping("GoBucket")
	public void goBucket(HttpServletRequest request, HttpServletResponse response)
	{
		
		PurchaseDao dao = new PurchaseDao();
		String id = request.getParameter("t_id");
		String count = request.getParameter("t_count");
		String product_no = request.getParameter("t_product_no");
		int check = dao.basketCheck(id, product_no);
		int result = 0;
		if(check == 1)
		{
			result = dao.updateBasket(id, product_no, count);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.print(result);
		}
		else
		{
			result = dao.addBasket(id, product_no, count);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			out.print(result);
		}
	}
	
	@RequestMapping("BasketDelete")
	public void basketdelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			PurchaseDao dao = new PurchaseDao();
			
			String id = request.getParameter("t_id");
			String product_no = request.getParameter("t_product_no");
			
			out.print(dao.deleteBasket(id,product_no));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("changeBasket")
	public void changeBasket(HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			PurchaseDao dao = new PurchaseDao();
			
			String id = request.getParameter("t_id");
			String product_no = request.getParameter("t_product_no");
			String count = request.getParameter("t_count");
			
			out.print(dao.changeBasket(id,product_no,count));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
}
