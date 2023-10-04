package command.faq;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.FaqDao;
import dao.QnaDao;
import dto.ModelDto;

public class Faq_detail implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		FaqDao dao = new FaqDao();
		model.addAttribute("t_dto",dao.detail(mdto));

	}

}
