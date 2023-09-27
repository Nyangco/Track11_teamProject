package command.member;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.PurchaseDao;
import dto.DetailDto;
import dto.ModelDto;

public class Purchase_detail implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		PurchaseDao dao = new PurchaseDao();
		ArrayList<DetailDto> arr = dao.purchase_detail(mdto.getT_purchase_no());
		model.addAttribute("t_arr",arr);
		DecimalFormat df = new DecimalFormat("￦###,###");
		int total = 2500;
		for(int k=0; k<arr.size(); k++) {
			int tot = Integer.parseInt(arr.get(k).getProduct_total());
			total += tot;
			arr.get(k).setProduct_total(df.format(tot));
		}
		model.addAttribute("t_total",df.format(total));
		//model.addAttribute("t_dto",dao.purchase_detail(mdto));
	}

}
