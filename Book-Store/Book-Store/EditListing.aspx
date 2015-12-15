<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditListing.aspx.cs" Inherits="Book_Store.EditListing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Listing</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Edit Listing</h1>
        <p>
            <asp:Label ID="errorLabel" runat="server" ForeColor="Red"></asp:Label>
        </p>


        Title:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Width="203px"></asp:TextBox>
        <br />
        <br />
        Book name:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
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
        Price:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <br />
        Description:
        <br />
&nbsp;&nbsp;
        <asp:TextBox ID="descriptionBox" runat="server" Height="150px" Width="500px" TextMode="MultiLine"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="saveButton" runat="server" Text="Save Changes" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="cancelButton" runat="server" Text="Cancel" />


    </div>
    </form>
</body>
</html>
