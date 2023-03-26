<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUD._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     
    <div style="background-image: url('https://app.globalradar.com/Images/login-background.jpg')">

        <table class="nav-justified" style="margin-left:auto; margin-right:auto; width:400px;">
            <tr>
                <td style="height: 20px; width: 384px;"></td>
                <td style="height: 20px"></td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 384px; height: 30px;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBoxName" placeholder="Nombre" runat="server" Font-Size="Medium" Width="155px"></asp:TextBox>
                </td>
                <td style="height: 30px">

                    <br />
&nbsp;<input type="submit" runat="server" value="Filtrar x Nombre" style="width: 154px; margin-left: 17;"/></td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 384px">
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBoxAmmount" placeholder="Cantidad" runat="server" Font-Size="Medium" Width="155px"></asp:TextBox>
                </td>
                <td>
                    <br />
                    &nbsp;<input type="submit" runat="server" value="Filtrar x Cantidad" style="width: 154px; margin-left: 17;"/></td>
            </tr>   
            <tr>
                <td class="modal-sm" style="width: 384px">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBoxClass" placeholder="Clase" runat="server" Font-Size="Medium" Width="155px"></asp:TextBox>
                </td>
                <td>
                    <br />
                    &nbsp;<input type="submit" runat="server" value="Filtrar x Clase" style="width: 154px; margin-left: 17;"/>
                </td>
            </tr>
            <tr>
                <td style="height: 20px; width: 384px;"></td>
                <td style="height: 20px"></td>
            </tr>
            <tr>
                <td style="height: 20px; width: 384px;">&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button4" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" Text="Insertar" Width="177px" OnClick="Button2_Click"/>
                    &nbsp;</td>
                <td style="height: 20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Button ID="Button3" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" Text="Salir" Width="177px" OnClick="Button1_Click"/>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="height: 20px; width: 384px;"></td>
                <td style="height: 20px"></td>
            </tr>
            <tr>
                <td style="height: 20px" colspan="2">
                    <asp:GridView ID="GridView1" runat="server" Width="768px">
                        <HeaderStyle BackColor="#666666" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="height: 20px; width: 384px;">&nbsp;</td>
                <td style="height: 20px"></td>
            </tr>
            </table>

    </div>
       <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</asp:Content>
