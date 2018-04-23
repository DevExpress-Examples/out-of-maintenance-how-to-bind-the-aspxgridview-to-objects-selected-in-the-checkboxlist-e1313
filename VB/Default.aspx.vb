Imports System
Imports System.Collections.Generic
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class _Default
    Inherits System.Web.UI.Page

        Protected Sub grid_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewCustomCallbackEventArgs)
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