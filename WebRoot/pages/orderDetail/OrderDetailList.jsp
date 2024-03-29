<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<!-- FtpConfigList.jsp -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.Ftp.List.Title"/></title>
<daxtech-tag:CssTag/>
<daxtech-tag:JsTag/>
<script type="text/javascript">
		window.onload=  function(){
		}
		
		function openWindow(url,top,left,width,height){
			var r="";

			if(url.indexOf("?")!=-1){
				url = url+ "&r_=" + Math.random();
			}else {
				url = url+ "?r_" + Math.random();
			}

			var returnval = window.showModalDialog(url,window,"dialogTop:"+top+";dialogLeft:"+left+";dialogWidth="+width+";dialogHeight="+height);
			//通过返回值判断  如果是undefined 说明是 关闭功能 则不执行查询列表功能
			if(returnval == undefined){
				return;
			}
			if(document.getElementById("txtPage")){
				document.getElementById("page").value = (document.getElementById("txtPage").value - 1);
			}else{
				document.getElementById("page").value = 0;
			}
			document.getElementById("form").submit();
		}
		
		function addObj(){
			var flag=$("#flag").val();
			var url="<%=request.getContextPath()%>/pages/order/form/orderEdit?flag="+flag;
			var top=document.body.offsetHeigth/2;
			var left=document.body.offsetWIdth/2;
			var width="600px";
			var height="350px";
			openWindow(url,top,left,width,height);
		}
		
		function modObj(id){
			$("#objflag").val($("#flag").val());
			var url="<%=request.getContextPath()%>/pages/order/form/orderUpdate?orderid="+id;
			var top=document.body.offsetHeigth/2;
			var left=document.body.offsetWIdth/2;
			var width="600px";
			var height="550px";
			openWindow(url,top,left,width,height);
		}
		
		function delObj(id){
			if(window.confirm("<ingenta-tag:LanguageTag sessionKey='lang' key='Pages.PushOrder.delete'/>")){
				document.getElementById("form").action="delete";
				document.getElementById("id").value=id
				document.getElementById("page").value=document.getElementById("txtPage").value-1;
				document.getElementById("form").submit();
			}
		}
		
		function query(){
			document.getElementById("page").value="0";
			document.getElementById("form").submit();
		}
</script>
</head>
<body>
<form:form action="manager" method="post" commandName="form" id="form">
<!-- 0代表自己的配置  1代表目标配置 -->

<c:if test="${form.msg!=null&&form.msg != ''}">
<script language="javascript">
		alert('${form.msg}');
	</script>
</c:if>
	<div class="bodyDiv bodyNew" style="position:relative;">
	<div class="pos">
	
	<div class="book-module" style="margin:5px 0px;">
	<table width="95%" border="0" cellpadding="0" cellspacing="1" class="tab02">
       <tr>
       	 <th width="8%" align="center"><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.PushOrder.orderDetail.name"/>:&nbsp;</th>
       	 <td width="18%">
         	<form:input path="name" cssStyle="width:98%" id="fileCode"/>
         </td>
         
         <th width="8%" align="center"><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.PushOrder.disan.laiyuan"/>:&nbsp;</th>
          <td width="18%">
         	<form:input path="publisher" cssStyle="width:98%" id="fileCode"/>
         </td>
         </tr>
         <tr>

         <th width="8%" align="center"><ingenta-tag:LanguageTag sessionKey="lang" key="Global.Label.CreateTime"/>:&nbsp;</th>
          <td width="18%">
         	<form:input path="createStr" cssStyle="width:98%" id="fileCode"/>
         </td>       
            
         <th width="8%" align="center"><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.Content.Table.Lable.Status"/>:&nbsp;</th>
         <td width="18%">
         <form:select path="sstatus" id="cunZai">
         <form:option value="" selected="select" ><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.PushOrder.order.xuanze"/></form:option>
		 <form:option value="1" ><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.PushOrder.dai.chuli"/></form:option>
		 <form:option value="2" ><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.PushOrder.order.chulizhong"/></form:option>
		 <form:option value="3" ><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.PushOrder.chuli.wencheng"/></form:option>
		 </form:select>
         </td>
          
          
       </tr>
    </table>
    </div>
