<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageLog.aspx.cs" Inherits="CRUD.PageLog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link href="Content/bootstrap-reboot.min.css" rel="stylesheet" /> 
    <link href="StyleSheet1.css" rel="stylesheet"/>
</head>
<body style="background-image: url('https://i.pinimg.com/originals/3d/14/64/3d1464dca89fdf3d9b8366abaf8411cf.jpg')">
    <form id="form1" runat="server">
        <div class="container">
            <form>
                <h4>Log in</h4>
                <div class="nombre">
                    <input type="nombre" id="nameBox"  placeholder="Nombre" runat="server"/>
                    <ion-icon name="person-outline"></ion-icon>
                </div>
                <div class="password">
                    <input type="password" id="passwordBox" placeholder="Contraseña" runat="server"/>
                    <ion-icon name="lock-closed-outline"></ion-icon>
                </div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" runat="server" onserverclick="LogButton_Click" value="Log in" style="width: 58px"/>
            </form>
        </div>
    </form>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
