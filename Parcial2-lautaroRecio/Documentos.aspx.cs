using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial2_lautaroRecio
{
    public partial class Documentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Si no inicio sesion vuelve al login
            if (this.Session["logueado"] == null)
            {
                this.Response.Redirect("Login.aspx");
                return;
            }

            lblBienvenida.Text = "Bienvenido/a " + this.Session["nombre"] + ". Este es tu espacio personal: "
                + this.Session["usuario"];

            if (this.IsPostBack == false)
            {
                CargarArchivos();
            }
        }

        // Carpeta del usuario dentro de App_Data
        private string CarpetaUsuario()
        {
            string carpeta = this.Server.MapPath("~/App_Data/Documentos/" + this.Session["usuario"]);
            if (Directory.Exists(carpeta) == false)
            {
                Directory.CreateDirectory(carpeta);
            }
            return carpeta;
        }

        private void CargarArchivos()
        {
            DirectoryInfo directorio = new DirectoryInfo(CarpetaUsuario());
            gvArchivos.DataSource = directorio.GetFiles().OrderByDescending(f => f.LastWriteTime);
            gvArchivos.DataBind();
        }

        protected void btnSubir_Click(object sender, EventArgs e)
        {
            if (this.FileUpload1.HasFile == false)
            {
                MostrarMensaje("Seleccione un archivo para subir.", false);
                return;
            }

            string nombre = Path.GetFileName(this.FileUpload1.FileName);
            string extension = Path.GetExtension(nombre).ToLower();
            string[] permitidas = { ".pdf", ".doc", ".docx", ".txt", ".jpg", ".jpeg", ".png" };

            if (permitidas.Contains(extension) == false)
            {
                MostrarMensaje("Tipo de archivo no permitido. Solo PDF, Word, TXT, JPG o PNG.", false);
                return;
            }
            if (this.FileUpload1.PostedFile.ContentLength > 5 * 1024 * 1024)
            {
                MostrarMensaje("El archivo supera los 5 MB.", false);
                return;
            }

            string ruta = CarpetaUsuario() + "/" + nombre;
            if (File.Exists(ruta))
            {
                MostrarMensaje("Ya existe un documento con ese nombre en tu espacio.", false);
                return;
            }

            this.FileUpload1.SaveAs(ruta);
            MostrarMensaje("Documento subido: " + nombre + " ("
                + (this.FileUpload1.PostedFile.ContentLength / 1024.0).ToString("0.0") + " KB)", true);
            CargarArchivos();
        }

        protected void gvArchivos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string nombre = Path.GetFileName(e.CommandArgument.ToString());
            string ruta = CarpetaUsuario() + "/" + nombre;

            if (File.Exists(ruta) == false)
            {
                MostrarMensaje("El documento ya no existe.", false);
                CargarArchivos();
                return;
            }

            if (e.CommandName == "Descargar")
            {
                this.Response.Clear();
                this.Response.ContentType = "application/octet-stream";
                this.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + nombre + "\"");
                this.Response.TransmitFile(ruta);
                this.Response.End();
            }
            else if (e.CommandName == "Eliminar")
            {
                File.Delete(ruta);
                MostrarMensaje("Se eliminó el documento " + nombre + ".", true);
                CargarArchivos();
            }
        }

        private void MostrarMensaje(string texto, bool ok)
        {
            lblMensaje.Text = texto;
            lblMensaje.CssClass = ok ? "mensaje ok" : "mensaje error";
        }
    }
}
