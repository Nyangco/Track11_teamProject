package command.purchase;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dto.ModelDto;

public class Purchase_complete implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		model.addAttribute("t_purchase_no",mdto.getT_purchase_no());
		model.addAttribute("t_pay_method",mdto.getT_pay_method());
		model.addAttribute("t_total",mdto.getT_total());
	}

}
