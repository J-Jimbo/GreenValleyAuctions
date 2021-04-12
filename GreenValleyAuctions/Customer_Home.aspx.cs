using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleyAuctions
{
    public partial class Customer_Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Customer"] != null)
            {

            }
            else
            {
                Session["NoCustomer"] = "You Must first Login or create an Account";
                Response.Redirect("Customer_Login.aspx");
            }
        }

        protected void btnMedia_Click(object sender, EventArgs e)
        {

        }

        protected void btnReview_Click(object sender, EventArgs e)
        {

        }

        protected void btnRequest_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_Request.aspx");
        }
    }
}