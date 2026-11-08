using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial2_lautaroRecio
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack == false)
            {
                if (this.Request.QueryString["registro"] == "ok")
                {
                    lblRegistro.Visible = true;
                }
                if (this.Session["usuario"] != null)
                {
                    this.txtUsuario.Text = this.Session["usuario"].ToString();
                }
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            lblRegistro.Visible = false;

            if (this.IsValid)
            {
                if (this.Session["usuario"] == null || this.Request.Cookies["clave"] == null)
                {
                    lblMensaje.Text = "No hay ningún usuario registrado. Primero debe registrarse.";
                    return;
                }

                // Compara el usuario con la sesion y la clave con la cookie
                string usuario = this.Session["usuario"].ToString();
                string clave = this.Request.Cookies["clave"].Value;

                if (this.txtUsuario.Text == usuario && this.txtClave.Text == clave)
                {
                    this.Session["logueado"] = "si";
                    this.Response.Redirect("Documentos.aspx");
                }
                else
                {
                    lblMensaje.Text = "Usuario o contraseña incorrectos.";
                }
            }
        }
    }
}
