using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial2_lautaroRecio
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Muestra los links segun si esta logueado
            if (this.Session["logueado"] == null)
            {
                hlRegistro.Visible = true;
                hlLogin.Visible = true;
                hlDocumentos.Visible = false;
                lblUsuario.Visible = false;
                lnkCerrar.Visible = false;
            }
            else
            {
                hlRegistro.Visible = false;
                hlLogin.Visible = false;
                hlDocumentos.Visible = true;
                lblUsuario.Visible = true;
                lblUsuario.Text = "Hola, " + this.Session["usuario"];
                lnkCerrar.Visible = true;
            }
        }

        protected void lnkCerrar_Click(object sender, EventArgs e)
        {
            this.Session.Remove("logueado");
            this.Response.Redirect("Login.aspx");
        }
    }
}
