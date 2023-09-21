package common;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import dto.ModelDto;

public interface CommonExecute {

	public void execute(Model model, ModelDto mdto, HttpSession session);
}
