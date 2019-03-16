<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNews.aspx.cs" Inherits="BoardWeb.AddNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%=System.Configuration.ConfigurationManager.AppSettings["SiteName"]%>
    </title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">返回首頁</asp:HyperLink>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="消息類別"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="NewsType" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="消息主題"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TitleStr" runat="server"></asp:TextBox>&nbsp;<br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="發布人"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="NameStr"
                runat="server"></asp:TextBox>
            <br />
            <br />
            &nbsp;<asp:Label ID="Label3" runat="server" Text="消息內容"></asp:Label>&nbsp;&nbsp; <asp:TextBox
                ID="ContentTxt" runat="server" Height="206px" TextMode="MultiLine" Width="735px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="CmdAdd" runat="server" OnClick="CmdAdd_Click" Text="發布消息" /><br />
            <br />
            <asp:Label ID="MsgTxt" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>