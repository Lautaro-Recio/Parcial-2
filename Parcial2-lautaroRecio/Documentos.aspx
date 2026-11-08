<%@ Page Title="Mis documentos - Asesoría Legal Global" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Documentos.aspx.cs" Inherits="Parcial2_lautaroRecio.Documentos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formulario formulario-ancho">
        <h2>Mis documentos legales</h2>
        <asp:Label ID="lblBienvenida" runat="server" CssClass="bienvenida"></asp:Label>

        <div class="subir">
            <span class="etiqueta">Subir un documento (PDF, Word, TXT, JPG o PNG - máximo 5 MB):</span>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="btnSubir" runat="server" Text="Subir documento" CssClass="boton" OnClick="btnSubir_Click" />
            <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje"></asp:Label>
        </div>

        <h3>Documentos guardados</h3>
        <div class="tabla-contenedor">
            <asp:GridView ID="gvArchivos" runat="server" AutoGenerateColumns="False" CssClass="grilla" GridLines="None"
                EmptyDataText="Todavía no subiste ningún documento." OnRowCommand="gvArchivos_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Nombre" />
                    <asp:TemplateField HeaderText="Tamaño">
                        <ItemTemplate>
                            <%# (Convert.ToInt64(Eval("Length")) / 1024.0).ToString("0.0") %> KB
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LastWriteTime" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDescargar" runat="server" CommandName="Descargar"
                                CommandArgument='<%# Eval("Name") %>' Text="Descargar" CssClass="accion"></asp:LinkButton>
                            <asp:LinkButton ID="lnkEliminar" runat="server" CommandName="Eliminar"
                                CommandArgument='<%# Eval("Name") %>' Text="Eliminar" CssClass="accion accion-eliminar"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
