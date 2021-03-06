<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="安保人员信息">
<creator:Script src="/jsp/sydw/js/sydwchild.js"></creator:Script>
	<creator:tbar id="cyry_op">
	<cps:button value="查询安保人员" onclick="queryCyry()" />
	<cps:button value="登记安保人员" type="button" onclick="addAbry()" />
	<cps:button value="关闭" type="button" onclick="window.close();" />
</creator:tbar>
<creator:panel id="crry_panel" title="安保人员" tbarId="cyry_op">
	<form id="queryCyryForm">
		<input type="hidden" id="jgbh" name="cyrycx.jgbh" value="${jgbh}" />
		<input type="hidden" name="cyrycx.sfabry" value="1" />
		<cps:table>
			<cps:row>
				<cps:tdLabel width="10%">姓名：</cps:tdLabel>
				<cps:tdContent width="23%">
					<cps:textfield name="cyrycx.xm" />
				</cps:tdContent>

				<cps:tdLabel width="10%">身份证号码：</cps:tdLabel>
				<cps:tdContent width="23%">
					<cps:textfield name="cyrycx.sfzh" />
				</cps:tdContent>
				
				<cps:tdLabel width="12%">是否注销：</cps:tdLabel>
				<cps:tdContent>
				&nbsp;
					<input type="radio" name="cyrycx.zxbs" id="zxbz_y" value="1" onclick="queryCyry()"/>
					<label for="zxbz_y">是</label>
					<input type="radio" name="cyrycx.zxbs" id="zxbz_n" value="0" checked="checked" onclick="queryCyry()"/>
					<label for="zxbz_n">否</label>
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
	<cps:tableGrid url="/zagl/dw/queryCyryPageResultInfo.action" title="安保人员列表"
			id="cyryList" autoload="true" searchform="queryCyryForm" width="99.5%"
			pageSize="15" usepager="true" mutilSelect="false">
		<cps:column isNumber="true" title="序号"></cps:column>
		<cps:column title="操作" rowcallback="cyryCallback"></cps:column>
		<cps:column title="身份证号码" field="sfzh"></cps:column>
		<cps:column title="姓名" field="xm"></cps:column>
		<cps:column title="性别" field="xbmc"></cps:column>
		<cps:column title="所在部门" field="bmmc"></cps:column>
		<cps:column title="职务" field="zwmc"></cps:column>
		<cps:column title="聘用期限" field="pynx"></cps:column>
		<cps:column title="入职时间" field="rzsj"></cps:column>
		<cps:column title="离职时间" field="lzsj"></cps:column>
	</cps:tableGrid>
</creator:panel>

</creator:view>