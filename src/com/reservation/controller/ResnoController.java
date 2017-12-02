package com.reservation.controller;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.reservation.model.ReservationService;
import com.reservation.model.ReservationVO;


@Controller
@Validated
@RequestMapping("/reservation")
public class ResnoController {

	/*
	 * This method will be called on select_page.jsp form submission, handling POST
	 * request It also validates the user input
	 */
	@RequestMapping(method = RequestMethod.POST, value = "getOne_For_Display")
	public String getOne_For_Display(
		/***************************1.接收請求參數 - 輸入格式的錯誤處理*************************/
		@NotEmpty(message="預約編號: 請勿空白")
		@RequestParam("res_no") String res_no,
		ModelMap model) {
		
		/***************************2.開始查詢資料*********************************************/
		ReservationService reservationSvc = new ReservationService();
		ReservationVO reservationVO = reservationSvc.getOneReservation(new String(res_no));
		if (reservationVO == null) {
			model.addAttribute("message", "查無資料");
			return "select_page";
		}
		
		/***************************3.查詢完成,準備轉交(Send the Success view)*****************/
		model.addAttribute("reservationVO", reservationVO);
		return "reservation/listOneReservation"; // 查詢完成後轉交listOneReservation.jsp
	}

	
	@ExceptionHandler(value = { ConstraintViolationException.class })
	@ResponseStatus(value = HttpStatus.BAD_REQUEST)
	public ModelAndView handleError(HttpServletRequest req,ConstraintViolationException e) {
	    Set<ConstraintViolation<?>> violations = e.getConstraintViolations();
	    StringBuilder strBuilder = new StringBuilder();
	    for (ConstraintViolation<?> violation : violations ) {
	          strBuilder.append(violation.getMessage() + "<br>");
	    }
	    String message = strBuilder.toString();
	    return new ModelAndView("select_page", "message", "請修正以下錯誤:<br>"+message);
	}

	
}