﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD
{
    public partial class PageLog : System.Web.UI.Page
    {

        SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-38G492P;Initial Catalog=PruebaConcepto;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void LogButton_Click(object sender, EventArgs e)//boton cerrar
        {
            String userName = Convert.ToString(nameBox.Value);
            String passWord = Convert.ToString(passwordBox.Value);

            SqlCommand command = new SqlCommand();

            command.Connection = conexion;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "SP_VerificarUsuario";

            command.Parameters.AddWithValue("inNombre", userName);
            command.Parameters.AddWithValue("inContraseña", passWord);
            command.Parameters.AddWithValue("outResultCode", 0);

            conexion.Open();//Se abre la conexion 
            command.Parameters[2].Direction = ParameterDirection.Output;//Al parametro 3 se le apunta para retornar una salida
            command.ExecuteNonQuery();//Se ejecuta el query del store procedure
            String resultCode = Convert.ToString(command.Parameters[2].Value);
            conexion.Close();//Se cierra la conexion

            string[] strInsertErrors = new string[] { "alert('Le falta ingresar el nombre de usuario');", "alert('Le falta ingresar la contraseña del usuario');", "alert('Combinación de usuario/password no existe en la Base de Datos');" };
            if (resultCode == "0") Response.Redirect("Default.aspx");
            else if (resultCode == "50001") ScriptManager.RegisterStartupScript(this, this.GetType(), "script", strInsertErrors[0], true);
            else if (resultCode == "50002") ScriptManager.RegisterStartupScript(this, this.GetType(), "script", strInsertErrors[1], true);
            else if (resultCode == "50003") ScriptManager.RegisterStartupScript(this, this.GetType(), "script", strInsertErrors[2], true);
 
            //else if

        }
    }
}