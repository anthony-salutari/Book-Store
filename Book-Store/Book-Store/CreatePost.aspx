<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreatePost.aspx.cs" Inherits="Book_Store.CreatePost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Listing</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HyperLink ID="homeLink" runat="server" NavigateUrl="default.aspx">Home</asp:HyperLink>

        <h1>Create New Listing</h1>
        
        
        <br />
        Listing title:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="titleBox" runat="server" Width="300px"></asp:TextBox>
        <br />
        <br />
        Book name:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="bookNameBox" runat="server" Width="300px"></asp:TextBox>
        <br />
        <br />
        Condition:&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="conditionList" runat="server">
            <asp:ListItem Selected="True">-Select-</asp:ListItem>
            <asp:ListItem>Unopened</asp:ListItem>
            <asp:ListItem>Mint</asp:ListItem>
            <asp:ListItem>Good</asp:ListItem>
            <asp:ListItem>Poor</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        Price:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="priceBox" runat="server"></asp:TextBox>
        <br />
        <br />
        Description:<br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="descriptionBox" runat="server" Height="150px" Width="500px" TextMode="MultiLine"></asp:TextBox>
        <br />
        <br />
        Cover photo:<br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Image ID="coverPhoto" runat="server" Height="200px" Width="200px" />
        <br />
        <br />
        <asp:FileUpload ID="coverPhotoUpload" runat="server" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="uploadButton" runat="server" Text="Upload" OnClick="uploadButton_Click" />
        <br />
        <br />
        <br />
        <asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="submitButton_Click" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="cancelButton" runat="server" OnClick="cancelButton_Click" Text="Cancel" />
        
        
    </div>
    </form>
</body>
</html>
