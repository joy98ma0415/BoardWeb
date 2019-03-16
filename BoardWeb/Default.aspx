<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BoardWeb.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        <%=System.Configuration.ConfigurationSettings.AppSettings["SiteName"]%>
    </title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="TopTxt" runat="server" Text="Label" Width="100%"></asp:Label><br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddNews.aspx">添加消息</asp:HyperLink>
        &nbsp;
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/MLogin.aspx">管理登入</asp:HyperLink><br />
        <br />
        <asp:GridView ID="NewsGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
            CellPadding="4" ForeColor="Black" GridLines="Vertical" PageSize="5" Width="100%" OnPageIndexChanging="NewsGrid_PageIndexChanging">
            <FooterStyle BackColor="#CCCC99" />
            <Columns>
                <asp:BoundField DataField="NewsType" HeaderText="消息分類" />
                <asp:BoundField DataField="TitleStr" HeaderText="消息標題" />
                <asp:BoundField DataField="NameStr" HeaderText="發布人" />
                <asp:BoundField DataField="DateTimeTxt" HeaderText="發布日期" />
            </Columns>
            <RowStyle BackColor="#F7F7DE" Font-Size="Smaller" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>