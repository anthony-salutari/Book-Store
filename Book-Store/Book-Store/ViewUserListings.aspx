<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewUserListings.aspx.cs" Inherits="Book_Store.ViewUserListings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Your Listings</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="links">
        <asp:HyperLink ID="homeLink" runat="server" NavigateUrl="default.aspx">Home</asp:HyperLink>
        <br />
    </div>
    <div>
        <asp:Label ID="titleLabel" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        <br />
        <br />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="ListingID" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC;">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "EditListing.aspx?ListingID=" + Eval("ListingID") %>' Text='<%# Eval("Title") %>'></asp:HyperLink>
                    <br />
                    Book Name:
                    <asp:Label ID="BookNameLabel" runat="server" Text='<%# Eval("BookName") %>' />
                    <br />
                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("CoverImageURL") %>' Width="100px" />
                    <br />
                    Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br />Date:
                    <asp:Label ID="PostingDateLabel" runat="server" Text='<%# Eval("PostingDate") %>' />
                    <br /></td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">ListingID:
                    <asp:Label ID="ListingIDLabel1" runat="server" Text='<%# Eval("ListingID") %>' />
                    <br />Title:
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                    <br />BookName:
                    <asp:TextBox ID="BookNameTextBox" runat="server" Text='<%# Bind("BookName") %>' />
                    <br />CoverImageURL:
                    <asp:TextBox ID="CoverImageURLTextBox" runat="server" Text='<%# Bind("CoverImageURL") %>' />
                    <br />Price:
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    <br />PostingDate:
                    <asp:TextBox ID="PostingDateTextBox" runat="server" Text='<%# Bind("PostingDate") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">Title:
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                    <br />BookName:
                    <asp:TextBox ID="BookNameTextBox" runat="server" Text='<%# Bind("BookName") %>' />
                    <br />CoverImageURL:
                    <asp:TextBox ID="CoverImageURLTextBox" runat="server" Text='<%# Bind("CoverImageURL") %>' />
                    <br />Price:
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    <br />PostingDate:
                    <asp:TextBox ID="PostingDateTextBox" runat="server" Text='<%# Bind("PostingDate") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "EditListing.aspx?ListingID=" + Eval("ListingID") %>' Text='<%# Eval("Title") %>'></asp:HyperLink>
                    <br />Book Name:
                    <asp:Label ID="BookNameLabel" runat="server" Text='<%# Eval("BookName") %>' />
                    <br />
                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("CoverImageURL") %>' Width="100px" />
                    <br />Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br />
                    Date:
                    <asp:Label ID="PostingDateLabel" runat="server" Text='<%# Eval("PostingDate") %>'></asp:Label>
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">ListingID:
                    <asp:Label ID="ListingIDLabel" runat="server" Text='<%# Eval("ListingID") %>' />
                    <br />Title:
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    <br />BookName:
                    <asp:Label ID="BookNameLabel" runat="server" Text='<%# Eval("BookName") %>' />
                    <br />CoverImageURL:
                    <asp:Label ID="CoverImageURLLabel" runat="server" Text='<%# Eval("CoverImageURL") %>' />
                    <br />Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    <br />PostingDate:
                    <asp:Label ID="PostingDateLabel" runat="server" Text='<%# Eval("PostingDate") %>' />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:databaseConnectionString %>" SelectCommand="SELECT [ListingID], [Title], [BookName], [CoverImageURL], [Price], [PostingDate] FROM [Listings] WHERE ([EmailAddress] = @EmailAddress) ORDER BY [PostingDate] DESC">
            <SelectParameters>
                <asp:SessionParameter Name="EmailAddress" SessionField="EmailAddress" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
