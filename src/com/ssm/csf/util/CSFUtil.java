package com.ssm.csf.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssm.csf.service.CsfService;
import com.ssm.pojo.Article;
import com.ssm.pojo.Menu;
import com.ssm.pojo.PageInfo;
import com.ssm.pojo.PicStatus;

public class CSFUtil {
	private static List<String> list;
	private static PicStatus picStatus = new PicStatus();
	private static ObjectMapper objectMapper = new ObjectMapper();
	private static Logger logger = Logger.getLogger(CSFUtil.class);
	private static DateFormat dateDF = new SimpleDateFormat("yyyy年MM月");
	private static DateFormat detailDateDF = new SimpleDateFormat("yyyy-MM-dd HH:mm");

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
		return copyFile(new File(src), new File(dest));
	}

	public static boolean copyFile(File srcFile, File destFile) {
		byte[] buffer = new byte[1024];
		int len = 0;
		try (InputStream is = new BufferedInputStream(new FileInputStream(srcFile));
				OutputStream os = new BufferedOutputStream(new FileOutputStream(destFile))) {
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

	public static boolean copyDictionary(File src, File dest) {
		if (src.isFile() || dest.isFile()) {
			logger.error("源路径和目标路径必须是目录！！！");
			return false;
		}
		if (dest.getAbsolutePath().startsWith(src.getAbsolutePath())) {
			logger.error("不允许往子目录中拷贝父目录！！！");
			return false;
		}
		File[] srcFiles = src.listFiles();
		if (srcFiles != null) {
			for (File file : srcFiles) {
				if (file.isDirectory()) {
					copyDictionary(file, new File(dest, file.getName()));
				} else {
					if (!dest.exists()) {
						dest.mkdirs();
					}
					CSFUtil.copyFile(file, new File(dest, file.getName()));
				}
			}
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
	}

	public static String trimPLabel(String content) {// 去除首尾多余的<p></p>和<p><br></p>
		String pLabel1 = "<p></p>";
		String pLabel2 = "<p><br></p>";
		int start = 0, end = 0;
		while (content.startsWith(pLabel1) || content.startsWith(pLabel2) || content.endsWith(pLabel1)
				|| content.endsWith(pLabel2)) {
			if (content.startsWith(pLabel1)) {
				start += pLabel1.length();
			} else if (content.startsWith(pLabel2)) {
				start += pLabel2.length();
			}
			if (content.endsWith(pLabel2)) {
				end += pLabel2.length();
			} else if (content.endsWith(pLabel1)) {
				end += pLabel1.length();
			}
			content = content.substring(start, content.length() - end);
			start = end = 0;
		}
		return content;
	}

	public static Article getArticle(HttpServletRequest request) {// 保证对每一个客户端只有一个article对象
		Article article = (Article) request.getSession().getAttribute("article");
		if (article == null) {
			request.getSession().setAttribute("article", new Article());
		}
		return (Article) request.getSession().getAttribute("article");
	}

	public static String getReturnJson(String url) {
		return getReturnJson(url, 0);
	}

	public static String getReturnJson(String url, int errno) {// errno为0表示成功，非0则失败
		list = new ArrayList<String>();
		list.add(url);
		picStatus.setErrno(0);
		picStatus.setData(list);
		try {
			return objectMapper.writeValueAsString(picStatus);
		} catch (JsonProcessingException e) {
			logger.error(e.getMessage());
		}
		return null;
	}

	public static void deleteDictionary(File beDeleteFile) {
		if (beDeleteFile.isFile()) {
			beDeleteFile.delete();
		} else {
			File[] files = beDeleteFile.listFiles();
			if (files == null) {
				beDeleteFile.delete();
			} else {
				for (File file : files) {
					deleteDictionary(file);
				}
			}
			beDeleteFile.delete();
		}
	}
}
