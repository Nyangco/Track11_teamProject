package command.member;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.PurchaseDao;
import dto.DetailDto;
import dto.ModelDto;

public class Purchase_list implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		PurchaseDao dao = new PurchaseDao();
		ArrayList<DetailDto> arr = dao.purchase_list((String)session.getAttribute("sId"));
		model.addAttribute("t_arr",arr);
	}

}
