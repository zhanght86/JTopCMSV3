<%@ page contentType="text/html; charset=utf-8" session="false"%>
<%@ taglib uri="/cmsTag" prefix="cms"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<title>门户演示站 - 本站基于JTopcms构建</title>

		<link rel="stylesheet" href="${ResBase}member/css/MenuMatic.css" type="text/css" media="screen" charset="utf-8" />
		<link href="${ResBase}member/css/down-menu.css" rel="stylesheet" type="text/css"></link>
		<link href="${ResBase}member/css/style.css" rel="stylesheet" type="text/css"></link>



	</head>


	<body>
		<div class="header">
			<!--头部开始-->
			<cms:Include page="common/member_head.jsp" />
			<!--头部结束-->

			<cms:Member loginMode="true">
		</div>

		<div class="container">

			<!--左边开始-->
			<cms:Include page="common/member_left.jsp" />
			<!--左边开始-->


			<div class="my_myresume_r">

				<div class="switchBox" id="switchBox">
					<h1 class="new_section">

						<div class="mr_creatr fr">

							<a href="javascript:deleteMsg();">刷新</a>
						</div>
						<span>我的留言</span> &nbsp;&nbsp;&nbsp;
						 



					</h1>
					<div class="con_detail2">
						<form id="form1" name="form1" method="post">
							<div class="title" id="site-nav">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<th width="150" align="left">
											<input type="checkbox" name="checkbox" onclick="javascript:selectAll('checkedId',this)" />
											全选
										</th>
										<th>
											<div class="quick-menu">


												<div class="mytaobao menu-item">
													<div class=menu>
														<a class="menu-hd"><span id="state">所有留言</span><b></b> </a>
														<div class=menu-bd>
															<div class=menu-bd-panel>
																<div>
																	<a href="javascript:changeState('');">所有留言</a>
																	<a href="javascript:changeState('0');">待处理</a>
																	<a href="javascript:changeState('1');">已回复</a>

																</div>
															</div>
															<s class=r></s><s class=rt></s><s class=lt></s><s class=b></s><s class="b b2"></s><s class=rb></s><s class=lb></s>
														</div>
													</div>
												</div>
											</div>
										</th>
										<th>
											&nbsp;
										</th>
										<th width="225">
											状态
										</th>
										<th width="125">
											时间
										</th>
									</tr>
								</table>
							</div>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table-b">
								<cms:QueryData service="cn.com.mjsoft.cms.member.service.MemberService" method="getMemberGbForTag" var="8,${param.pn},${param.state}" objName="Gb">
									<tr>
										<td width="22">
											<input class="form-checkbox" name="checkedId" value="${Gb.gbId}" type="checkbox" onclick="javascript:" />

										</td>
										<td>
											<a href="javascript:gotoGb('${Gb.gbId}');">${Gb.gbTitle}</a>
										</td>
										<td width="225" align="center">
											<cms:if test="${Gb.isReply == 1}">已回复</cms:if>
											<cms:elseif test="${Gb.isReply == 0}">待处理</cms:elseif>

											<cms:else></cms:else>
										</td>
										</td>
										<td width="125" align="center">
											<cms:FormatDate date="${Gb.addDate}" />
										</td>
									</tr>

								</cms:QueryData>

							</table>
							<!--分页代码-->
							<div class="fenye">
								<cms:PageInfo>
									<tr id="pageBarTr">
										<td colspan="8" class="PageBar" align="left">
											<div class="fr">
												<span class="text_m"> 共 ${Page.totalCount} 行记录 第${Page.currentPage}页 / ${Page.pageCount}页 <input type="text" size="4" id="pageJumpPos" name="pageJumpPos" /> <input type="button" name="goto" value="GOTO" onclick="javascript:jump()" /> </span>
												<span class="page">[<a href="javascript:query('h');">首页</a>]</span>
												<span class="page">[<a href="javascript:query('p');">上一页</a>]</span>
												<span class="page">[<a href="javascript:query('n');">下一页</a>]</span>
												<span class="page">[<a href="javascript:query('l');">末页</a>]</span>&nbsp;
											</div>
											<script>
																function query(flag)
																{
																	var cp = 0;
																	
																	if('p' == flag)
																	{
			                                                             cp = parseInt('${Page.currentPage-1}');
																	}
		
																	if('n' == flag)
																	{
			                                                             cp = parseInt('${Page.currentPage+1}');
																	}
		
																	if('h' == flag)
																	{
			                                                             cp = 1;
																	}
		
																	if('l' == flag)
																	{
			                                                             cp = parseInt('${Page.pageCount}');
																	}
		
																	if(cp < 1)
																	{
			                                                           cp=1;
																	}
																
																	
																	replaceUrlParam(window.location,'pn='+cp);		
																}
													
													
																function jump()
																{
																	replaceUrlParam(window.location,'pn='+document.getElementById('pageJumpPos').value);
																}
															</script>
											<div class="fl"></div>
										</td>
									</tr>
								</cms:PageInfo>
							</div>
						</form>
					</div>


				</div>
			</div>

		</div>
		<div class="footer">
			© 2013 jtopcms.com All Rights Reserved
		</div>

		<script type="text/javascript">
	 
		
		if('0' == '${param.state}')
		{
			$('#state').html('待处理');
		}
		else if('1' == '${param.state}')
		{
			$('#state').html('已回复');
		}
		else
		{
			$('#state').html('所有留言');
		}
		
		

		
			
			function changeState(flag)
		    {
		    	 
		    	
		    	replaceUrlParam(window.location,'state='+flag);
  
		    
		    }
		    
		    
		    function gotoGb(id)
		    {
		    
		    	window.location.href = '${SiteBase}member/member_gb_read.jsp?id='+id;
		    }
		 
	
 
			function changeCode()
			{
				$('#checkCodeImg').attr('src','${SiteBase}common/authImg.do?count=4&line=1&point=60&width=90&height=32&jump=8&rand='+Math.random());
			
			}
</script>
	</body>
</html>

</cms:Member>
