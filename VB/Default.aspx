<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebApplication1._Default" %>

<%@ Register Assembly="DevExpress.Web.v8.2, Version=8.2.2.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1"
	Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v8.2, Version=8.2.2.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v8.2, Version=8.2.2.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
<td style="width: 150px">

						<dxe:ASPxButton ID="btnShowPopup" runat="server" 
			Text="Show Popup" AutoPostBack="False">
						<ClientSideEvents Click="function(s, e) {  popup.Show(); }" />
		 </dxe:ASPxButton>
					 <dxwgv:ASPxGridView ID="grid" runat="server" 
			oncustomcallback="grid_CustomCallback" AutoGenerateColumns="False" >
						 <Columns>
							 <dxwgv:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="0">
							 </dxwgv:GridViewDataTextColumn>
							 <dxwgv:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="1">
							 </dxwgv:GridViewDataTextColumn>
						 </Columns>
					</dxwgv:ASPxGridView>

					   <dxpc:ASPxPopupControl ID="popup" runat="server">
						   <ContentCollection>
<dxpc:PopupControlContentControl runat="server">
	<asp:CheckBoxList ID="checkBoxList" runat="server" 
		DataSourceID="SqlDataSource1" DataTextField="ProductName" 
		DataValueField="ProductID">
	</asp:CheckBoxList>
	&nbsp;
	<dxe:ASPxButton ID="btnShowInGrid" runat="server" Text="Show in Grid and Close popup" 
		AutoPostBack="False">
		<ClientSideEvents Click="function(s, e) {  popup.Hide(); grid.PerformCallback();}" />
	</dxe:ASPxButton>
							   </dxpc:PopupControlContentControl>
</ContentCollection>
		</dxpc:ASPxPopupControl>

							<asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 


			SelectCommand="SELECT [ProductID],[ProductName] FROM [Alphabetical list of products] WHERE ([UnitPrice] &gt; @UnitPrice) ORDER BY [ProductName]">
								<SelectParameters>
									<asp:Parameter DefaultValue="50" Name="UnitPrice" Type="Decimal" />
								</SelectParameters>
					</asp:SqlDataSource>


					   </td>

	</div>
	</form>
</body>
</html>