using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wwwroot_Admin_AdminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       lblUser.Text = Session["user"].ToString();
    }
    
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Session.RemoveAll();  // All session will be deleted
        Session.Remove("user");    // To delete specific session
        Session.Abandon();
        //Response.Redirect("Login.aspx");
        Response.Redirect("wwwroot/Login.aspx");
    }
}
