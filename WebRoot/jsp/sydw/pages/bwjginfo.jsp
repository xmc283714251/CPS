<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="保卫机构信息">
<creator:Script src="/jsp/sydw/js/sydwchild.js"></creator:Script>
<input type="hidden" id="jgbh" name="dwBean.dwjbxx.jgbh" value="${dwBean.dwjbxx.jgbh}">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td>
			<creator:tbar id="bwjg">
				<cps:button value="登记保卫机构" onclick="openBwjg('toBwjg','add','')"></cps:button>
			</creator:tbar>
			<cps:tableGrid list="${dwBean.bwjgList}" height="150" id="bwjgList" title="保卫机构"
				autoload="true" searchform="" pageSize="5" width="99.5%" 
				usepager="false" mutilSelect="false" isAsynch="false" tbarId="bwjg">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column title="操作" field="cz"></cps:column>
				<cps:column title="机构名称" field="jgmc"></cps:column>
				<cps:column title="隶属关系" field="lsgx"></cps:column>
				<cps:column title="保卫业务负责人身份证号" field="fzrsfzh"></cps:column>
				<cps:column title="保卫业务负责人" field="fzr"></cps:column>
				<cps:column title="联系电话" field="fzrlxfs"></cps:column>
			</cps:tableGrid>
		</td>
	</tr>
	<tr height="5">
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<creator:tbar id="bwzd">
				<cps:button value="登记保卫制度" onclick="openBwjg('toBwzd','add','')"></cps:button>
			</creator:tbar>
			<cps:tableGrid list="${dwBean.bwzdList}" height="150" id="bwzdList" title="保卫制度"
				autoload="true" searchform="" pageSize="5" width="99.5%"
				usepager="false" mutilSelect="false" isAsynch="false" tbarId="bwzd">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column title="操作" field="cz"></cps:column>
				<cps:column title="保卫制度名称" field="bwzdmc"></cps:column>
				<cps:column title="修订时间" field="xdsj"></cps:column>
				<cps:column title="登记单位" field="djdwmc"></cps:column>
				<cps:column title="登记日期" field="djsj"></cps:column>
				<cps:column title="登记人" field="djrxm"></cps:column>
			</cps:tableGrid>
		</td>
	</tr>
	<tr height="5">
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<creator:tbar id="bwjys">
				<cps:button value="登记保卫建议书" onclick="openBwjg('toBwjys','add','')"></cps:button>
			</creator:tbar>
			<cps:tableGrid list="${dwBean.bwjysList}" height="150" id="bwjysList" title="保卫建议书"
				autoload="true" searchform="" pageSize="5" width="99.5%"
				usepager="false" mutilSelect="false" isAsynch="false" tbarId="bwjys">
				<cps:column isNumber="true" title="序号"></cps:column>
				<cps:column title="操作" field="cz"></cps:column>
				<cps:column title="建议书名称" field="jysmc"></cps:column>
				<cps:column title="下达时间" field="xdsj"></cps:column>
				<cps:column title="下达单位" field="xddwmc"></cps:column>
			</cps:tableGrid>
		</td>
	</tr>
</table>

</creator:view>