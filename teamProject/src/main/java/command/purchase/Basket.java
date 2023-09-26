package command.purchase;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.PurchaseDao;
import dto.BasketDto;
import dto.ModelDto;

public class Basket implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		PurchaseDao dao = new PurchaseDao();
		String id = (String)session.getAttribute("sId");
		ArrayList<BasketDto> arr = dao.basket(id);
		model.addAttribute("t_arr",arr);
		int sum = 0;
		for(int k=0; k<arr.size(); k++) {
			sum+=Integer.parseInt(arr.get(k).getPrice())*Integer.parseInt(arr.get(k).getCount());
		}
		sum+=2500;
		DecimalFormat df = new DecimalFormat("￦###,###");
		model.addAttribute("t_total",df.format(sum));
		model.addAttribute("t_count",arr.size());
	}

}
