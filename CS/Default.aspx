<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxButton ID="btnShowPopup" runat="server"
            Text="Show Popup" AutoPostBack="False">
            <ClientSideEvents Click="function(s, e) {  popup.Show(); }" />
        </dx:ASPxButton>
        <dx:ASPxGridView ID="grid" runat="server"
            OnCustomCallback="grid_CustomCallback" AutoGenerateColumns="False">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>

        <dx:ASPxPopupControl ID="popup" runat="server">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <asp:CheckBoxList ID="checkBoxList" runat="server"
                        DataSourceID="SqlDataSource1" DataTextField="ProductName"
                        DataValueField="ProductID">
                    </asp:CheckBoxList>
                    &nbsp;
                  <dx:ASPxButton ID="btnShowInGrid" runat="server" Text="Show in Grid and Close popup"
                      AutoPostBack="False">
                      <ClientSideEvents Click="function(s, e) {  popup.Hide(); grid.PerformCallback();}" />
                  </dx:ASPxButton>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
            SelectCommand="SELECT [ProductID],[ProductName] FROM [Alphabetical list of products] WHERE ([UnitPrice] &gt; @UnitPrice) ORDER BY [ProductName]">
            <SelectParameters>
                <asp:Parameter DefaultValue="50" Name="UnitPrice" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>



    </form>
</body>
</html>
