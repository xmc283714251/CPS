<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
		<creator:panel id="afglsqjwsgldjgj" title="社区警务室高级查询">
			<form id="gjsearchform">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="13%">市/州：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.citydm}">
									<s:select list="cityXzqhList" id="citydm" cssStyle="width:80%"
										name="sqjwsxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectCountry(this.value,'countrydmselect',querySqjwsxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden id="citydm" name="sqjwsxxQuery.citydm"></s:hidden>
									<s:select list="cityXzqhList" id="citydmselect" cssStyle="width:80%"
										name="sqjwsxxQuery.citydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">县/区：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.countrydm}">
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="sqjwsxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="doubleSelectPcs(this.value,'pcsdmselect',querySqjwsxx)"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="sqjwsxxQuery.countrydm"></s:hidden>
									<s:select list="countryXzqhList" id="countrydmselect" cssStyle="width:80%"
										name="sqjwsxxQuery.countrydm" listKey="dm" listValue="mc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="12%">派出所：</cps:tdLabel>
						<cps:tdContent width="20%">
							<c:choose>
								<c:when test="${empty loginInfo.pcsdm}">
									<s:select list="pcsOrgList" id="pcsdmselect" cssStyle="width:80%"
										name="sqjwsxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" cssClass="cps-input"
										onchange="querySqjwsxx()"></s:select>
								</c:when>
								<c:otherwise>
									<s:hidden name="sqjwsxxQuery.pcsdm"></s:hidden>
									<s:select list="pcsOrgList" id="pcsdmselect" cssStyle="width:80%"
										name="sqjwsxxQuery.pcsdm" listKey="orgcode" listValue="orgjc"
										headerKey="" headerValue="--请选择--" disabled="true"
										cssClass="cps-input"></s:select>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="13%">警务室名称：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="orgname" name="sqjwsxxQuery.orgname"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">责任民警：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:textfield id="zrmj" name="sqjwsxxQuery.zrmj"
								cssStyle="width:80%"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel width="12%">登记时间：</cps:tdLabel>
						<cps:tdContent width="20%">
							<cps:date id="czsj_from" name="sqjwsxxQuery.czsj_from"
								dateFmt="yyyy-MM-dd HH:mm:ss" cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
							至
							<cps:date id="czsj_to" name="sqjwsxxQuery.czsj_to"
										dateFmt="yyyy-MM-dd HH:mm:ss " cssClass="cps-input" cssStyle="width:40%;">
							</cps:date>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdContent colspan="6" align="center">
							<cps:button value="查询" onclick="gjQuerySqjwsxx()"></cps:button>
							<cps:button value="清空" type="reset"></cps:button>
							<cps:button value="关闭" onclick="window.close()"></cps:button>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</form>
		</creator:panel>
		<script type="text/javascript" src="${contextPath}/jsp/afgl/js/af.js"></script>
		<script type="text/javascript"
			src="${contextPath}/jsp/afgl/js/sqjwsxx.js"></script>
</creator:view>