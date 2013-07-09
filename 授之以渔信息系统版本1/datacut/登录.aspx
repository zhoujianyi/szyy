<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="登录.aspx.cs" Inherits="datacut.登录1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>欢迎登录</title>
<style type="text/css">
.STYLE1 {COLOR: #ffffff }
body {
	background-image: url(images/background.png);
}
    .style2
    {
        width: 214px;
        height: 33px;
    }
    .style3
    {
        height: 33px;
    }
</style>
</head>
<form id="form1" runat="server">
<body bgcolor="#F0F0F0" runat="server">

<table id="table3" align="center" cellspacing="0" cellpadding="0" width="191" border="0" runat="server" >
										<tr>
											<td width="27"><img height="27" src="images/left1.png" width="27"></td>
											<td width="137" background="images/top.png">&nbsp;</td>
											<td width="27"><img height="27" src="images/right1.png" width="27"></td>
										</tr>
										<tr>
											<td background="images/left.png">&nbsp;</td>
											<td align="top"  bgcolor="#D6D6D6">
									      <table id="table2" height="413" cellspacing="0" cellpadding="0" width="844" align="center" border="0" runat="server" >
									        <tr>
									          <td height="413" colspan="3" align="center"  bgcolor="#CCFFCC"  
                                                    background="images/主页.jpg" >
                                                  <img src="images/授之以鱼1.jpg" alt="logo" width="880" style="height: 117px" />
									            <p>
                                                    &nbsp;</p>
									            <p>

                                                <span runat="server" class="STYLE1">&nbsp;</p>
									            <p align="left">&nbsp;</p>
									            <p align="left">&nbsp;</p>
									            <table id="table1" runat="server" height="31" cellspacing="1" cellpadding="1" width="616" border="0">
									              <tr >
									                <td align="left" class="style2"></td>
									                <td align="left" width="76" class="style3"><font color="#ff6600"><strong style="color: #FFFFFF">用户名:</strong></font></td>
									                <td align="left" width="272" class="style3"><asp:textbox id="UserName" runat="server" Width="150px" Height="20px"></asp:textbox>
									                  </td>
								                  </tr>
									              <tr>
									                <td align="left" class="style2"></td>
									                <td align="left" width="76" class="style3"><font color="#ff6600"><strong style="color: #FFFFFF">密码:</strong></font></td>
									                <td align="left"  width="272" class="style3"><asp:textbox id="Password" runat="server" Width="150px" Height="20px" TextMode="Password"></asp:textbox>
									                  </td>
								                  </tr>
                                                   <tr>
									                <td align="left" class="style2"></td>
									                <td align="left" width="76" class="style3"></td>
									                <td align="left"  width="272" class="style3">
                                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                                            RepeatDirection="Horizontal" ForeColor="White" 
                                                           >
                                                           
                                                            <asp:ListItem>专家</asp:ListItem>
                                                           
                                                            <asp:ListItem>商家</asp:ListItem> <asp:ListItem>顾客</asp:ListItem>
                                                          
                                                        </asp:RadioButtonList>
                                                       </td>
								                  </tr>
									              <tr>
									                <td align="left" class="style2"></td>
									                <td align="left" width="76" class="style3"></td>
									                <td align="left" width="272" class="style3">
                                                        <asp:Button id="btLogin" runat="server" Width="77px" 
                                                            Text="登   陆" onclick="btLogin_Click" Height="22px" 
                                                       ></asp:Button>
									                  &nbsp;<asp:Button ID="Button1" runat="server" Text="取    消" Width="74px" 
                                                            Height="22px" onclick="Button1_Click" />
                                                        &nbsp;</td>
								                  </tr>
								                </table>
									            </p>
									            </span>
									            <p>
									              <asp:Label id="Message" runat="server" Width="56px" Height="2px" ForeColor="red"   ></asp:Label>
								                </p></td>
								            </tr>
									        </table>
									      </TD>
											<td background="images/right.png">&nbsp;</td>
										</tr>
										<tr>
											<td><img height="27" src="images/left2.png" width="27"></td>
											<td background="images/down.png">&nbsp;</TD>
											<td><img height="27" src="images/right2.png" width="27"></TD>
										</tr>
</table>

</body>
</form>
</html>
