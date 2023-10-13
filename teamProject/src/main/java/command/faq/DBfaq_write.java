package command.faq;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.FaqDao;
import dto.ModelDto;

public class DBfaq_write implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		FaqDao dao = new FaqDao();
		int k = dao.FaqSave(mdto,session);
		String msg = "FAQ 저장에 성공했습니다";
		String url = "faq_list";
		if(k != 1) {
			msg = "FAQ 저장에 실패했습니다";
			url = "faq_write";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
	}

}
