Imports Microsoft.VisualBasic
Imports System
Imports System.Web.UI
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data

Namespace WebApplication1
	Partial Public Class _Default
		Inherits Page
		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		End Sub
		Protected Sub grid_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs)
			BindGridToData()
		End Sub
		Private Sub BindGridToData()
			Dim inStr As String = String.Empty
			If checkBoxList.Items.Count > 0 Then
				For i As Integer = 0 To checkBoxList.Items.Count - 1
					If checkBoxList.Items(i).Selected Then
						Dim separator As String = String.Empty
						If inStr <> String.Empty Then
							separator = ","
						End If
						inStr &= separator & "'" & checkBoxList.Items(i).Value & "'"
					End If
				Next i
			End If
			If inStr <> String.Empty Then
				Dim cnn As New SqlConnection(ConfigurationManager.ConnectionStrings("NorthwindConnectionString").ConnectionString)
				Dim da As New SqlDataAdapter("SELECT [ProductName], [UnitPrice] FROM [Alphabetical list of products] WHERE [ProductID] IN (" & inStr & ")", cnn)
				Dim ds As New DataSet()
				da.Fill(ds, "products")
				grid.DataSource = ds.Tables("products").DefaultView
			End If
			grid.DataBind()
		End Sub
	End Class
End Namespace