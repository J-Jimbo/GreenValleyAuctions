using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleyAuctions
{
    public partial class Confirm_Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login_Page.aspx?loggedOut=true");
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            Response.Redirect("Emp_Home.aspx");
        }
    }
}