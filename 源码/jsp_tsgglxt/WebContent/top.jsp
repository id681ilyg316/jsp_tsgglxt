<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path %>/ncss/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=path %>/ncss/js/jquery.js"></script>
<title>进销存管理系统</title>
<script language=JavaScript>
function logout(){
	if (confirm("您确定要退出图书馆管理系统吗？"))
	top.location = "loginout.jsp";
	return false;
}
</script>

</head> 
<body style="background:url(<%=path %>/ncss/images/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="<%=path %>/index.jsp" target="_parent"><img src="<%=path %>/ncss/images/logo.png" title="系统首页" /></a>
    </div>
    
            
    <div class="topright">    
    <ul>
    
    <li><a href="#" target="_self" onClick="logout();">退出</a></li>
    </ul>
     
    <div class="user">
    <span>${user}(${hui}${type})</span>
     
    </div>    
    
    </div>


</html>

