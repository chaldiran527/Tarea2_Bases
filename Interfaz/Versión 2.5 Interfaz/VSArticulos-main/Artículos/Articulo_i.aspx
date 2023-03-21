<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Articulo_i.aspx.cs" Inherits="Artículos.Articulo_i" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div style="padding:15px">
        <table class="nav-justified">
            <tr>
                <td colspan="2" style="font-size: large; font-weight: bold; color: #333333">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Insertar Artículo</td>
            </tr>
            <tr>
                <td style="height: 20px">
                    <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="Nombre"></asp:Label>
                </td>
                <td style="height: 20px">
                    <asp:TextBox ID="TextBox1" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text="Precio"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button2" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" Text="Insertar" Width="200px" OnClick="Button2_Click" />
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" Text="Cerrar" Width="200px" OnClick="Button1_Click" />
                </td>
            </tr>
            
        </table>
    </div>
</asp:Content>
