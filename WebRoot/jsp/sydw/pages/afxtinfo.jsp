<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="安防系统信息">
<creator:Script src="/jsp/sydw/js/sydwchild.js"></creator:Script>
<creator:tbar id="abss_op">
	<cps:button value="保存" type="button" onclick="saveAbss()" />
	<cps:button value="关闭" type="button" onclick="window.close()" />
</creator:tbar>
<creator:panel id="abss_panel" title="安防系统" tbarId="abss_op">
	<form id="abssform">
		<input type="hidden" name="modename" value="安防系统" />
		<input type="hidden" name="opertype" value="${dw.opertype}" />
		<input type="hidden" name="dw.abss.ssbh" id="ssbh" value="${dw.abss.ssbh}" />
		<input type="hidden" name="dw.abss.jgbh" id="abss_jgbh" value="${jgbh}" />
		<input type="hidden" name="dw.dwjbxx.jgbh" id="jgbh" value="${dwBean.dwjbxx.jgbh}" />
		<cps:table>
			<cps:row>
				<cps:tdLabel>
					<font color="red">*</font>系统名称：
				</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.abss.xtmc" id="xtmc" maxlength="50" required="true"/>
				</cps:tdContent>
				<cps:tdLabel>验收单位：</cps:tdLabel>
				<cps:tdContent>
					<cps:select name="dw.abss.ysdw" id="ysdw" zdlb="ZDY_AFXT_YSDW" headerKey="" headerValue=" "/>
				</cps:tdContent>
				<cps:tdLabel>系统检测情况：</cps:tdLabel>
				<cps:tdContent>
					<cps:select name="dw.abss.xtjcqk" id="xtjcqk" headerKey="" headerValue=" " zdlb="ZDY_AFXT_JCQK" />
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>安防管理属性：</cps:tdLabel>
				<cps:tdContent>
					<cps:select  zdlb="ZDY_AFGLSX" id="afglsx" name="dw.abss.afglsx" optgroup="true"headerKey="" headerValue=" "></cps:select>
				</cps:tdContent>
				
				<cps:tdLabel>安防系统管理员：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.abss.afxtgly" id="afxtgly" maxlength="15" />
				</cps:tdContent>
				
				<cps:tdLabel>安防系统值守电话：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.abss.afxtzsdh" id="afxtzsdh" maxlength="30" inputType="onlychar" isPhone="true"/>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>入侵报警子系统：</cps:tdLabel>
				<cps:tdContent>
					<s:select list="#{'0':'无','1':'有'}"  name="dw.abss.ywrqbjzxt" id="ywrqbjzxt" onclick="rqxtChange(this.value)" cssClass="cps-select" headerKey="" headerValue=" " ></s:select>
				</cps:tdContent>
				
				<cps:tdLabel>联网情况：</cps:tdLabel>
				<cps:tdContent>
					<cps:select name="dw.abss.rqxtlwqk" id="rqxtlwqk" zdlb="ZDY_AFXT_LWQK" headerKey="" headerValue=" " disabled="true" />
 				</cps:tdContent>
 				<cps:tdLabel>移动目标数：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.abss.ydmbs" id="ydmbs" maxlength="4" inputType="integer" disabled="true"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>视频监控子系统：</cps:tdLabel>
				<cps:tdContent>
					<s:select list="#{'0':'无','1':'有'}" name="dw.abss.ywspjkzxt" id="ywspjkzxt" onclick="spjkxtChange(this.value)" cssClass="cps-select"  headerKey="" headerValue=" "></s:select>
				</cps:tdContent>
				
				<cps:tdLabel>施工单位：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.abss.sgdw" id="sgdw" maxlength="100" disabled="true"/>
				</cps:tdContent>
				
 				<cps:tdLabel>图像保存天数：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.abss.txbcts" id="txbcts" maxlength="4" inputType="integer" disabled="true"/>
 				</cps:tdContent>
			</cps:row>
			<cps:row>
				<cps:tdLabel>摄像机数量：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.abss.sxjsl" id="sxjsl" maxlength="4" inputType="integer" disabled="true"/>
 				</cps:tdContent>
 				
 				<cps:tdLabel>联网情况：</cps:tdLabel>
				<cps:tdContent>
					<cps:select name="dw.abss.spjkxtlwqk" id="spjkxtlwqk" zdlb="ZDY_AFXT_LWQK" headerKey="" headerValue=" " disabled="true"/>
 				</cps:tdContent>
 				
 				<cps:tdLabel>运行情况：</cps:tdLabel>
				<cps:tdContent>
					<cps:select name="dw.abss.yxqk" id="yxqk" zdlb="ZDY_AFXT_YXQK" headerKey="" headerValue=" " disabled="true"/>
				</cps:tdContent>
 				
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>系统造价(万元)：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.abss.xtzj" id="xtzj" maxlength="9" inputType="number" disabled="true"/>
				</cps:tdContent>
			 	
			 	<cps:tdLabel>探测器数量：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.abss.tcqsl" id="tcqsl" maxlength="4" inputType="integer" disabled="true"/>
				</cps:tdContent>
				
				<cps:tdLabel>固定目标数：</cps:tdLabel>
				<cps:tdContent>
					<cps:textfield name="dw.abss.gdmbs" id="gdmbs" maxlength="4" inputType="integer" disabled="true"/>
				</cps:tdContent>
			</cps:row>
			<cps:row>
				
			</cps:row>
			
			<cps:row>
				<cps:tdLabel>出入口监控子系统：</cps:tdLabel>
				<cps:tdContent>
					<s:select list="#{'0':'无','1':'有'}" name="dw.abss.ywcrkjkzxt" id="ywcrkjkzxt" cssClass="cps-select"  headerKey="" headerValue=" "></s:select>
				</cps:tdContent>
				
				<cps:tdLabel>电子巡查子系统：</cps:tdLabel>
				<cps:tdContent>
					<s:select list="#{'0':'无','1':'有'}" name="dw.abss.ywdzxcxt" id="ywdzxcxt" cssClass="cps-select" headerKey="" headerValue=" "></s:select>
				</cps:tdContent>
				
				<cps:tdLabel>停车库管理子系统：</cps:tdLabel>
				<cps:tdContent>
					<s:select list="#{'0':'无','1':'有'}" name="dw.abss.ywtckglzxt" id="ywtckglzxt" cssClass="cps-select" headerKey="" headerValue=" "></s:select>
				</cps:tdContent>
			</cps:row>
			
			<cps:row>
				<cps:tdLabel width="15%">登记人：</cps:tdLabel>
				<cps:tdContent width="18%">
					<c:choose>
						<c:when test="${dw.abss.djrxm != null}">
							<cps:textfield name="dw.abss.djrxm" value="${dw.abss.djrxm}" readonly="true" id="djrxm" />
						</c:when>
						<c:otherwise>
							<cps:textfield name="dw.abss.djrxm" value="${loginInfo.realname}" readonly="true" id="djrxm" />
						</c:otherwise>
					</c:choose>
				</cps:tdContent>
				<cps:tdLabel width="15%">登记时间：</cps:tdLabel>
				<cps:tdContent width="18%">
					<c:choose>
						<c:when test="${dw.abss.djsj != null}">
							<cps:textfield name="dw.abss.djsj" value="${dw.abss.djsj}" readonly="true" id="djsj" />
						</c:when>
						<c:otherwise>
							<cps:textfield name="dw.abss.djsj" value="${currentSystemDate}" readonly="true" id="djsj" />
						</c:otherwise>
					</c:choose>
				</cps:tdContent>

				<cps:tdLabel width="15%">登记单位：</cps:tdLabel>
				<cps:tdContent>
					<c:choose>
						<c:when test="${dw.abss.djdwdm != null}">
							<cps:textfield name="dw.abss.djdwmc" value="${dw.abss.djdwmc}" readonly="true" id="djdwmc" />
							<input type="hidden" name="dw.abss.djdwdm" id="djdwdm" value="${dw.abss.djdwdm}"/>
						</c:when>
						<c:otherwise>
							<cps:textfield name="dw.abss.djdwmc" value="${loginInfo.orgname}" readonly="true" id="djdwmc" />
							<input type="hidden" name="dw.abss.djdwdm" id="djdwdm" value="${loginInfo.orgcode }"/>
						</c:otherwise>
					</c:choose>
					
				</cps:tdContent>
			</cps:row>
		</cps:table>
	</form>
	<cps:tableGrid list="${dw.abssList}" title="安防系统列表" id="abssList" autoload="true"
		width="99.5%" height="150" isAsynch="false" click="loadAfxtxx"
		mutilSelect="false" usepager="false">
		<cps:column isNumber="true" title="序号" width="5%"></cps:column>
		<cps:column title="操作" field="cz"></cps:column>
		<cps:column title="系统名称" field="xtmc"></cps:column>
		<cps:column title="安防管理属性" field="afglsxmc" ></cps:column>
		<cps:column title="系统检测情况" field="xtjcqkmc" ></cps:column>
		<cps:column title="管理员" field="afxtgly"></cps:column>
		<cps:column title="值守电话" field="afxtzsdh" ></cps:column>
	</cps:tableGrid>	
</creator:panel>
</creator:view>