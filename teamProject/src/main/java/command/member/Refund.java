package command.member;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dto.ModelDto;

public class Refund implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		model.addAttribute("t_purchase_no",mdto.getT_purchase_no());
	}

}
