<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<header class="header">
		<div class="title">
			<h1>开天辟地技术博客</h1>
		</div>
	</header>
	<nav class="nav">
		<div class="container">
			<nav class="navbar navbar-expand-md bg-white navbar-mystyle">
				<a class="navbar-brand" style="padding:10px" href="main">
					<img alt="Logo" width="70px" src="images/logo.png">
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse justify-content-between navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="main">首页</a></li>
						<li class="nav-item mydropdown"><a class="nav-link">生活笔记</a>
							<div class="mydropdown-content">
								<a class="nav-link" href="main">个人随笔</a>
								<a class="nav-link" href="main">个人日记</a>
								<a class="nav-link" href="main">个人展示</a>
							</div>
						</li>
						<li class="nav-item mydropdown"><a class="nav-link">技术杂谈</a>
							<div class="mydropdown-content">
								<a class="nav-link" href="main?type=C/CPP">C/CPP</a>
								<a class="nav-link" href="main?type=Java">Java</a>
								<a class="nav-link" href="main?type=PHP">PHP</a>
								<a class="nav-link" href="main?type=HTML">HTML</a>
								<a class="nav-link" href="main?type=Python">Python</a>
								<a class="nav-link" href="main?type=Linux">Linux</a>
								<a class="nav-link" href="main?type=Other">Other</a>
							</div></li>
						<li class="nav-item"><a class="nav-link" href="aboutMe">关于博主</a></li>
						<li class="nav-item"><a class="nav-link" target="_blank" href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=WDU5Nj83Bys_BzswPTYYKSl2Ozc1" style="text-decoration:none;">给我写信</a></li>
						
						
					</ul>
					<ul class="navbar-nav">
                        <li class="nav-item">
                        	<a class="nav-link mybtn-a mybtn mr-3" href="csf/addNewArticle">编写博文</a>
                        </li>
                        <li class="nav-item">
                            <form class="form-inline" action="666" method="POST">
                                <input type="text" class="nav-link form-control h-100" style="border-radius:5px 0 0 5px" placeholder="search" name="keywords">
                                <input type="submit" class="btn mybtn nav-link form-control h-100 border-0" style="border-radius:0 5px 5px 0" value="搜索">
                            </form>
                        </li>
                    </ul>
				</div>
			</nav>
		</div>
	</nav>
</body>
</html>