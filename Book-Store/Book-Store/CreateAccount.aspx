<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="Book_Store.CreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>

    <style>
        #links, #createAccount {
            margin:auto;
            width: 40%;
        }

        h1 {
            text-align: center;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div id="links" runat="server">
        <asp:HyperLink ID="homeLink" runat="server" NavigateUrl="default.aspx">Home</asp:HyperLink>
    </div>
        <h1>Register for account</h1>

    <div id="createAccount" runat="server">
        <br />
        Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="nameBox" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="nameValidator" runat="server" ControlToValidate="nameBox" ErrorMessage="Please enter your name" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        Email address:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="emailBox" runat="server" TextMode="Email"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="emailValidator" runat="server" ControlToValidate="emailBox" ErrorMessage="Please enter your email" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="passwordBox" runat="server" TextMode="Password"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="passwordValidator" runat="server" ControlToValidate="passwordBox" ErrorMessage="Please enter a password" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        Profile picture:<br />
&nbsp;&nbsp;&nbsp; *Must be less than 4 MB<br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Image ID="profileImage" runat="server" Height="200px" Width="200px" />
        <br />
        <br />
        <asp:FileUpload ID="photoUpload" runat="server" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="uploadButton" runat="server" OnClick="uploadButton_Click" Text="Upload" CausesValidation="False" UseSubmitBehavior="False" />
        <br />
        <br />
        <br />
        <asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="submitButton_Click" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="cancelButton" runat="server" Text="Cancel" OnClick="cancelButton_Click" />

    </div>
    </form>
</body>
</html>
