package command.product;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import common.CommonUtil;
import dao.ProductDao;
import dto.ModelDto;
import dto.ProductDto;

public class Manage_detail implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		ProductDao dao = new ProductDao();
		model.addAttribute("t_dto",dao.detail(mdto));
	}

}
