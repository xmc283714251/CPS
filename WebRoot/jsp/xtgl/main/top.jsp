<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<creator:view>
	<script type="text/javascript" src="<c:url value='/jsp/common/js/top.js'/>"></script>
	<div class="header">
		<div class="logo-xtgl">
			<span style="font-size:12px; color:#FFFFFF; float:right; padding:5px 10px 0 0;">
				欢迎您，${loginInfo.orgname } ${loginInfo.realname}[${loginInfo.username }]，今天是<label id="Clock"></label>
			</span>
		</div>
	</div>
	<div class="header_menu">
		<a href="javascript:closeWindow();" style="float:right; line-height:30px; color:#FFFFFF;">退出系统</a>
		<a href="<c:url value='/xtgl/xzqh/toXzqhPage.action'/>" class="menu_a" target="mainFrame">行政区划</a>
		<a href="xtcsIndex.jsp" class="menu_b" target="mainFrame" >系统参数</a>
	</div>
</creator:view>
