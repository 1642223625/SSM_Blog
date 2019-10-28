package com.ssm.csf.util;

import java.util.List;

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
}
