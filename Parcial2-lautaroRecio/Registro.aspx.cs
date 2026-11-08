using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial2_lautaroRecio
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                // La contraseña se guarda en una cookie
                HttpCookie cookie1 = new HttpCookie("clave", this.txtClave.Text);
                cookie1.HttpOnly = true;
                this.Response.Cookies.Add(cookie1);

                // El nombre de usuario se guarda en una variable de sesion
                this.Session["usuario"] = this.txtUsuario.Text;
                this.Session["nombre"] = this.txtNombre.Text + " " + this.txtApellido.Text;
                this.Session["email"] = this.txtEmail.Text;
                this.Session.Remove("logueado");

                this.Response.Redirect("Login.aspx?registro=ok");
            }
        }
    }
}
