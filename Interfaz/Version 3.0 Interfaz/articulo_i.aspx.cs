﻿using System;
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
    public partial class articulo_i : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Hilera de conexion al sql server 
        SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-38G492P;Initial Catalog=SegundaTarea3;Integrated Security=True");

        protected void DropDownListClaseAritculo_ListSelected(object sender, EventArgs e)
        {
            if (DropDownListClaseArticulo.SelectedItem.Text == "Clase de Articulo")
            {
                DropDownListClaseArticulo.Items[0].Enabled = false;
            }
        }
        protected void Button2_Click(object sender, EventArgs e)//boton insertar
        {

            string nombreArticulo = TextBox1.Text;//Se asigna la hilera en el textbox a la variable nombreArticulo
            string claseArticulo = DropDownListClaseArticulo.SelectedValue;
            string nombreUsuario = HttpContext.Current.User.Identity.Name;
            string ipActual = Request.UserHostAddress;
            DateTime fechaActual = DateTime.Now;
            double precioArticulo = 0;//Valor en cero como default  
            if (double.TryParse(TextBox2.Text, out double value)) //Se verifica que el valor del textbox2 es un numero valido
            {////En caso de ser un numero valido asignarle el valor en double a la variable precioArticulo
                precioArticulo = double.Parse(TextBox2.Text);
            }

            //Se inicia la conexion del comando sql para hacer la insercion del nombre y precio 
            SqlCommand command = new SqlCommand();
            command.Connection = conexion;//Se le asigna la hilera conexion
            command.CommandType = CommandType.StoredProcedure;//Asigna el tipo de comando store procedure
            command.CommandText = "SP_InsertarArticulo";//Nombre del store procedure para insertar

            command.Parameters.AddWithValue("inNombre", nombreArticulo);
            command.Parameters.AddWithValue("inPrecio", precioArticulo);
            command.Parameters.AddWithValue("inClaseArticulo", claseArticulo);
            command.Parameters.AddWithValue("inUserName", nombreUsuario);
            command.Parameters.AddWithValue("inIP", ipActual);
            command.Parameters.AddWithValue("inTime", fechaActual);
            command.Parameters.AddWithValue("outResultCode",0);

            conexion.Open();//Se abre la conexion 
            command.Parameters[6].Direction = ParameterDirection.Output;//Al parametro 3 se le apunta para retornar una salida
            command.ExecuteNonQuery();//Se ejecuta el query del store procedure
            //Se convierte de 'value' a string para facilitar el procesamiento y verificacion del codigo de salida del store procedure
            String resultCode = Convert.ToString(command.Parameters[6].Value);
            conexion.Close();//Se cierra la conexion

            //Mensajes a desplegar en la pantalla del tipo de insercion realizado
            string strInsertOk = "alert('Inserción exitosa!');";
            string[] strInsertErrors = new string[] { "alert('Artículo solo debe contener caracteres alfabéticos o guiones!');", "alert('Artículo ya existe!');", "alert('Ingrese un nombre por favor!')", "alert('Valor monetario invalido!')", "alert('Insercion fallida!')" };

            //Se imprimen en el navegador web los mensajes respecto al outputcode de salida del store procedure
            if (resultCode == "0") ScriptManager.RegisterStartupScript(this, this.GetType(), "script", strInsertOk, true);
            else if (resultCode == "50001") ScriptManager.RegisterStartupScript(this, this.GetType(), "script", strInsertErrors[0], true);
            else if (resultCode == "50002") ScriptManager.RegisterStartupScript(this, this.GetType(), "script", strInsertErrors[1], true);
            else if (resultCode == "50003") ScriptManager.RegisterStartupScript(this, this.GetType(), "script", strInsertErrors[2], true);
            else if (resultCode == "50004") ScriptManager.RegisterStartupScript(this, this.GetType(), "script", strInsertErrors[3], true);
            else if (resultCode == "50005") ScriptManager.RegisterStartupScript(this, this.GetType(), "script", strInsertErrors[4], true);

            TextBox1.Text = "";
            TextBox2.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)//boton cerrar
        {
            Response.Redirect("Default.aspx");//Se redirige a la ventana default principal del programa 
        }
    }
}