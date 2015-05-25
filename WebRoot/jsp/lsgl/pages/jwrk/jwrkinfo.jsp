<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view>
	<creator:Script src="/jsp/lsgl/js/jwrkinfo.js"></creator:Script>
	<form id="jwrkform">
		<input id="rybh" type="hidden" name="jwrkBean.rybh" value="${jwrkBean.rybh}">
		<input id="jwbh" type="hidden" name="jwrkBean.jwbh" value="${jwrkBean.jwbh}">
		<input id="cyrybh" type="hidden" name="queryBean.cyrybh" value="${queryBean.cyrybh}">
		<cps:PanelView>
			<cps:tbar>
				<cps:button id="savebtn" value="保存" onclick="saveJwrkInfo()"></cps:button>
				<cps:button value="关闭" onclick="parent.close()"></cps:button>
			</cps:tbar>
		 	<cps:panel id="jwrkjbxx" title="境外人口基本信息" height="790px">
				<cps:table>
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>国籍：</cps:tdLabel>
						<cps:tdContent width="25%">
							<input type="hidden" name="jwrkBean.gj" value="${jwrkBean.gj }">
							<cps:select zdlb="GB_GJ" id="gj"  value="${jwrkBean.gj}" required="true" headerKey="" headerValue=" " disabled="true"></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%"><font color="red">*</font>证件种类：</cps:tdLabel>
						<cps:tdContent width="25%">
							<input type="hidden" name="jwrkBean.zjzl" value="${jwrkBean.zjzl}">
							<cps:select zdlb="GB_ZJZL" id="zjzl" value="${jwrkBean.zjzl}" required="true" headerKey="" headerValue=" " disabled="true"></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%"><font color="red">*</font>证件号码：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="zjhm" name="jwrkBean.zjhm" value="${jwrkBean.zjhm}" required="true" maxlength="30" readonly="true"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>英文姓：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="ywm" name="jwrkBean.ywx" value="${jwrkBean.ywx}" required="true" maxlength="50" inputType="onlychar" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>英文名：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="ywm" name="jwrkBean.ywm" value="${jwrkBean.ywm}" required="true" maxlength="50" inputType="onlychar" readonly="true"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>性别：</cps:tdLabel>
						<cps:tdContent>
							<input type="hidden" name="jwrkBean.xb" value="${jwrkBean.xb}">
							<cps:select zdlb="GB_XB" id="xb" value="${jwrkBean.xb}" required="true" headerKey="" headerValue=" " disabled="true"></cps:select>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>中文姓名：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="xm" name="jwrkBean.zwm" value="${jwrkBean.zwm}" maxlength="15"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>出生日期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="csrq" name="jwrkBean.csrq" value="${jwrkBean.csrq}" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}"></cps:date>
						</cps:tdContent>
						<cps:tdLabel><font color="red">*</font>联系电话：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="lxdh" name="jwrkBean.lxdh" isPhone="true" value="${jwrkBean.lxdh}" maxlength="20" required="true" minlength="7"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>服务处所：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="fwcs" name="jwrkBean.fwcs" value="${jwrkBean.fwcs}" maxlength="60" ></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>职务：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="zw" name="jwrkBean.zw" value="${jwrkBean.zw}" maxlength="35"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>电话备注：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield id="lxdhbz" name="jwrkBean.lxdhbz" value="${jwrkBean.lxdhbz}" maxlength="10"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel><font color="red">*</font>居住地址：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<input type="hidden" id="fwid"  name="jwrkBean.fwid" value="${jwrkBean.fwid}"/>
							<input type="hidden" id="rkfwglid" name="jwrkBean.rkfwglid" value="${jwrkBean.rkfwglid}"/>
							<cps:textfield id="dzmc" name="jwrkBean.dzmc" value="${jwrkBean.dzmc}" required="true" cssStyle="width:97%" readonly="true" ></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>签证类型：</cps:tdLabel>
						<cps:tdContent>
							<cps:select zdlb="GA_QZZZL" id="qzzl" name="jwrkBean.qzzl" headerKey="" headerValue=" " value="${jwrkBean.qzzl}"></cps:select>
						</cps:tdContent>
						<cps:tdLabel>签证机关：</cps:tdLabel>
						<cps:tdContent >
							<cps:textfield id="qzjg" name="jwrkBean.qzjg" value="${jwrkBean.qzjg}"></cps:textfield>
						</cps:tdContent>
						<cps:tdLabel>签发日期：</cps:tdLabel>
						<cps:tdContent >
							<cps:date id="qfrq" name="jwrkBean.qfrq" value="${jwrkBean.qfrq}" dateFmt="yyyy-MM-dd" maxDate="${currentSystemDate}" ></cps:date>
						</cps:tdContent>
					</cps:row>
					 <cps:row>
						<cps:tdLabel>停留有效期：</cps:tdLabel>
						<cps:tdContent>
							<cps:date id="tlyxq" name="jwrkBean.tlyxq" value="${jwrkBean.tlyxq}" dateFmt="yyyy-MM-dd"></cps:date>
						</cps:tdContent>
						<cps:tdLabel>停留事由：</cps:tdLabel>
						<cps:tdContent>
							<cps:select zdlb="ZDY_TLSY" id="tlsy" name="jwrkBean.tlsy" value="${jwrkBean.tlsy}" headerKey="" headerValue=" "></cps:select>
						</cps:tdContent>
						<cps:tdLabel>居住类型：</cps:tdLabel>
						<cps:tdContent>
							<s:select id="jwrylx" list="#{'0':'常住','1' : '临住'}" name="jwrkBean.jwrylx" cssClass="cps-select" />
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel>备注：</cps:tdLabel>
						<cps:tdContent colspan="5">
							<cps:textfield id="bz" name="jwrkBean.bz" value="${jwrkBean.bz}" cssStyle="width:97%"></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%"><font color="red">*</font>责任民警：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${not empty rkBean.wlhrkBean.zrmjjh}">
									<input type="hidden" id="zrmjjh" name="jwrkBean.zrmjjh" value="${jwrkBean.zrmjjh }">
									<cps:textfield id="zrmjxm" name="jwrkBean.zrmjxm" value="${jwrkBean.zrmjxm}" onclick="openZrmjSelect('${loginInfo.rootOrgCode}')" readonly="true" required="true"></cps:textfield>
								</c:when>
								<c:otherwise>
									<input type="hidden" id="zrmjjh" name="jwrkBean.zrmjjh" value="${loginInfo.username }">
									<cps:textfield id="zrmjxm" name="jwrkBean.zrmjxm" value="${loginInfo.realname}" onclick="openZrmjSelect('${loginInfo.rootOrgCode}')" readonly="true" required="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%"><font color="red">*</font>责任单位：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${not empty jwrkBean.zrdwdm}">
									<input type="hidden" id="zrdwdm" name="jwrkBean.zrdwdm" value="${jwrkBean.zrdwdm }"/>
									<cps:textfield id="zrdwmc" name="jwrkBean.zrdwmc" value="${jwrkBean.zrdwmc}" readonly="true" required="true"></cps:textfield>
								</c:when>
								<c:otherwise>
									<input type="hidden" id="zrdwdm" name="jwrkBean.zrdwdm" value="${loginInfo.orgcode }"/>
									<cps:textfield id="zrdwmc" name="jwrkBean.zrdwmc" value="${loginInfo.orgname}" readonly="true" required="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">联系电话：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${not empty jwrkBean.zrmjlxdh}">
									<cps:textfield id="zrmjlxdh" name="jwrkBean.zrmjlxdh" value="${jwrkBean.zrmjlxdh}" maxlength="20" minlength="7" isPhone="true"></cps:textfield>
								</c:when>
								<c:otherwise>
									<cps:textfield id="zrmjlxdh" name="jwrkBean.zrmjlxdh" value="${loginInfo.moblie}" maxlength="20" minlength="7" isPhone="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
					 
					<cps:row>
						<cps:tdLabel width="10%">注销标识：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:select id="zxbs" zdlb="ZDY_ZXBS"  name="jwrkBean.zxbs" value="${jwrkBean.zxbs}" onchange="changeZxbs(this.value)"></cps:select>
						</cps:tdContent>
						<cps:tdLabel width="10%">注销时间：</cps:tdLabel>
						<cps:tdContent width="25%">
							<cps:date id="zxsj" disabled="true" name="jwrkBean.zxsj" value="${jwrkBean.zxsj}" dateFmt="yyyy-MM-dd HH:mm:ss" maxDate="${currentSystemDate}"></cps:date>
						</cps:tdContent>
						<cps:tdLabel>注销原因：</cps:tdLabel>
						<cps:tdContent>
							<cps:textfield disabled="true" id="zxyy" name="jwrkBean.zxyy" value="${jwrkBean.zxyy}" ></cps:textfield>
						</cps:tdContent>
					</cps:row>
					<cps:row>
						<cps:tdLabel width="10%">登记民警：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${not empty jwrkBean.djrxm}">
									<cps:textfield id="djrxm" name="jwrkBean.djrxm" value="${jwrkBean.djrxm}" readonly="true"></cps:textfield>
								</c:when>
								<c:otherwise>
									<cps:textfield id="djrxm" name="jwrkBean.djrxm" value="${loginInfo.realname}" readonly="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">登记单位：</cps:tdLabel>
						<cps:tdContent width="25%">
							<c:choose>
								<c:when test="${not empty jwrkBean.djdwdm}">
									<input id="djdwdm" type="hidden" name="jwrkBean.djdwdm" value="${jwrkBean.djdwdm}">
									<cps:textfield id="djdwmc" name="jwrkBean.djdwmc" value="${jwrkBean.djdwmc}" readonly="true"></cps:textfield>
								</c:when>
								<c:otherwise>
									<input id="djdwdm" type="hidden" name="jwrkBean.djdwdm" value="${loginInfo.orgcode}">
									<cps:textfield id="djdwmc" name="jwrkBean.djdwmc" value="${loginInfo.orgname}" readonly="true"></cps:textfield>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
						<cps:tdLabel width="10%">登记时间：</cps:tdLabel>
						<cps:tdContent>
							<c:choose>
								<c:when test="${not empty jwrkBean.djsj}">
									<cps:date id="djsj" name="jwrkBean.djsj" value="${jwrkBean.djsj}"  maxDate="${currentSystemDate}" readOnly="true"></cps:date>
								</c:when>
								<c:otherwise>
									<cps:date id="djsj" name="jwrkBean.djsj"  defaultSystemDate="true"  maxDate="${currentSystemDate}"></cps:date>
								</c:otherwise>
							</c:choose>
						</cps:tdContent>
					</cps:row>
				</cps:table>
			</cps:panel>
		</cps:PanelView>
	</form>
</creator:view>