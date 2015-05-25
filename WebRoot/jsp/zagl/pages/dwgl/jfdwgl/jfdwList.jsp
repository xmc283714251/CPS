<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<creator:view>
	<creator:box>
		<creator:Script src="/jsp/zagl/pages/dwgl/jfdwgl/js/jfdwlist.js"></creator:Script>
		
		<creator:tbar id="dwlisttbar">
			<cps:button value="查询" type="button" onclick="queryJfdw()"></cps:button>
			<cps:button value="导出年审信息" onclick="downloadExcel()"></cps:button>
			<cps:button value="登记单位" onclick="openJfdwInfo('add')"></cps:button>
		</creator:tbar>
		
		<creator:panel id="cxtj" title="社会公共安全技术防范系统设计施工单位查询" tbarId="dwlisttbar">
			<form id="jfdwcx">
				<input type="hidden" name="dwcx.opertype" value="${dwcx.opertype}" id="opertype" />
				<input type="hidden" name="dwcx.hylb" value="09" />
					
				<cps:table>
				<%-- 
					<cps:row>
						<cps:tdLabel width="10%">市局：</cps:tdLabel>
						<cps:tdContent width="22%">
							<c:choose>
								<c:when test="${empty loginInfo.citygajgdm}">
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										name="dwcx.citygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
									</s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dwcx.citygajgjgdm" value="${dwcx.citygajgjgdm}" />
									<s:select id="citygajgjgdm" list="cityGajgjgList"
										disabled="true" name="dwcx.citygajgjgdm" listKey="dm"
										listValue="jc" headerKey="" headerValue="--请选择--"
										cssClass="cps-select"
										onchange="doubleCountryGajgjg(this.value,'countrygajgjgdm')">
									</s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="11%">县区局：</cps:tdLabel>
						<cps:tdContent width="22%">
							<c:choose>
								<c:when test="${empty loginInfo.countrygajgdm}">
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										name="dwcx.countrygajgjgdm" listKey="dm" listValue="jc"
										headerKey="" headerValue="--请选择--" cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dwcx.countrygajgjgdm" value="${dwcx.countrygajgjgdm}" />
									<s:select id="countrygajgjgdm" list="countryGajgjgList"
										disabled="true" name="dwcx.countrygajgjgdm" listKey="dm"
										listValue="jc" headerKey="" headerValue="--请选择--"
										cssClass="cps-select"
										onchange="doublePcsGajgjg(this.value,'pcsdm')"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="11%">派出所：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select id="pcsdm" list="pcsGajgjgList" name="dwcx.pcsdm" onchange="doubleSelectJWS(this.value,'jwsselect')"
										listKey="dm" listValue="jc" headerKey="" headerValue="--请选择--"
										cssClass="cps-select"></s:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="dwcx.pcsdm" value="${dwcx.pcsdm}" />
									<s:select id="pcsdm" list="pcsGajgjgList" name="dwcx.pcsdm"
										disabled="true" listKey="dm" listValue="jc" headerKey=""
										headerValue="--请选择--" cssClass="cps-select"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>警务区：</cps:tdLabel>
						<cps:tdContent>
								<c:choose>
									<c:when test="${empty loginInfo.jwsqdm}">
										<s:select list="jwsqOrgList" id="jwsselect" name="dwcx.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select" onchange="doubleSelectSqxxByJwsdm(this.value,'sqdm')" ></s:select>
									</c:when>
									<c:otherwise>
										<s:hidden id="jwsqdm" name="dwcx.jwsqdm"></s:hidden>
										<s:select list="jwsqOrgList" id="jwsselect" name="dwcx.jwsqdm" listKey="orgcode" listValue="orgjc" headerKey="" headerValue=" "  cssClass="cps-select"  disabled="true"></s:select>
									</c:otherwise>
								</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">社区：</cps:tdLabel>
							<cps:tdContent>
								<s:select id="sqdm" list="sqJbxxList"  name="dwcx.sqdm" listKey="sqbh" listValue="jc" headerKey="" headerValue=" " cssClass="cps-select"></s:select>
						</cps:tdContent>
						<cps:tdLabel>实体名称：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.stmc"></cps:textfield>
						</cps:tdContent>
					</cps:row>
				--%>	
				
					<cps:row>
						<cps:tdLabel width="12%">组织机构代码：</cps:tdLabel>
						<cps:tdContent width="21%">
							<cps:textfield name="dwcx.dwdm"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel width="12%">营业执照号：</cps:tdLabel>
						<cps:tdContent width="23%">
							<cps:textfield name="dwcx.yyzzh"></cps:textfield>
						</cps:tdContent>
						
						<cps:tdLabel width="12%">单位名称：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.dwmc"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>法人代表：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.frdb"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>法人身份证：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield name="dwcx.frsfzhm" />
						</cps:tdContent>
						<cps:tdLabel>单位类别：</cps:tdLabel>
							<cps:tdContent>
								<cps:select zdlb="JG_DWLB" name="dwcx.dwlb" optgroup="true" headerKey="" headerValue=" "></cps:select>
							</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>是否年审：</cps:tdLabel>
						<cps:tdContent>
							<cps:select zdlb="ZDY_ZDSF" headerKey="" headerValue=" " name="dwcx.sfns"  />
						</cps:tdContent>
						
						<cps:tdLabel>备案等级：</cps:tdLabel>
						<cps:tdContent>
							<cps:select zdlb="ZDY_BADJ" name="dwcx.badj" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						
						<cps:tdLabel>年审时间：</cps:tdLabel>
						<cps:tdContent>
							<cps:date name="dwcx.nssj_strat" dateFmt="yyyy-MM-dd" cssStyle="width:39%"></cps:date> - 
							<cps:date name="dwcx.nssj_end" dateFmt="yyyy-MM-dd" cssStyle="width:39%"></cps:date>
						</cps:tdContent>
					</cps:row>
					
					<cps:row>
						<cps:tdLabel>是否注销：</cps:tdLabel>
						<cps:tdContent>
							<cps:select id="zxbs" name="dwcx.zxbs" zdlb="ZDY_ZXBS" headerKey="" headerValue=" " value="0" ></cps:select>
						</cps:tdContent>
						
						<cps:tdLabel>登记时间：</cps:tdLabel>
						<cps:tdContent colspan="3">
							<cps:date id="djsjstart" dateFmt="yyyy-MM-dd" name="dwcx.djsjstart" cssStyle="width:39%" maxDate="${currentSystemDate}"/> -
							<cps:date id="djsjend" dateFmt="yyyy-MM-dd" name="dwcx.djsjend" minDateDepend="djsjstart" cssStyle="width:39%" maxDate="${currentSystemDate}"/>
						</cps:tdContent>
					</cps:row>	
				</cps:table>
			</form>
		</creator:panel>

		<cps:tableGrid url="/zagl/dw/queryDwjbxxPageResultInfoByJgbh.action" title="社会公共安全技术防范系统设计施工安单位"
			id="jfdwlist" autoload="false" pageSize="10" width="99.8%"
			usepager="true" searchform="dwcx" autothead="false" mutilSelect="true">
			<cps:column isNumber="true" title="序号"></cps:column>
			<cps:column isCheckbox="true" expand="false"></cps:column>
			<cps:column title="操作" field="dwcxcz" expand="false"  align="left" ></cps:column>
			<cps:column title="单位名称" field="dwmc" align="left"  maxlength="15"></cps:column>
			<cps:column title="法人代表" field="frdb" align="left"></cps:column>
			<cps:column title="法人身份证" field="frsfzhm" ></cps:column>
			<cps:column title="单位地址" field="dwdz" align="left"></cps:column>
			<cps:column title="登记时间" field="djsj" align="center"></cps:column>
			<cps:column title="注销标识" field="zxbsmc" align="left" ></cps:column>
		</cps:tableGrid>
	</creator:box>
	
	<div style="display:none">
		<iframe id="exportiframe" name="exportiframe" height="0" width="0"></iframe>
	</div>
</creator:view>

