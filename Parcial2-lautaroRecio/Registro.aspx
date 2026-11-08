<%@ Page Title="Registro - Asesoría Legal Global" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Parcial2_lautaroRecio.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formulario">
        <h2>Registro de clientes</h2>
        <p class="aclaracion">Todos los campos son obligatorios.</p>

        <div class="campo">
            <span class="etiqueta">Correo electrónico:</span>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="ejemplo@correo.com"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="Debe ingresar el correo electrónico" Text="*" CssClass="validador" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ErrorMessage="El formato del correo electrónico no es válido" Text="*" CssClass="validador" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>

        <div class="campo">
            <span class="etiqueta">Nombre de usuario:</span>
            <asp:TextBox ID="txtUsuario" runat="server" MaxLength="20" placeholder="Letras, números o _"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario"
                ErrorMessage="Debe ingresar el nombre de usuario" Text="*" CssClass="validador" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revUsuario" runat="server" ControlToValidate="txtUsuario"
                ValidationExpression="^[a-zA-Z0-9_]{3,20}$"
                ErrorMessage="El usuario debe tener entre 3 y 20 letras, números o guion bajo" Text="*" CssClass="validador" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>

        <div class="campo">
            <span class="etiqueta">Edad:</span>
            <asp:TextBox ID="txtEdad" runat="server" MaxLength="3" placeholder="Edad"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEdad" runat="server" ControlToValidate="txtEdad"
                ErrorMessage="Debe ingresar la edad" Text="*" CssClass="validador" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="rvEdad" runat="server" ControlToValidate="txtEdad"
                Type="Integer" MinimumValue="16" MaximumValue="120"
                ErrorMessage="La edad debe ser un número y el usuario debe ser mayor de 15 años" Text="*" CssClass="validador" Display="Dynamic"></asp:RangeValidator>
        </div>

        <div class="campo">
            <span class="etiqueta">Contraseña:</span>
            <asp:TextBox ID="txtClave" runat="server" TextMode="Password" placeholder="Contraseña"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvClave" runat="server" ControlToValidate="txtClave"
                ErrorMessage="Debe ingresar la contraseña" Text="*" CssClass="validador" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="campo">
            <span class="etiqueta">Confirmar contraseña:</span>
            <asp:TextBox ID="txtConfirmar" runat="server" TextMode="Password" placeholder="Repita la contraseña"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvConfirmar" runat="server" ControlToValidate="txtConfirmar"
                ErrorMessage="Debe confirmar la contraseña" Text="*" CssClass="validador" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvClave" runat="server" ControlToValidate="txtConfirmar" ControlToCompare="txtClave"
                ErrorMessage="Las contraseñas no coinciden" Text="*" CssClass="validador" Display="Dynamic"></asp:CompareValidator>
        </div>

        <div class="campo">
            <span class="etiqueta">Nombre:</span>
            <asp:TextBox ID="txtNombre" runat="server" MaxLength="50" placeholder="Nombre"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre"
                ErrorMessage="Debe ingresar el nombre" Text="*" CssClass="validador" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="campo">
            <span class="etiqueta">Apellido:</span>
            <asp:TextBox ID="txtApellido" runat="server" MaxLength="50" placeholder="Apellido"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido"
                ErrorMessage="Debe ingresar el apellido" Text="*" CssClass="validador" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <asp:ValidationSummary ID="vsRegistro" runat="server" CssClass="resumen" HeaderText="Revise los siguientes datos:" />

        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="boton" OnClick="btnRegistrar_Click" />

        <p class="enlace-alternativo">¿Ya estás registrado? <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="~/Login.aspx" Text="Iniciar sesión"></asp:HyperLink></p>
    </div>
</asp:Content>
