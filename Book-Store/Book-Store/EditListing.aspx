<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditListing.aspx.cs" Inherits="Book_Store.EditListing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Listing</title>

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
    <div>
        <h1>Edit Listing</h1>
        <p>
            <asp:Label ID="errorLabel" runat="server" ForeColor="Red"></asp:Label>
        </p>

        Title:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="titleBox" runat="server" Width="203px"></asp:TextBox>
        <br />
        <br />
        Book name:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="nameBox" runat="server"></asp:TextBox>
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
        Price:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="priceBox" runat="server" onkeypress="return isDecimal(event);"></asp:TextBox>
        <br />
        <br />
        Description:
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="descriptionBox" runat="server" Height="150px" Width="500px" TextMode="MultiLine"></asp:TextBox>
        &nbsp;&nbsp;
        <br />
        <br />
        <asp:Button ID="saveButton" runat="server" Text="Save Changes" OnClick="saveButton_Click" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="cancelButton" runat="server" Text="Cancel" OnClick="cancelButton_Click" />


    &nbsp;&nbsp;&nbsp;
        <asp:Button ID="deleteButton" runat="server" BackColor="Red" ForeColor="White" OnClick="deleteButton_Click" Text="Delete Listing" />


    </div>
    </form>
</body>
</html>
