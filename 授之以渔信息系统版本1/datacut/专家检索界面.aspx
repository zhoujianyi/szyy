<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="专家检索界面.aspx.cs" Inherits="datacut.专家检索界面" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>专家检索界面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<style type="text/css">
		.STYLE4 { FONT-SIZE: small; COLOR: #778899 }
	.STYLE26 { FONT-SIZE: 12px; COLOR: #2f4f4f }
	.STYLE29 { FONT-SIZE: 12px; COLOR: #778899 }
	#Layer1 { Z-INDEX: 1; LEFT: 101px; WIDTH: 107px; POSITION: absolute; TOP: 207px; HEIGHT: 20px }
	BODY { BACKGROUND-COLOR: #f5f5f5 }
	.STYLE34 { COLOR: #f5f5f5 }
	#Layer2 { Z-INDEX: 1; LEFT: 271px; VISIBILITY: hidden; WIDTH: 160px; POSITION: absolute; TOP: 112px; HEIGHT: 53px }
	.STYLE37 { COLOR: #2f4f4f }
	#Layer3 { Z-INDEX: 2; LEFT: 325px; WIDTH: 167px; POSITION: absolute; TOP: 322px; HEIGHT: 162px }
	#Layer4 { Z-INDEX: 2; LEFT: 271px; VISIBILITY: hidden; WIDTH: 163px; POSITION: absolute; TOP: 139px; HEIGHT: 189px }
	A:link { COLOR: #2f4f4f; TEXT-DECORATION: none }
	A:visited { TEXT-DECORATION: none }
	A:hover { TEXT-DECORATION: none }
	A:active { TEXT-DECORATION: none }
	#Layer5 { Z-INDEX: 3; LEFT: 271px; VISIBILITY: hidden; WIDTH: 163px; POSITION: absolute; TOP: 163px; HEIGHT: 79px }
	.STYLE40 { FONT-SIZE: x-small; COLOR: #2f4f4f }
	#Layer6 { Z-INDEX: 4; LEFT: 271px; VISIBILITY: hidden; WIDTH: 159px; POSITION: absolute; TOP: 187px; HEIGHT: 100px }
	#Layer7 { Z-INDEX: 5; LEFT: 272px; VISIBILITY: hidden; WIDTH: 165px; POSITION: absolute; TOP: 239px; HEIGHT: 72px }
	#Layer8 { Z-INDEX: 6; LEFT: 272px; VISIBILITY: hidden; WIDTH: 161px; POSITION: absolute; TOP: 266px; HEIGHT: 87px }
	.STYLE41 { FONT-SIZE: xx-large; COLOR: #2f4f4f }
	.STYLE42 { FONT-SIZE: large }
	.STYLE50 { FONT-SIZE: 18px; COLOR: #778899 }
	#bg #form1 table tr td {
	font-weight: bold;
	font-size: 14px;
}
            .auto-style1 {
                height: 46px;
            }
            .auto-style2 {
                height: 46px;
                width: 224px;
            }
            .auto-style3 {
                width: 224px;
            }
            .auto-style4 {
                height: 40px;
            }
            .auto-style5 {
                height: 40px;
                width: 224px;
            }
            .auto-style6 {
                height: 46px;
                width: 102px;
            }
            .auto-style7 {
                height: 40px;
                width: 102px;
            }
            .auto-style8 {
                width: 102px;
            }
            </style>
		<script type="text/JavaScript">
<!--
    function MM_findObj(n, d) { //v4.01
        var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
            d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
        }
        if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
        for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
        if (!x && d.getElementById) x = d.getElementById(n); return x;
    }
    function MM_showHideLayers() { //v9.0
        var i, p, v, obj, args = MM_showHideLayers.arguments;
        for (i = 0; i < (args.length - 2) ; i += 3)
            with (document) if (getElementById && ((obj = getElementById(args[i])) != null)) {
                v = args[i + 2];
                if (obj.style) { obj = obj.style; v = (v == 'show') ? 'visible' : (v == 'hide') ? 'hidden' : v; }
                obj.visibility = v;
            }
    }
    //-->
        </script>
</head>
<body background="images/background.png" >
   
		<P style="text-align: right">
			<script language="JavaScript">
			    var speed = 200 //Delay Between Every word
			    var pause = 1000 //Delay Between EveryLine
			    var timerID = null
			    var bannerRunning = false
			    var ar = new Array()
			    ar[0] = "国产高档数控机床在典型飞机结构件加工中的示范应用"
			    ar[1] = "切削数据库"
			    var currentMessage = 0
			    var offset = 0
			    function stopBanner() {
			        if (bannerRunning)
			            clearTimeout(timerID)
			        bannerRunning = false
			    }
			    function startBanner() {
			        stopBanner()
			        showBanner()
			    }
			    function showBanner() {
			        var text = ar[currentMessage]
			        if (offset < text.length) {
			            if (text.charAt(offset) == " ")
			                offset++
			            var partialMessage = text.substring(0, offset + 1)
			            window.status = partialMessage
			            offset++
			            timerID = setTimeout("showBanner()", speed)
			            bannerRunning = true
			        }
			        else {
			            offset = 0
			            currentMessage++
			            if (currentMessage == ar.length)
			                currentMessage = 0
			            timerID = setTimeout("showBanner()", pause)
			            bannerRunning = true
			        }
			    }
			    startBanner();

                </script>

            <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false" >
                    <AnonymousTemplate>
                        [ <a href="~/专家主界面.aspx" ID="A1" runat="server">主页</a> ]
                        [ <a href="~/登录.aspx" ID="HeadLoginStatus" runat="server">退出</a> ]
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        欢迎使用 <span class="bold"><asp:LoginName ID="HeadLoginName" runat="server" /></span>!
                        [ <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="注销" LogoutPageUrl="~/"/> ]
                    </LoggedInTemplate>
                </asp:LoginView>

		    </P>
		<div id="bg" align="center">
			<form id="form2" runat="server">
				<table cellspacing="0" cellpadding="0" width="750" align="center" border="0">
					<tr>
						<td align="middle" align="left" bgcolor="white" colSpan="2"><img height="107" src="images/授之以鱼1.jpg" width="880"></td>
					</tr>
					<tr>
						<td vAlign="top" width="152" background="images/bg.png" bgColor="#f5f5f5">
							<table cellSpacing="0" cellPadding="0" width="152" align="center" border="0">
								<!--DWLayoutTable-->
								<tr>
									<td class="STYLE26" onmouseover="MM_showHideLayers('Layer2','','show')" onmouseout="MM_showHideLayers('Layer2','','hide')"
										align="center" width="152" background="images/bbt1.png" height="25">
                                        <asp:HyperLink ID="HyperLink1"   NavigateUrl="~/专家检索界面.aspx" runat="server" 
                                            Font-Bold="True" ForeColor="#003366">检索信息</asp:HyperLink></td>
								</tr>
								<tr>
									<td width="152" height="25" align="center" 
										background="images/bbt2.png" class="STYLE26" onmouseover="MM_showHideLayers('Layer4','','show')" onmouseout="MM_showHideLayers('Layer4','','hide')"><asp:HyperLink ID="HyperLink2"   NavigateUrl="~/专家打分界面.aspx" runat="server" 
                                            Font-Bold="True" ForeColor="#003366">健康打分</asp:HyperLink></td>
								</tr>
								<tr>
									<td width="200" height="25" align="center"
										background="images/bbt3.png" class="STYLE26" onmouseover="MM_showHideLayers('Layer5','','show')" onmouseout="MM_showHideLayers('Layer5','','hide')"><asp:HyperLink ID="HyperLink3"   NavigateUrl="~/专家发消息界面.aspx" runat="server" 
                                            Font-Bold="True" ForeColor="#003366">广发消息</asp:HyperLink></td>
								</tr>
								
																
								<tr>
									<td height="30" valign="top"><img src="images/444.png" width="152" height="30" hspace="0" vspace="0"></td>
								</tr>
								<tr>
									<td class="STYLE29" vAlign="middle" align="center" background="images/888.png" bgcolor="#f5f5f5"
										height="223">
										<script>
										    today = new Date();
										    var day;
										    var date;
										    var hello;
										    hour = today.getHours()
										    if (hour < 6) hello = '凌晨好!&nbsp;'
										    else if (hour < 9) hello = '早上好!&nbsp;'
										    else if (hour < 12) hello = '上午好!&nbsp;'
										    else if (hour < 14) hello = '中午好!&nbsp;'
										    else if (hour < 17) hello = '下午好!&nbsp;'
										    else if (hour < 19) hello = '傍晚好!&nbsp;'
										    else if (hour < 22) hello = '晚上好!&nbsp;'
										    else { hello = '午夜好!&nbsp;' }
										    day = today.getDay()
										    if (day == 0) day = '&nbsp;星期日'
										    else if (day == 1) day = '&nbsp;星期一'
										    else if (day == 2) day = '&nbsp;星期二'
										    else if (day == 3) day = '&nbsp;星期三'
										    else if (day == 4) day = '&nbsp;星期四'
										    else if (day == 5) day = '&nbsp;星期五'
										    else if (day == 6) day = '&nbsp;星期六'
										    date = (today.getFullYear()) + '年' + (today.getMonth() + 1) + '月' + today.getDate() + '日';
										    document.write("<strong><font color=#2f4f4f>" + hello + "</font></strong>");
										    document.write('<font color=#2f4f4f>今天是&nbsp;</font>')
										    document.write("<font color=#2f4f4f>" + date + "</font>");
										    document.write("<font color=#2f4f4f>" + day + "</font>");
										</script>
										<div class="STYLE29" align="center">
											<p>&nbsp;</p>
                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>
											<P>&nbsp;</P>
											<P>&nbsp;</P>
											<P>&nbsp;</P>
											<P>&nbsp;</P>
											<P>&nbsp;</P>
											<P>&nbsp;</P>
										</div>
									</td>
								</tr>
								<tr>
									<td height="30" valign="top"><img src="images/444.png" width="152" height="30" hspace="0" vspace="0" ></td>
								</tr>
							</table>
						</td>
						<td align=center  width="806" bgcolor="#ffffcc"><div id="div1" style="OVERFLOW: auto; WIDTH: 720px" align="center" valign="top" ><!-- TemplateBeginEditable name="EditRegion1" -->
                            
								<p align="center">
									<table id="Table2" cellspacing="0" cellpadding="0" width="700" border="0">
										<tr>
											<td width="27"><img height="27" src="images/left1.png" width="27"></td>
											<td width="137" background="images/top.png">&nbsp;</td>
											<td width="27"><img height="27" src="images/right1.png" width="27"></td>
										</tr>
										<tr>
											<td background="images/left.png">&nbsp;</td>
											<td vAlign="top" bgColor="white" width="700" height="500">
									
                            <table style="width: 100%; height: 133px;" ID="table3" align="left">
				   <tr>
					    <td class="auto-style6">
                            时期</td>
                        <td class="auto-style2">
                            <asp:DropDownList ID="YearList" runat="server" Height="20px"  Width="68px">
                                <asp:ListItem>请选择</asp:ListItem>
                                <asp:ListItem>1991</asp:ListItem>
                                <asp:ListItem>1992</asp:ListItem>
                                <asp:ListItem>1993</asp:ListItem>
                                <asp:ListItem>1994</asp:ListItem>
                                <asp:ListItem>1995</asp:ListItem>
                                <asp:ListItem>1996</asp:ListItem>
                                <asp:ListItem>1997</asp:ListItem>
                                <asp:ListItem>1998</asp:ListItem>
                                <asp:ListItem>1999</asp:ListItem>
                                <asp:ListItem>2000</asp:ListItem>
                                <asp:ListItem>2001</asp:ListItem>
                                <asp:ListItem>2002</asp:ListItem>
                                <asp:ListItem>2003</asp:ListItem>
                                <asp:ListItem>2004</asp:ListItem>
                                <asp:ListItem>2005</asp:ListItem>
                                <asp:ListItem>2006</asp:ListItem>
                                <asp:ListItem>2007</asp:ListItem>
                                <asp:ListItem>2008</asp:ListItem>
                                <asp:ListItem>2009</asp:ListItem>
                                <asp:ListItem>2010</asp:ListItem>
                                <asp:ListItem>2011</asp:ListItem>
                                <asp:ListItem>2012</asp:ListItem>
                                <asp:ListItem>2013</asp:ListItem>
                            </asp:DropDownList>
&nbsp;
                            <asp:DropDownList ID="MonthList" runat="server" Height="20px" Width="65px">
                                <asp:ListItem>请选择</asp:ListItem>
                                <asp:ListItem>Q1</asp:ListItem>
                                <asp:ListItem>Q2</asp:ListItem>
                                <asp:ListItem>Q3</asp:ListItem>
                                <asp:ListItem>Q4</asp:ListItem>
                            </asp:DropDownList>
                        </td>
					           <td class="auto-style1">
                                                种类</td>
                                                <td class="auto-style1"> 
                                                        <asp:DropDownList ID="CategoryList" runat="server" Height="20px" Width="120px">
                                                        </asp:DropDownList></td>
				</tr>
				<tr>
					<td class="auto-style7">
                                                海域</td>
                                               <td class="auto-style5"> 
                                                       <asp:DropDownList ID="FisheryList" runat="server" Height="20px" Width="155px">
                                                       </asp:DropDownList></td>
					<td class="auto-style4">
                                                顾客</td>
                                               <td class="auto-style4">
                                                    <asp:DropDownList ID="CustomerList" runat="server" Height="20px" Width="120px">
                                                    </asp:DropDownList></td>
				</tr>
                                <tr>
                                    <td class="auto-style8" />
                                    <td class="auto-style3">
                        <asp:Button ID="Button1" runat="server" Text="检索" Width="63px" OnClick="SearchButton_Click" 
                            />
                                </td>
                                    <td />

                                    <td />
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:Label ID="NullDataMessage" runat="server" Font-Size="X-Large" ForeColor="Red" 
                                                    Text="没有符合条件的数据，请重新选择" Visible="False" Width="600px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:GridView ID="GridView2" runat="server" 
                                                AutoGenerateColumns="False"
                                                 CellPadding="4" EnableTheming="True" 
                                                 BorderColor="#3366CC" BorderStyle="None" AllowPaging="True" 
                                                 BackColor="White" BorderWidth="1px" PageSize="6" Width="600px" Visible="false">
                                                 <AlternatingRowStyle BorderColor="#000099" BorderStyle="Solid" 
                    BorderWidth="1px" />
                                                    <Columns>
                                                        <asp:BoundField DataField="type" HeaderText="Category" 
                                                            SortExpression="type" ><ControlStyle Width="30px" /></asp:BoundField>
                                                        <asp:BoundField DataField="field" HeaderText="Fishery" 
                                                            SortExpression="field" ><ControlStyle Width="30px" /></asp:BoundField>
                                                        <asp:BoundField DataField="amount" HeaderText="Amount" 
                                                            SortExpression="amount" ><ControlStyle Width="30px" /></asp:BoundField>
                                                        <asp:BoundField DataField="date" HeaderText="Date" 
                                                            SortExpression="date" ><ControlStyle Width="30px" /></asp:BoundField>
                                                    </Columns>
                                                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                                    <RowStyle BackColor="White" ForeColor="#003399" />
                                                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                                    <SortedDescendingHeaderStyle BackColor="#002876" />
                                                </asp:GridView>
                                    </td>
                                </tr>
			</table>
                                                
                                            </td>
											<td background="images/right.png">&nbsp;</td>
										</tr>
										<tr>
											<td><img height="27" src="images/left2.png" width="27"></td>
											<td background="images/down.png">&nbsp;</td>
											<td><img height="27" src="images/right2.png" width="27"></td>
										</tr>
									</table>
								</p>
								</form>
								<!-- TemplateEndEditable --></div>
						</td>
					</tr>
					<tr>
						<td vAlign="top" align="center" background="images/w72.png" bgColor="#f5f5f5" colSpan="2"
							height="50">Copyright@ 北京航空航天大学.
All Rights Reserved/div>
    
</body>
</html>
