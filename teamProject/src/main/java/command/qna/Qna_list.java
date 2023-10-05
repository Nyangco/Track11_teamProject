package command.qna;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.QnaDao;
import dto.ModelDto;
import dto.QnaDto;

public class Qna_list implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		QnaDao dao = new QnaDao();
		
		model.addAttribute("select",mdto.getT_select());
		model.addAttribute("search",mdto.getT_search());
		String select = mdto.getT_select();
		String search = mdto.getT_search();
		if(select==null || search == null) {
			select= "q.title";
			search= "";
		}
		ArrayList<QnaDto> dtos = dao.getQnaList(select,search);
		model.addAttribute("t_dtos",dtos);
		
		
		
	}

}
