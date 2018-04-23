using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default: System.Web.UI.Page {
        protected void grid_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e) {
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