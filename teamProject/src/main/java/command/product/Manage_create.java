package command.product;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.ProductDao;
import dto.ModelDto;

public class Manage_create implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		ProductDao dao = new ProductDao();
		model.addAttribute("product_no",dao.getProduct_no());
		model.addAttribute("t_shop",dao.shop_list());
	}

}
