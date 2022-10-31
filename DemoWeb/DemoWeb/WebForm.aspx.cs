using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoWeb
{
    public partial class WebForm : System.Web.UI.Page
    {
        
        const string CONN_STR = @"Data Source = LENSAKI; Initial Catalog = DemoWeb; Integrated Security = True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dataGV.DataBind();
            }
        }

        [WebMethod]
        public static string getValues(string username,string pass,string email)
        {
            
            return "Đã nhập: "+username +" "+pass+" "+email;
        }

        protected void add(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();
        }
        protected void update(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
        }

        protected void delete(object sender, EventArgs e)
        {
            SqlDataSource1.Delete();
        }

        protected void dataGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtTaiKhoan.Text = dataGV.SelectedRow.Cells[2].Text;
            txtPass.Text = dataGV.SelectedRow.Cells[3].Text;
            txtEmail.Text = dataGV.SelectedRow.Cells[4].Text;
        }

    }
}