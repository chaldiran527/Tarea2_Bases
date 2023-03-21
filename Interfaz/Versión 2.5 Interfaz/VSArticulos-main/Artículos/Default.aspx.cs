using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace Artículos
{

    public partial class _Default : Page
    {
        SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-950G4NT;Initial Catalog=Prueba1;Persist Security Info=True;User ID=sa;Password=masterpass1");

        protected void Page_Load(object sender, EventArgs e)
        {
            this.GridView1.Attributes.Add("bordercolor","#000");
            this.GetListaDeArticulos();
        }

        protected void GetListaDeArticulos()
        {
            SqlCommand command = new SqlCommand();
            command.Connection = conexion;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "SP_Mostrar";

            command.Parameters.AddWithValue("inPatron", "");
            command.Parameters.AddWithValue("outResultCode", 0);
            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
            SqlDataAdapter sd = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)//boton cerrar
        {
            System.Environment.Exit(0);
        }

        protected void Button2_Click(object sender, EventArgs e)//boton insertar
        {
            Response.Redirect("Articulo_i.aspx");
        }

    }

}