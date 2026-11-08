<%@ Page Title="Inicio - Asesoría Legal Global" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Parcial2_lautaroRecio._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="portada">
        <img src="Imagenes/logo3.png" alt="Asesoría Legal Global" class="portada-banner" />
        <h1>Asesoramiento legal de confianza</h1>
        <p>
            Somos un equipo de profesionales dedicados a acompañar a nuestros clientes en temas legales.
            Registrate para gestionar tus documentos legales de manera simple y segura.
        </p>

        <asp:Panel ID="pnlInvitado" runat="server" CssClass="portada-botones">
            <asp:HyperLink ID="hlRegistrarse" runat="server" NavigateUrl="~/Registro.aspx" CssClass="boton" Text="Registrarse"></asp:HyperLink>
            <asp:HyperLink ID="hlIngresar" runat="server" NavigateUrl="~/Login.aspx" CssClass="boton boton-secundario" Text="Iniciar sesión"></asp:HyperLink>
        </asp:Panel>

        <asp:Panel ID="pnlLogueado" runat="server" CssClass="portada-botones" Visible="False">
            <asp:HyperLink ID="hlMisDocumentos" runat="server" NavigateUrl="~/Documentos.aspx" CssClass="boton" Text="Ir a mis documentos"></asp:HyperLink>
        </asp:Panel>
    </section>

    <section class="servicios">
        <div class="tarjeta">
            <h3>Derecho civil</h3>
            <p>Contratos, sucesiones, reclamos y asesoramiento en general.</p>
        </div>
        <div class="tarjeta">
            <h3>Derecho laboral</h3>
            <p>Despidos, accidentes de trabajo y relaciones laborales.</p>
        </div>
        <div class="tarjeta">
            <h3>Derecho comercial</h3>
            <p>Constitución de sociedades y asesoramiento a empresas.</p>
        </div>
        <div class="tarjeta">
            <h3>Documentos seguros</h3>
            <p>Cada cliente tiene su propio espacio para subir sus documentos.</p>
        </div>
    </section>
</asp:Content>
