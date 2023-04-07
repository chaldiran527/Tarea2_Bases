<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUD._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     
    <div style="background-image: url('https://app.globalradar.com/Images/login-background.jpg'); background-repeat: repeat; background-attachment: fixed;">

        <table class="nav-justified" style="margin-left:auto; margin-right:auto; width:400px;">
            <tr>
                <td style="height: 20px; width: 384px; border-bottom: 5px double #213a5c;"></td>
                <td style="height: 20px; border-bottom: 5px double #213a5c;"></td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 384px; height: 30px; border-left: 3px double #213a5c;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBoxName" placeholder="Nombre" runat="server" Font-Size="Medium" Width="155px"></asp:TextBox>
                </td>
                <td style="height: 30px; border-right: 3px double #213a5c;">

                    <br />
&nbsp;<input type="submit" runat="server" value="Filtrar x Nombre" style="width: 154px; margin-left: 17;"  onserverclick="ButtonNombre_Click"/></td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 384px; border-left: 3px double #213a5c;">
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBoxAmmount" placeholder="Cantidad" runat="server" Font-Size="Medium" Width="155px" OnTextChanged="ValidarTexto" AutoPostBack="true"></asp:TextBox>
                </td>
                <td style="border-right: 3px double  #213a5c;">
                    <br />
                    &nbsp;<input type="submit" id="ButtonCant" runat="server" value="Filtrar x Cantidad" style="width: 154px; margin-left: 17;"  onserverclick="ButtonCant_Click"/></td>
            </tr>   
            <tr>
                <td class="modal-sm" style="width: 384px; border-left: 3px double #213a5c;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownListClaseArticulo" runat="server" OnSelectedIndexChanged="DropDownListClaseAritculo_ListSelected" Height="20px" style="margin-left: 0" Width="150px">
                  
                        <asp:ListItem value="Ebanisteria">Ebanistería</asp:ListItem>
                        <asp:ListItem value="Electricos">Eléctrico</asp:ListItem>
                        <asp:ListItem Value="Plomeria">Plomería</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="border-right: 3px double #213a5c;">
                    <br />
                    &nbsp;<input type="submit" runat="server" value="Filtrar x Clase" style="width: 154px; margin-left: 17;"  onserverclick="ButtonClase_Click"/>
                </td>
            </tr>
            <tr>
                <td style="height: 20px; width: 384px; border-left: 3px double #213a5c;"></td>
                <td style="height: 20px;border-right: 3px double #213a5c;"></td>
            </tr>
            <tr>
                <td style="height: 20px; width: 384px; border-left: 3px double #213a5c; ">&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button4" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" Text="Insertar" Width="177px" OnClick="Button2_Click"/>
                    &nbsp;</td>
                <td style="height: 20px; border-right: 3px double #213a5c; " >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button3" runat="server" BackColor="#333333" Font-Bold="True" ForeColor="White" Text="Salir" Width="177px" OnClick="Button1_Click"/>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="height: 20px; width: 384px; border-left: 3px double #213a5c; border-bottom: 5px double #213a5c;"></td>
                <td style="height: 20px; border-right: 3px double #213a5c; border-bottom: 5px double #213a5c;"></td>
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
