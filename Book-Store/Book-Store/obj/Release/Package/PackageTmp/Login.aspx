<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Book_Store.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <style>
        #login, links, #loginError {
            margin: auto;
            width: 30%;
        }

        h1 {
            text-align:center;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div id="links">
            <asp:HyperLink ID="homeLink" runat="server" NavigateUrl="default.aspx">Home</asp:HyperLink>
        </div>
        <h1>Login</h1>
        
        <div id="loginError" runat="server" style="width:250px;background:#B42842;border:1px dotted red">
            &nbsp;&nbsp;<font color="white">Invalid email or password combination</font>
        </div>
        <br />

        <div id="login" runat="server">
        Email address:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="emailBox" runat="server" TextMode="Email"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="emailValidator" runat="server" ControlToValidate="emailBox" ErrorMessage="Please enter your email" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="passwordBox" runat="server" TextMode="Password"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="passwordValidator" runat="server" ControlToValidate="passwordBox" ErrorMessage="Please enter your password" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="loginButton" runat="server" Text="Login" OnClick="loginButton_Click" />
        <br />
        <br />
        <asp:HyperLink ID="registerLink" runat="server" NavigateUrl="CreateAccount.aspx">Click here to register</asp:HyperLink>
        
    </div>
    </form>
</body>
</html>
