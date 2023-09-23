package command.product;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.ProductDao;
import dto.ModelDto;
import dto.ProductDto;

public class Manage_list implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		ProductDao dao = new ProductDao();
		model.addAttribute("arr",dao.listDB());
		
	}

}
