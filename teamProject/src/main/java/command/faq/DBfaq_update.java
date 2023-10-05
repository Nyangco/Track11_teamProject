package command.faq;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.FaqDao;
import dao.QnaDao;
import dto.ModelDto;

public class DBfaq_update implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		FaqDao dao = new FaqDao();
		int k = dao.faq_update(mdto);
		String msg = "FAQ 수정에 실패하였습니다";
		String url = "faq_list";
		if(k==1) {
			msg = "FAQ 수정에 성공하였습니다";
			url = "faq_list";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
	}

}
