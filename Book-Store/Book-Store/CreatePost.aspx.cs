using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Store
{
    public partial class CreatePost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bookImage.ImageUrl = "Assets/placeholder.jpg";
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
            "Error",
            "alert('Are you sure you want to cancel this post?');",
            true);        
        }
    }
}