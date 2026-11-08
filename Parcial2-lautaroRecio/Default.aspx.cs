using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial2_lautaroRecio
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["logueado"] == null)
            {
                pnlInvitado.Visible = true;
                pnlLogueado.Visible = false;
            }
            else
            {
                pnlInvitado.Visible = false;
                pnlLogueado.Visible = true;
            }
        }
    }
}
