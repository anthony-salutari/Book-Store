<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditAccount.aspx.cs" Inherits="Book_Store.EditAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Account</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Edit Account Details</h1>


        <br />
        Name:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="nameBox" runat="server"></asp:TextBox>
        <br />
        <br />
        Profile picture:<br />
&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Image ID="profilePicture" runat="server" Height="200px" Width="200px" />
        <br />
        <br />
        <asp:FileUpload ID="pictureUpload" runat="server" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="uploadButton" runat="server" Text="Upload" />
        <br />
        <br />
        <asp:Button ID="submitButton" runat="server" Text="Submit" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="cancelButton" runat="server" Text="Cancel" />


    </div>
    </form>
</body>
</html>