<div class="bodyBg">
	<div class="module">
  <div style="margin:5px 0px;">
   <input type="button" name="add" value="<ingenta-tag:LanguageTag sessionKey="lang" key="Pages.UserDate.Excel.pldaoru"/>" class="devil_button" onclick="addObj();"/>
   <input type="button" value="<ingenta-tag:LanguageTag sessionKey="lang" key="Global.Button.Inquiry"/>" class="devil_button" onclick="query()"/>
  
  </div>
     	<table width="95%" border="0" cellpadding="0" cellspacing="1" class="devil_table">
     		<thead>
     		<tr>
     			
		        <th width="10%" align="center">
		        	<ingenta-tag:LanguageTag sessionKey="lang" key="Global.Label.SerialNumber"/>
		        </th>
		        <th width="8%" align="center"><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.PushOrder.xiadan.ren"/></th>
		        <th width="8%" align="center"><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.PushOrder.orderDetail.name"/></th>
		        <th width="8%" align="center"><ingenta-tag:LanguageTag sessionKey="lang" key="Global.Label.CreateTime"/></th>
		        <th width="8%" align="center"><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.PushOrder.xiugai.date"/></th>
		        <th width="8%" align="center"><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.Content.Table.Lable.Author"/></th>
		        <th width="8%" align="center"><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.PushOrder.disan.laiyuan"/></th>
		        <th width="8%" align="center"><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.PushOrder.orderDetail.yuanjia"/></th>
		        <th width="8%" align="center"><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.PushOrder.order.shuliang"/></th>
		        <th width="8%" align="center"><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.Content.Table.Lable.Status"/></th>
		        <th width="10%" align="center"><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.UserDate.user.operation"/></th>
		    </tr>
		    </thead>
		    <tbody>
		   	<c:forEach items="${list}" var="o" varStatus="index">
		   	   <tr  class="<c:if test="${index.index%2 == 1}">odd</c:if><c:if test="${index.index%2 == 0}">eve</c:if>">
		   	  
		   	   	<td align="center">${(form.curpage*form.pageCount)+index.index+1}</td>
		        <td align="center">${o.createdby}</td>
		        <td align="center">${o.name}</td>
		        <td align="center"><fmt:formatDate value="${o.createdon}" pattern="yyyy-MM-dd"/></td>
		        <td align="center"><fmt:formatDate value="${o.updatedon}" pattern="yyyy-MM-dd"/></td>
		        <td align="center">${o.author}</td>
		        <td align="center">${o.publisher}</td>
		        <td align="center">${o.listPrice}</td>
		        <td align="center">${o.quantity}</td>
		        
		        <td align="center">
		       	<c:if test="${o.status == '1'}"><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.PushOrder.dai.chuli"/></c:if>
		       	<c:if test="${o.status == '2'}"><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.PushOrder.order.chulizhong"/></c:if>
		       	<c:if test="${o.status == '3'}"><ingenta-tag:LanguageTag sessionKey="lang" key="Pages.PushOrder.chuli.wencheng"/></c:if>
		        </td>
		        
		        <td align="center">
		        	<input type="button" value="<ingenta-tag:LanguageTag sessionKey="lang" key="Global.Prompt.Modify"/>" class="devil_button" onclick="modObj('${o.id}')"/>
		        	<input type="button" value="<ingenta-tag:LanguageTag sessionKey="lang" key="Global.Prompt.Delete"/>" class="devil_button" onclick="delObj('${o.id}')"/>
		        </td>
		        </tr>
		   	</c:forEach>
		    </tbody>
      	</table>
		<table width="95%" border="0" cellpadding="0" cellspacing="0">
      		<tr height="40">
		   		<td height="25">
		   			<ingenta-tag:SplitTag page="${form.curpage}" pageCount="${form.pageCount}" count="${form.count}" formName="form" showNum="10" i18n="${sessionScope.lang}"/>
		   		</td>
		   	</tr>
      	</table>
      	</div>
</div>
</div>
</div>
<form:hidden path="id"/>
</form:form>
</body>
</html>

