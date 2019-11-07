package com.ssm.csf.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ssm.csf.service.CsfService;
import com.ssm.pojo.Menu;

public class CSFUtil {
	public static String getNavPath(List<Menu> menus, int menu_id) {
		for (Menu menu : menus) {
			for (Menu subMenu : menu.getSubMenus()) {
				if (subMenu.getId() == menu_id) {
					return menu.getName() + " > " + subMenu.getName();
				}
			}
		}
		return "";
	}

	@SuppressWarnings("unchecked")
	public static void setMenu(HttpServletRequest request, CsfService csfService) {//往应用作用域设置菜单属性
		List<Menu> menus = (List<Menu>) request.getServletContext().getAttribute("menus");
		System.out.println(menus);
		if (menus == null) {
			//request.getServletContext().setAttribute("menus", csfService.selectAllMenu());
			request.getSession().setAttribute("menus", csfService.selectAllMenu());
		}
	}
}
