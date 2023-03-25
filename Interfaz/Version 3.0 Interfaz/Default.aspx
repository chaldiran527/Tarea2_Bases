<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUD._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     
    <div style="background-image: url('https://app.globalradar.com/Images/login-background.jpg')">

        <table class="nav-justified" style="margin-left:auto; margin-right:auto; width:600px;">
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
                <td style="height: 20px">&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button4" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" Text="Insertar" Width="200px" OnClick="Button2_Click"/>
                    &nbsp;</td>
                <td style="height: 20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:Button ID="Button3" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" Text="Cerrar" Width="200px" OnClick="Button1_Click"/>
                    &nbsp;</td>
            </tr>
            </table>

    </div>
</asp:Content>
