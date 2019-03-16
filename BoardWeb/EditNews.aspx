<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditNews.aspx.cs" Inherits="BoardWeb.EditNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 529px;
            height: 92px;
        }
        .auto-style2 {
            width: 529px;
            height: 241px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/MNews.aspx">返回</asp:HyperLink>
            <table style="height: 249px" width="100%">
                <tr>
                    <td align="center" colspan="3" class="auto-style1">
                        <asp:TextBox ID="TitleStr" runat="server" Width="481px"></asp:TextBox><br />
                        <asp:Label ID="DateTimeTxt" runat="server" ForeColor="ForestGreen" Text="Label"></asp:Label>
                        <asp:Label ID="NameStr" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="3" valign="top" class="auto-style2">
                        <asp:TextBox ID="ContentTxt" runat="server" Height="214px" TextMode="MultiLine" Width="691px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="3" style="width: 529px; height: 62px">
                        <asp:Button ID="EditCmd" runat="server" OnClick="EditCmd_Click" Text="修改" /><br />
                    </td>
                </tr>
            </table>
        </div>
        <asp:Label ID="MsgTxt" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
