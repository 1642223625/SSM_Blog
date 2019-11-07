package com.ssm.csf.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.ssm.csf.service.CsfService;
import com.ssm.pojo.Menu;
import com.ssm.pojo.PageInfo;

public class CSFUtil {
	private static Logger logger = Logger.getLogger(CSFUtil.class);
	private static DateFormat dateDF = new SimpleDateFormat("yyyy年MM月");
	private static DateFormat detailDateDF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	public static String getDate(Date date) {
		return dateDF.format(date);
	}

	public static String getDetailDate(Date date) {
		return detailDateDF.format(date);
	}

	public static String getNavPath(List<Menu> menus, int menu_id) {// 根据层级菜单和类型号返回对应的层级路径
		for (Menu menu : menus) {
			for (Menu subMenu : menu.getSubMenus()) {
				if (subMenu.getId() == menu_id) {
					return menu.getName() + " > " + subMenu.getName();
				}
			}
		}
		return "";
	}

	public static boolean copyFile(String src, String dest) {// 文件拷贝，用于将暂存区的文件拷贝到存储区
		byte[] buffer = new byte[1024];
		int len = 0;
		try (InputStream is = new BufferedInputStream(new FileInputStream(src));
				OutputStream os = new BufferedOutputStream(new FileOutputStream(dest))) {
			while ((len = is.read(buffer)) != -1) {
				os.write(buffer, 0, len);
			}
			os.flush();
		} catch (Exception e) {
			logger.error(e.getMessage());
			return false;
		}
		return true;
	}

	public static void setAside(HttpServletRequest request, CsfService csfService, PageInfo pageInfo) {
		request.setAttribute("articleDates", csfService.selectAllArticleDate(pageInfo));// 设置侧边栏的日期筛选标签
		request.setAttribute("tags", csfService.selectAllTags(pageInfo));// 设置侧边栏的类型筛选标签
		request.setAttribute("comment", csfService.selectCommentArticles());// 设置侧边栏的猜你喜欢
		if (request.getServletContext().getAttribute("links") == null) {
			request.getServletContext().setAttribute("links", csfService.selectAllLinks());// 设置侧边栏的友情链接
		}
		if (request.getServletContext().getAttribute("menus") == null) {
			request.getServletContext().setAttribute("menus", csfService.selectAllMenu());// 初始化层级菜单
		}
	}

	public static void setContent(HttpServletRequest request, CsfService csfService, PageInfo pageInfo) {
		String pageNumberStr = request.getParameter("pageNumber");
		pageInfo.setType(request.getParameter("type"));// 如果请求参数中存在类型信息，则修改pageInfo中的类型值
		pageInfo.setDate(request.getParameter("date"));// 如果请求参数中存在类型信息，则修改pageInfo中的类型值
		if (pageNumberStr != null) {
			// 如果请求参数中存在页码信息，则修改pageInfo中的页码值
			pageInfo.setPageNumber(Integer.parseInt(pageNumberStr));
		}
		pageInfo = csfService.selectArticles(pageInfo);// 根据已知条件进行查询所有符合条件的博文
		request.setAttribute("pageInfo", pageInfo);
		Integer[] pageCount = new Integer[pageInfo.getTotalPage()];// 该空数组只用于页码个数的迭代显示
		request.setAttribute("pageCount", pageCount);
	}
}
