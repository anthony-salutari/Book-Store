<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Book_Store._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Store</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Book Store</h1>
    </div>

    <div id="header">
        <asp:HyperLink ID="loginLink" runat="server" NavigateUrl="Login.aspx">Login</asp:HyperLink>

    &nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="createAccountLink" runat="server" NavigateUrl="CreatePost.aspx">Create New Listing</asp:HyperLink>

    </div>


    </form>
</body>
</html>
