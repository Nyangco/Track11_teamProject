package command.faq;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.FaqDao;
import dao.QnaDao;
import dto.FaqDto;
import dto.ModelDto;
import dto.QnaDto;

public class Faq_list implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		FaqDao dao = new FaqDao();
		
		model.addAttribute("select",mdto.getT_select());
		model.addAttribute("search",mdto.getT_search());
		String select = mdto.getT_select();
		String search = mdto.getT_search();
		if(select==null || search == null) {
			select= "f.question";
			search= "";
		}
		ArrayList<FaqDto> dtos = dao.getFaqList(select,search);
		model.addAttribute("t_dtos",dtos);
		
		
		
	}

}
