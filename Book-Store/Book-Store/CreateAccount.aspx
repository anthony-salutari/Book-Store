<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="Book_Store.CreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HyperLink ID="homeLink" runat="server" NavigateUrl="default.aspx">Home</asp:HyperLink>
        <h1>Register for account</h1>

        <br />
        Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="nameBox" runat="server"></asp:TextBox>
        <br />
        <br />
        Email address:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="emailBox" runat="server" TextMode="Email"></asp:TextBox>
        <br />
        <br />
        <asp:Image ID="profileImage" runat="server" Height="100px" Width="100px" />
        <br />
        <br />
        <asp:Button ID="uploadButton" runat="server" Text="Upload Profile Image" />
        <br />
        <br />
        <asp:Button ID="submitButton" runat="server" Text="Submit" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="cancelButton" runat="server" Text="Cancel" />

    </div>
    </form>
</body>
</html>
