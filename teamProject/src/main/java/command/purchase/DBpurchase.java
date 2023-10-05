package command.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import dao.PurchaseDao;
import dto.ModelDto;

public class DBpurchase {

	public void execute(Model model, ModelDto mdto, HttpSession session, HttpServletRequest request) {
		
		PurchaseDao dao = new PurchaseDao();
		String product_no = mdto.getT_product_no();
		
		int t_count = Integer.parseInt(request.getParameter("t_count"));
		String[] pn = new String[t_count];
		String[] cnt = new String[t_count];
		for(int k=0; k<t_count; k++) {
			pn[k]=request.getParameter("t_product_no_"+(k+1));
			cnt[k]=request.getParameter("t_count_"+(k+1));
		}
		String purchase_no = dao.purchaseSave(mdto,pn,cnt,request.getParameter("t_bd"));
		String msg = "주문에 실패했습니다. 다시 구매해주세요.";
		String url = "detail";
		
		if(purchase_no!=null) {
			String pm = mdto.getT_pay_method();
			msg = "주문에 성공했습니다.\\n주문번호:"+purchase_no;
			if(pm.equals("cash")) {
				msg+="\\n입금 계좌:012345-67-890123";
			}
			url = "purchase_complete";
			model.addAttribute("t_purchase_no",purchase_no);
			model.addAttribute("t_pay_method",pm);
			model.addAttribute("t_total",mdto.getT_total());
		}else {
			model.addAttribute("t_product_no",product_no);
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
	}

}
