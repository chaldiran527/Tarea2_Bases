<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUD._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     
    <div style="padding:15px">

        <table class="nav-justified">
            <tr>
                <td style="height: 20px" colspan="2">
                    <asp:GridView ID="GridView1" runat="server" Width="768px">
                        <HeaderStyle BackColor="#666666" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="height: 20px">&nbsp;</td>
                <td style="height: 20px"></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button2" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" Text="Insertar" Width="200px" OnClick="Button2_Click"/>
                </td>
                <td>
                   <asp:Button ID="Button1" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" Text="Cerrar" Width="200px" OnClick="Button1_Click"/>
                </td>
            </tr>
            </table>

    </div>
</asp:Content>
