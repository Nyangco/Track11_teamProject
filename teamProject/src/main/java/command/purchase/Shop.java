package command.purchase;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.ProductDao;
import dao.PurchaseDao;
import dto.ModelDto;
import dto.ProductDto;

public class Shop implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		String select = mdto.getT_select();
		String search = mdto.getT_search();
		String shop = mdto.getT_shop();
		if(select==null) {
			select = "product_no";
			search = "";
		}
		PurchaseDao dao = new PurchaseDao();
		ArrayList<ProductDto> arr = dao.shop_list(select,search,shop);
		model.addAttribute("arr",arr);
		model.addAttribute("t_select",select);
		model.addAttribute("t_search",search);
		model.addAttribute("t_shop",dao.shop_name(shop));
	}

}
