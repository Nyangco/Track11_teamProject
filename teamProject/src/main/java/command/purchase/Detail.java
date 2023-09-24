package command.purchase;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.ProductDao;
import dao.PurchaseDao;
import dto.ModelDto;

public class Detail implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		PurchaseDao dao = new PurchaseDao();
		model.addAttribute("dto",dao.detail(mdto));
	}

}
