package command.purchase;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import dao.PurchaseDao;

public class DBbasket {

	public void execute(HttpServletRequest request, Model model) {
		PurchaseDao dao = new PurchaseDao();
		int total_count = Integer.parseInt(request.getParameter("t_total_count"));
		String id = request.getParameter("t_id");
		String[] cnt = new String[total_count];
		String[] pn = new String[total_count];
		for(int k=0; k<total_count; k++) {
			pn[k] = request.getParameter("t_product_no_"+k);
			cnt[k] = request.getParameter("t_count_"+k);
		}
		int k = dao.updateBasket(id,cnt,pn);
		String msg = "장바구니의 제품들을 구매합니다";
		String url = "purchase";
		if(k==1) {
			msg = "구매 시도가 실패했습니다";
			url = "basket";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
	}
}
