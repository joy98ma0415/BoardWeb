<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MNews.aspx.cs" Inherits="BoardWeb.MNews" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="TopTxt" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:Button ID="MExit" runat="server" OnClick="MExit_Click" Text="退出管理" /><br />
            <br />
            <asp:GridView ID="NewsGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                CellPadding="4" ForeColor="Black" GridLines="Vertical" OnPageIndexChanging="NewsGrid_PageIndexChanging"
                PageSize="5" Width="100%" DataKeyNames="NewsID" OnRowCommand="NewsGrid_RowCommand">
                <FooterStyle BackColor="#CCCC99" />
                <Columns>
                    <asp:BoundField DataField="NewsType" HeaderText="新聞分類" />
                    <asp:HyperLinkField DataNavigateUrlFields="NewsID" DataNavigateUrlFormatString="ViewNews.aspx?NewsID={0}"
                        DataTextField="TitleStr" HeaderText="新聞主題" Target="_blank" />
                    <asp:BoundField DataField="NameStr" HeaderText="發布人" />
                    <asp:BoundField DataField="DateTimeTxt" HeaderText="發布日期" />
                    <asp:HyperLinkField DataNavigateUrlFields="NewsID" HeaderText="修改新聞" Text="修改" DataNavigateUrlFormatString="EditNews.aspx?NewsID={0}" />
                    <asp:TemplateField HeaderText="删除新闻" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("NewsID") %>' CommandName="DelCmd" OnClientClick="return confirm('您確定要刪除嗎？');">删除</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="#F7F7DE" Font-Size="Smaller" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            &nbsp;
        </div>
    </form>
</body>
</html>