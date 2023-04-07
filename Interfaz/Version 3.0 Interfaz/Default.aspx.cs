using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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

        protected void ValidarTexto(object sender, EventArgs e)
        {
            if ((int.TryParse(TextBoxAmmount.Text, out int value)) || string.IsNullOrWhiteSpace(TextBoxAmmount.Text))
            {
                ButtonCant.Disabled = false;
            }
            else {//Se deshabilita el boton
                ButtonCant.Disabled = true;
            }
        }

        protected void DropDownListClaseAritculo_ListSelected(object sender, EventArgs e)
        {
            if (DropDownListClaseArticulo.SelectedItem.Text == "Clase de Articulo")
            {
                DropDownListClaseArticulo.Items[0].Enabled = false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)//boton insertar
        {
            Response.Redirect("articulo_i.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)//boton cerrar
        {
            string ipActual = Request.UserHostAddress;
            SqlCommand command = new SqlCommand();
            DateTime fechaActual = DateTime.Now;
            string nombreUsuario = HttpContext.Current.User.Identity.Name;
            command.Connection = conexion;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "SP_Logout";

            command.Parameters.AddWithValue("inNombre", nombreUsuario);
            command.Parameters.AddWithValue("inIP", ipActual);
            command.Parameters.AddWithValue("inTime", fechaActual);
            command.Parameters.AddWithValue("outResultCode", 0);

            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
            FormsAuthentication.SignOut();
            Response.Redirect("PageLog.aspx");
        }

        protected void ButtonNombre_Click(object sender, EventArgs e)//boton cerrar
        {
            SqlCommand command = new SqlCommand();
            string filtroNombre = TextBoxName.Text;
            string nombreUsuario = HttpContext.Current.User.Identity.Name;
            string ipActual = Request.UserHostAddress;
            DateTime fechaActual = DateTime.Now;

            command.Connection = conexion;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "SP_FiltrarNombre";


            command.Parameters.AddWithValue("inFiltroNombre", filtroNombre);
            command.Parameters.AddWithValue("inUserName", nombreUsuario);
            command.Parameters.AddWithValue("inIP", ipActual);
            command.Parameters.AddWithValue("inTime", fechaActual);
            command.Parameters.AddWithValue("outResultCode", 0);
            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
            SqlDataAdapter sd = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();


            TextBoxAmmount.Text = "";
            TextBoxName.Text = "";
        }

        protected void ButtonClase_Click(object sender, EventArgs e)//boton cerrar
        {

            Usuario user = new Usuario(Request.UserHostAddress);
            string ipActual = Request.UserHostAddress;

            SqlCommand command = new SqlCommand();
            string nombreFiltroClase = DropDownListClaseArticulo.SelectedValue;
            DateTime fechaActual = DateTime.Now;
            int idUsuario = user.getUserId();
            string nombreUsuario = HttpContext.Current.User.Identity.Name;
            command.Connection = conexion;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "SP_SeleccionarClaseArt";

            command.Parameters.AddWithValue("inClaseArticulo", nombreFiltroClase);//Y
            command.Parameters.AddWithValue("inUserName", nombreUsuario);//N
            command.Parameters.AddWithValue("inIP", ipActual);//M
            command.Parameters.AddWithValue("inTime", fechaActual);//Y
            command.Parameters.AddWithValue("outResultCode", 0);//Y
            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
            SqlDataAdapter sd = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();


            TextBoxAmmount.Text = "";
            TextBoxName.Text = "";
        }

        protected void ButtonCant_Click(object sender, EventArgs e)//boton cerrar
        {
            DateTime fechaActual = DateTime.Now;
            string ipActual = Request.UserHostAddress;
            string nombreUsuario = HttpContext.Current.User.Identity.Name;
            double filtroCantidad = 0;
            if (int.TryParse(TextBoxAmmount.Text, out int value)) //Se verifica que el valor del textboxAmmount es un numero valido
            {////En caso de ser un numero valido asignarle el valor en double a la variable filtroCantidad
                filtroCantidad = double.Parse(TextBoxAmmount.Text);
            }

            SqlCommand command = new SqlCommand();

            command.Connection = conexion;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "SP_SeleccionarCantidad";
            command.Parameters.AddWithValue("inCantidad", filtroCantidad);//Y
            command.Parameters.AddWithValue("inUserName", nombreUsuario);//N
            command.Parameters.AddWithValue("inIP", ipActual);//M
            command.Parameters.AddWithValue("inTime", fechaActual);//Y
            command.Parameters.AddWithValue("outResultCode", 0);//Y
            conexion.Open();
            command.ExecuteNonQuery();
            conexion.Close();
            SqlDataAdapter sd = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            TextBoxAmmount.Text = "";
            TextBoxName.Text = "";
        }


        SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-38G492P;Initial Catalog=SegundaTarea3;Integrated Security=True");

        void GetListaDeArticulos()
        {
            SqlCommand command = new SqlCommand();
            string inPatron = "";

            command.Connection = conexion;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "SP_ListarArticulos";

            command.Parameters.AddWithValue("inPatron", inPatron);
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


    }
}