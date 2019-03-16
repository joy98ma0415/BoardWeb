<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MLogin.aspx.cs" Inherits="BoardWeb.MLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="管理登入" Width="181px"></asp:Label>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">返回首頁</asp:HyperLink><br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label>
            <asp:TextBox ID="UserNameStr" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="密碼：" Width="101px"></asp:Label>
            <asp:TextBox ID="PassWordStr" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="LoginCmd" runat="server" Text="登入" OnClick="LoginCmd_Click" /><br />
            <br />
            <asp:Label ID="MsgTxt" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>