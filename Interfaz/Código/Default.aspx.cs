using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetListaDeArticulos();
            }
        }


        protected void Button2_Click(object sender, EventArgs e)//boton insertar
        {
            Response.Redirect("articulo_i.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)//boton cerrar
        {
            System.Environment.Exit(0);
        }


        SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-38G492P;Initial Catalog=Prueba1;Integrated Security=True");

        void GetListaDeArticulos()
        {
            SqlCommand command = new SqlCommand("EXECUTE ShowData1", conexion);
            SqlDataAdapter sd = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }


    }
}