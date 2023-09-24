package command.product;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.ProductDao;
import dto.ModelDto;

public class Manage_list implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		ProductDao dao = new ProductDao();
		model.addAttribute("arr",dao.listDB(mdto));
		model.addAttribute("select",mdto.getT_select());
		String search = mdto.getT_search();
		if(search==null) search="";
		model.addAttribute("search",search);
	}

}
