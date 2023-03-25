using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD.Vista
{
    public partial class articulo_s : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) this.GetListaDeArticulos();
        }

        SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-QJBOA1G;Initial Catalog=DefaultBase;Integrated Security=True");
        void GetListaDeArticulos()
        {
            SqlCommand command = new SqlCommand("Select * from Articulo order by nombre", conexion);
            SqlDataAdapter sd = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("articulo_i.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            System.Environment.Exit(0);
        }

    }
}