<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Book_Store.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HyperLink ID="homeLink" runat="server" NavigateUrl="default.aspx">Home</asp:HyperLink>
        <h1>Login</h1>
        
        <div id="loginError" runat="server" style="width:250px;background:#B42842;border:1px dotted red">
            &nbsp;&nbsp;<font color="white">Invalid email or password combination</font>
        </div>
        <br />

        <div>
        Email address:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="usernameBox" runat="server" TextMode="Email"></asp:TextBox>
        <br />
        <br />
        Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="passwordBox" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="loginButton" runat="server" Text="Login" />
        <br />
        <br />
        <asp:HyperLink ID="registerLink" runat="server" NavigateUrl="CreateAccount.aspx">Click here to register</asp:HyperLink>
        


    </div>
    </form>
</body>
</html>
