<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="articulo_i.aspx.cs" Inherits="CRUD.Vista.articulo_i" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding:15px">
        <table class="nav-justified">
            <tr>
                <td colspan="2" style="font-size: large; font-weight: bold; color: #FFFFFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Insertar Artículo</td>
            </tr>
            <tr>
                <td style="height: 20px; width: 462px;">
                    <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="Nombre" ForeColor="White"></asp:Label>
                </td>
                <td style="height: 20px">
                    <asp:TextBox ID="TextBox1" placeholder="Nombre" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 462px">
                    <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text="Precio" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" placeholder="Precio" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="font-size: medium; color: #FFFFFF; height: 18px; width: 462px;">
                    Clase</td>
                <td style="height: 17px">&nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownListClaseArticulo" runat="server" OnSelectedIndexChanged="DropDownListClaseAritculo_ListSelected" Height="31px" style="margin-left: 0" Width="198px">
                        <asp:ListItem value="Ebanistería">Ebanistería</asp:ListItem>
                        <asp:ListItem value="Electrico">Eléctrico</asp:ListItem>
                        <asp:ListItem Value="Plomería">Plomería</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="height: 20px; width: 462px;"></td>
                <td style="height: 20px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 462px">
                    <asp:Button ID="Button2" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" Text="Insertar" Width="200px" OnClick="Button2_Click" />
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" Text="Cerrar" Width="200px" OnClick="Button1_Click" />
                </td>
            </tr>
            
        </table>
    </div>
</asp:Content>
