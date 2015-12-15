<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Book_Store._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Store</title>

    <style>
        body {
            text-align: center;
        }
        .auto-style1 {
            width: 100%;
        }
        #listings {
            margin:auto;
            width: 60%;
        }
        </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Book Store</h1>
    </div>

    <div id="links" runat="server">
        <asp:HyperLink ID="loginLink" runat="server" NavigateUrl="Login.aspx">Login</asp:HyperLink>
        <br />
    </div>
    <div id="userBox" runat="server">
        <asp:ImageButton ID="userImage" runat="server" Height="50px" Width="50px" />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="userNameLabel" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="createNewListingLink" runat="server" NavigateUrl="CreatePost.aspx">Create New Listing</asp:HyperLink>
&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="editPostsLink" runat="server">View/Edit your listings</asp:HyperLink>
&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="logoutLink" runat="server" OnClick="logoutLink_Click">Logout</asp:LinkButton>
        <br />

    </div>
        <br />
    <div id="search" runat="server">
        
        <asp:TextBox ID="searchBox" runat="server" Width="189px">Search for a book</asp:TextBox>
        
    &nbsp;&nbsp;&nbsp;
        <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" />
        
    </div>
        <br />
    <div id="filter" runat="server">
    </div>

    <div id="listings" runat="server">

        <br />
        <asp:Label ID="errorLabel" runat="server" ForeColor="Red"></asp:Label>

        <br />
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ListingID" DataSourceID="SqlDataSource1" GroupItemCount="3">
                        <AlternatingItemTemplate>
                            <td runat="server" style="background-color:#FFF8DC;">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "ViewListing.aspx?ListingID=" + Eval("ListingID") %>' Text='<%# Eval("Title") %>'></asp:HyperLink>
                                <br />
                                Book Name:
                                <asp:Label ID="BookNameLabel" runat="server" Text='<%# Eval("BookName") %>' />
                                <br />&nbsp;<asp:Image ID="coverImage" runat="server" Height="100px" ImageUrl='<%# Eval("CoverImageURL") %>' Width="100px" />
                                <br />
                                Price:
                                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                                <br />Date:
                                <asp:Label ID="PostingDateLabel" runat="server" Text='<%# Eval("PostingDate") %>' />
                                <br /></td>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">BookName:
                                <asp:TextBox ID="BookNameTextBox" runat="server" Text='<%# Bind("BookName") %>' />
                                <br />ListingID:
                                <asp:Label ID="ListingIDLabel1" runat="server" Text='<%# Eval("ListingID") %>' />
                                <br />
                                Title:
                                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
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
                            <td runat="server" style="">BookName:
                                <asp:TextBox ID="BookNameTextBox" runat="server" Text='<%# Bind("BookName") %>' />
                                <br />
                                Title:
                                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
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
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "ViewListing.aspx?ListingID=" + Eval("ListingID") %>' Text='<%# Eval("Title") %>'></asp:HyperLink>
                                <br />
                                Book Name:
                                <asp:Label ID="BookNameLabel" runat="server" Text='<%# Eval("BookName") %>' />
                                <br />&nbsp;<asp:Image ID="coverImage" runat="server" Height="100px" ImageUrl='<%# Eval("CoverImageURL") %>' Width="100px" />
                                <br />
                                Price:
                                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                <br />Date:
                                <asp:Label ID="PostingDateLabel" runat="server" Text='<%# Eval("PostingDate") %>' />
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
                            <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">BookName:
                                <asp:Label ID="BookNameLabel" runat="server" Text='<%# Eval("BookName") %>' />
                                <br />
                                ListingID:
                                <asp:Label ID="ListingIDLabel" runat="server" Text='<%# Eval("ListingID") %>' />
                                <br />Title:
                                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                                <br />CoverImageURL:
                                <asp:Label ID="CoverImageURLLabel" runat="server" Text='<%# Eval("CoverImageURL") %>' />
                                <br />Price:
                                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                                <br />PostingDate:
                                <asp:Label ID="PostingDateLabel" runat="server" Text='<%# Eval("PostingDate") %>' />
                                <br /></td>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:databaseConnectionString %>" SelectCommand="SELECT [BookName], [ListingID], [Title], [CoverImageURL], [Price], [PostingDate] FROM [Listings] ORDER BY [PostingDate] DESC"></asp:SqlDataSource>
                    <br />
                </td>
            </tr>
        </table>
    </div>

    </form>
</body>
</html>
