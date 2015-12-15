using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Store
{
    public partial class ViewUserListings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {     
            if (Session["LoggedIn"] != null)
            {
                // set the title
                titleLabel.Text = "Listings for " + Session["EmailAddress"].ToString();
            }
            else
            {
                // user isn't logged in redirect to login screen
                Server.Transfer("Login.aspx", false);
            }
        }
    }
}