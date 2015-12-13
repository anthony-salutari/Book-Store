<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreatePost.aspx.cs" Inherits="Book_Store.CreatePost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Listing</title>

    <style>
        #links, #listing{
            margin:auto;
            width: 30%;
        }

        h1 {
            text-align: center;
        }
    </style>

    <script type="text/javascript">
        function isDecimal(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            var parts = evt.srcElement.value.split('.');
            if (parts.length > 1 && charCode == 46)
                return false;
            else {
                if (charCode == 46 || (charCode >= 48 && charCode <= 57))
                    return true;
                return false;
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div id="links">
        <asp:HyperLink ID="homeLink" runat="server" NavigateUrl="default.aspx">Home</asp:HyperLink>
    </div>
        <h1>Create New Listing</h1>
    <div id="listing" runat="server">         
        <br />
        Listing title:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="titleBox" runat="server" Width="300px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="titleValidator" runat="server" ControlToValidate="titleBox" ErrorMessage="Please enter a title" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        Book name:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="bookNameBox" runat="server" Width="300px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="bookNameValidator" runat="server" ControlToValidate="bookNameBox" ErrorMessage="Please enter the book name" ForeColor="Red"></asp:RequiredFieldValidator>
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
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="conditionValidator" runat="server" ControlToValidate="conditionList" ErrorMessage="Please enter the book's condition" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
        <br />
        <br />
        Price:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="priceBox" runat="server" onkeypress="return isDecimal(event);"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="priceValidator" runat="server" ControlToValidate="priceBox" ErrorMessage="Please enter the price" ForeColor="Red"></asp:RequiredFieldValidator>
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
