using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace Book_Store
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // hide the search div
                searchResults.Attributes.Add("style", "display:none");
            }

            // check if user is logged in
            if (Session["LoggedIn"] != null)
            {
                userBox.Attributes.Add("style", "display:inline");
                links.Attributes.Add("style", "display:none");

                try
                {
                    userImage.ImageUrl = Session["Photo"].ToString();
                    userNameLabel.Text = Session["UserName"].ToString();
                }
                catch (Exception ex)
                {
                    errorLabel.Text = ex.Message;
                }
            }
            else
            {
                userBox.Attributes.Add("style", "display:none");
                links.Attributes.Add("style", "display:inline");
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            listings.Attributes.Add("style", "display:none");
            searchResults.Attributes.Add("style", "display:inline");
        }

        protected void logoutLink_Click(object sender, EventArgs e)
        {
            // user wants to log out, clear session variables and post back to default
            Session.Abandon();
            Session.Clear();
            Response.Redirect("default.aspx");
        }
    }
}