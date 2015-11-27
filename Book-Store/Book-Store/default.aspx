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
        <br />
    <div id="search" runat="server">
        
        <asp:TextBox ID="searchBox" runat="server" Width="189px">Search for a book</asp:TextBox>
        
    </div>
        <br />
    <div id="filter" runat="server">
        Filter: 
        <asp:DropDownList ID="filterTimeList" runat="server">
            <asp:ListItem Selected="True">Filter by date</asp:ListItem>
            <asp:ListItem>Newest to oldest</asp:ListItem>
            <asp:ListItem>Oldest to newest</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="filterPriceList" runat="server">
            <asp:ListItem Selected="True">Filter by price</asp:ListItem>
            <asp:ListItem>Lowest to highest</asp:ListItem>
            <asp:ListItem>Highest to lowest</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Filter by name</asp:ListItem>
            <asp:ListItem>A to Z</asp:ListItem>
            <asp:ListItem>Z - A</asp:ListItem>
        </asp:DropDownList>
    </div>

    <div id="listings" runat="server">

    </div>

    </form>
</body>
</html>
