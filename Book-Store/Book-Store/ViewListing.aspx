﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewListing.aspx.cs" Inherits="Book_Store.View_Listing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Listing</title>

    <style>
        #listing {
            margin:auto;
            width: 40%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="home">
        <asp:HyperLink ID="homeLink" runat="server" NavigateUrl="default.aspx">Home</asp:HyperLink>
        
        <br />
        <br />
    </div>
    <div id="listing" runat="server">
        <asp:Label ID="titleLabel" runat="server" Text="Listing Title" Font-Size="XX-Large"></asp:Label>
        
        <br />
        
        <br />
        <asp:Label ID="errorLabel" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        Book name:
        <asp:Label ID="bookNameLabel" runat="server" Text="Book Name"></asp:Label>
        
        <br />
        <br />
        Posted on:
        <asp:Label ID="dateLabel" runat="server" Text="Date"></asp:Label>
        <br />
        <br />
        Posted by:
        <asp:Label ID="userLabel" runat="server" Text="User"></asp:Label>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Image ID="coverImage" runat="server" Height="200px" Width="200px" />
        <br />
        <br />
        Condition:
        <asp:Label ID="conditionLabel" runat="server" Text="Condition"></asp:Label>
        <br />
        <br />
        Price:
        <asp:Label ID="priceLabel" runat="server" Text="Price"></asp:Label>
        <br />
        <br />
        Description:
        <asp:Label ID="descriptionLabel" runat="server" Text="Description text"></asp:Label>
        
    </div>
    </form>
</body>
</html>
