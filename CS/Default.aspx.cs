using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebApplication1 {
    public partial class _Default : Page {
        protected void Page_Load(object sender, EventArgs e) { }
        protected void grid_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e) {
            BindGridToData();
        }
        private void BindGridToData() {
            string inStr = string.Empty;
            if (checkBoxList.Items.Count > 0) {
                for (int i = 0; i < checkBoxList.Items.Count; i++) {
                    if (checkBoxList.Items[i].Selected) {
                        string separator = string.Empty;
                        if (inStr != string.Empty) {
                            separator = ",";
                        }
                        inStr += separator + "'" + checkBoxList.Items[i].Value + "'";
                    }
                }
            }
            if (inStr != string.Empty) {
                SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString);
                SqlDataAdapter da = new SqlDataAdapter("SELECT [ProductName], [UnitPrice] FROM [Alphabetical list of products] WHERE [ProductID] IN (" + inStr + ")", cnn);
                DataSet ds = new DataSet();
                da.Fill(ds, "products");
                grid.DataSource = ds.Tables["products"].DefaultView;
            }
            grid.DataBind();
        }
    }
}