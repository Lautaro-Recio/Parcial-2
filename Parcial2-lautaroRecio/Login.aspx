<%@ Page Title="Iniciar sesión - Asesoría Legal Global" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Parcial2_lautaroRecio.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formulario formulario-chico">
        <h2>Iniciar sesión</h2>

        <asp:Label ID="lblRegistro" runat="server" CssClass="mensaje ok" Visible="False"
            Text="Registro exitoso. Ya podés iniciar sesión."></asp:Label>

        <div class="campo">
            <span class="etiqueta">Nombre de usuario:</span>
            <asp:TextBox ID="txtUsuario" runat="server" placeholder="Nombre de usuario"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario"
                ErrorMessage="Debe ingresar el nombre de usuario" CssClass="validador" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="campo">
            <span class="etiqueta">Contraseña:</span>
            <asp:TextBox ID="txtClave" runat="server" TextMode="Password" placeholder="Contraseña"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvClave" runat="server" ControlToValidate="txtClave"
                ErrorMessage="Debe ingresar la contraseña" CssClass="validador" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="boton" OnClick="btnIngresar_Click" />
        <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje error"></asp:Label>

        <p class="enlace-alternativo">¿No tenés cuenta? <asp:HyperLink ID="hlRegistro" runat="server" NavigateUrl="~/Registro.aspx" Text="Registrate"></asp:HyperLink></p>
    </div>
</asp:Content>
