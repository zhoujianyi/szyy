<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ר�Ҵ�ֽ���.aspx.cs" Inherits="datacut.ר�Ҵ�ֽ���" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ר�Ҵ�ֽ���</title>
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
    #grade{
				width:720px;
			}
			#grade ul{
				margin:0px;
				padding:0px;
			}
			#grade ul li{
				float:left;
				width:90px;
				height:60px;
				line-height:60px;
				border:1px solid #707070;
				list-style-type: none;
				text-align:center;
			}
		    .grade_icon{
                float:left;
				width:50px;
				height:50px;
				margin:15px;
				cursor:pointer;
				border:0px;
			}
			#grade_advice{
				float:left;
				width:100%;
                display:none;
			}

        </style>
    <script src="Scripts/jquery-1.4.1.min.js"></script>
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
    var gradeBox = {
        create: function () {
            var con = document.getElementById("container");
            con.innerHTML = '<div style = "width:370px;display:none;position:absolute;background:#fff;border:1px solid #aacbff;box-shadow:0px 0px 15px #aaa;border-radius:10px;z-index:101;padding:5px;" id = "gradeBox">' +
                '<div style = "width:100%;height:30px;"><span style = "float:left;margin:5px;font-weight:bold;">��ѡ�����۵ȼ�</span><span style="float:right;margin:5px;color:grey;cursor:pointer;" onclick = "gradeBox.hide();">ȡ��</span></div>' +
                '<div style = "float:left;width:100%;height:80px;line-height:80px;">' +
                '   <img class = "grade_icon" src = "default_icon.png" onclick = "gradeBox.check(this,\'low\')" grade = "low"/><img class = "grade_icon" src = "default_icon.png" grade = "mid" onclick = "gradeBox.check(this,\'mid\')"/><img class = "grade_icon" src = "default_icon.png" onclick = "gradeBox.check(this,\'high\');" grade = "high"/>' +
                '</div>' +
                '<div id = "grade_advice"><textarea id = "grade_text" style = "width:350px;height:60px;margin:10px;float:left;font-size:15px;border-radius:5px;border:1px solid #ccc;" placeholder = "��˵��ԭ��"></textarea>' +
                '</div><button style = "width:80px;height:30px;margin:10px;cursor:pointer;float:right;border-radius:5px;font-size:16px;" onclick = "gradeBox.submit();">�ύ</button></div>';
            util.showCenter("gradeBox");
            lock.show();
        },
        submit: function () {
            var _grade = "",
                text = $("#grade_text").val();
            $(".grade_icon").each(function (index) {
                var $this = $(this);
                if (!!$this.attr("checked") && $this.attr("checked") === "true") {
                    _grade = $this.attr("grade");
                }
            });
            if (_grade !== "") {
                //alert(text);
                //��Ӻ�̨�������� 
            } else {
                alert("��ѡ�����۵ȼ�!");
            }
        },
        hide: function () {
            $("#container").children("div").slideUp(300, function () { $(this).remove(); });
            lock.hide();
        },
        check: function ($this, grade) {
            $(".grade_icon").each(function (index) {
                $(this).attr({ "src": "default_icon.png", "checked": "false" });
            });
            if (grade !== "low") {
                $("#grade_advice").slideDown(200);
            } else $("#grade_advice").slideUp(200);
            $($this).attr({ "src": grade + "_icon.png", "checked": "true" });
        }
    }

    var util = {
        showCenter: function (elemId) {
            var elem = document.getElementById(elemId),
                left = (document.documentElement.clientWidth - 450) / 2 + "px",
                top = document.body.scrollTop + document.documentElement.scrollTop + (document.documentElement.clientHeight - 90) / 2 - 80 + "px";
            elem.style.left = left,
            elem.style.top = top;
            $(elem).slideDown(300);
        }
    }

    var lock = {
        show: function (hiddenScroll, time, opac) {
            var t = time || 400
                , o = opac || 0.5
                , _div = document.createElement("div");
            _div.id = "pageOverlay";
            _div.style.display = "block";
            _div.style.width = "100%";
            _div.style.height = "100%";
            _div.style.position = "fixed";
            _div.style.top = "0px";
            _div.style.left = "0px";
            _div.style.zIndex = "100";
            _div.style.background = "#000000";
            _div.style.opacity = 0.1;
            _div.style.filter = "alpha(opacity=10)";
            document.body.appendChild(_div);
            $(_div).animate({ "opacity": "0.5" }, t);
        },
        hide: function (hiddenScroll, time) {
            var _div = document.getElementById("pageOverlay");
            $(_div).fadeOut(300, function () { document.body.removeChild(_div); });
        }
    }


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
			    ar[0] = "�����ߵ����ػ����ڵ��ͷɻ��ṹ���ӹ��е�ʾ��Ӧ��"
			    ar[1] = "�������ݿ�"
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
                        [ <a href="~/ר��������.aspx" ID="A1" runat="server">��ҳ</a> ]
                        [ <a href="~/��¼.aspx" ID="HeadLoginStatus" runat="server">�˳�</a> ]
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        ��ӭʹ�� <span class="bold"><asp:LoginName ID="HeadLoginName" runat="server" /></span>!
                        [ <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="ע��" LogoutPageUrl="~/"/> ]
                    </LoggedInTemplate>
                </asp:LoginView>

		    </P>
		<div id="bg" align="center">
			<form id="form2" runat="server">
				<table cellspacing="0" cellpadding="0" width="750" align="center" border="0">
					<tr>
						<td align="middle" align="left" bgcolor="white" colSpan="2"><img height="107" src="images/��֮����1.jpg" width="880"></td>
					</tr>
					<tr>
						<td vAlign="top" width="152" background="images/bg.png" bgColor="#f5f5f5">
							<table cellSpacing="0" cellPadding="0" width="152" align="center" border="0">
								<!--DWLayoutTable-->
								<tr>
									<td class="STYLE26" onmouseover="MM_showHideLayers('Layer2','','show')" onmouseout="MM_showHideLayers('Layer2','','hide')"
										align="center" width="152" background="images/bbt1.png" height="25">
                                        <asp:HyperLink ID="HyperLink1"   NavigateUrl="~/ר�Ҽ�������.aspx" runat="server" 
                                            Font-Bold="True" ForeColor="#003366">������Ϣ</asp:HyperLink></td>
								</tr>
								<tr>
									<td width="152" height="25" align="center" 
										background="images/bbt2.png" class="STYLE26" onmouseover="MM_showHideLayers('Layer4','','show')" onmouseout="MM_showHideLayers('Layer4','','hide')"><asp:HyperLink ID="HyperLink2"   NavigateUrl="~/ר�Ҵ�ֽ���.aspx" runat="server" 
                                            Font-Bold="True" ForeColor="#003366">�������</asp:HyperLink></td>
								</tr>
								<tr>
									<td width="200" height="25" align="center"
										background="images/bbt3.png" class="STYLE26" onmouseover="MM_showHideLayers('Layer5','','show')" onmouseout="MM_showHideLayers('Layer5','','hide')"><asp:HyperLink ID="HyperLink3"   NavigateUrl="~/ר�ҷ���Ϣ����.aspx" runat="server" 
                                            Font-Bold="True" ForeColor="#003366">�㷢��Ϣ</asp:HyperLink></td>
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
										    if (hour < 6) hello = '�賿��!&nbsp;'
										    else if (hour < 9) hello = '���Ϻ�!&nbsp;'
										    else if (hour < 12) hello = '�����!&nbsp;'
										    else if (hour < 14) hello = '�����!&nbsp;'
										    else if (hour < 17) hello = '�����!&nbsp;'
										    else if (hour < 19) hello = '�����!&nbsp;'
										    else if (hour < 22) hello = '���Ϻ�!&nbsp;'
										    else { hello = '��ҹ��!&nbsp;' }
										    day = today.getDay()
										    if (day == 0) day = '&nbsp;������'
										    else if (day == 1) day = '&nbsp;����һ'
										    else if (day == 2) day = '&nbsp;���ڶ�'
										    else if (day == 3) day = '&nbsp;������'
										    else if (day == 4) day = '&nbsp;������'
										    else if (day == 5) day = '&nbsp;������'
										    else if (day == 6) day = '&nbsp;������'
										    date = (today.getFullYear()) + '��' + (today.getMonth() + 1) + '��' + today.getDate() + '��';
										    document.write("<strong><font color=#2f4f4f>" + hello + "</font></strong>");
										    document.write('<font color=#2f4f4f>������&nbsp;</font>')
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
                                                <asp:Label ID="pj"  Visible="false" runat="server"/>
											    <div id = "grade">
			<ul>
				<li style  =" width:140px"> </li>
				<li> Jan </li>
				<li> Feb </li>
				<li> Mar </li>
				<li> Apr </li>
				<li> May </li>
				<li> Jun </li>
			</ul>
			
      <ul>
        <asp:Repeater ID="FishGrade" runat="server" onitemcommand="FishGrade_ItemCommand">
            <ItemTemplate>
                <li style ="width:140px;">
                    <%# 
                    ((datacut.Model.Grade)Container.DataItem).Fish %> 
                </li>
                <li >
                    <%# 
                        ((datacut.Model.Grade)Container.DataItem).Jan%>
                </li>
                <li>
                    <%# ((datacut.Model.Grade)Container.DataItem).Feb %>
                </li>
                <li>
                    <%# ((datacut.Model.Grade)Container.DataItem).Mar %>
                </li>
                <li>
                    <%# ((datacut.Model.Grade)Container.DataItem).Apr %>
                </li>
                <li>
                    <%# ((datacut.Model.Grade)Container.DataItem).May %>
                </li>
                <li>
                    <%# ((datacut.Model.Grade)Container.DataItem).Jun %>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
		</div>
                                                <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" Text="�ύ" />
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
								
								<!-- TemplateEndEditable --></div>
						</td>
					</tr>
					<tr>
						<td vAlign="top" align="center" background="images/w72.png" bgColor="#f5f5f5" colSpan="2"
							height="50">Copyright@ �������պ����ѧ.
All Rights Reserved</td>
					</tr>
				</table>
			</form>
		</div>
    <div id = "container"></div>
    <input type ="text" runat ="server"  id ="advice" name ="advice" />
</body>
</html>
