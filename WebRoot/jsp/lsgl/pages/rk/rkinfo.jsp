<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="creator" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="cps" uri="/tags/cps"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<creator:view title="${modename}核实登记">
	<creator:Script src="/jsp/lsgl/js/rkinfo.js"></creator:Script>
	<%@include file="/jsp/lsgl/pages/rk/rkdetailinfo.jsp" %>
</creator:view>
