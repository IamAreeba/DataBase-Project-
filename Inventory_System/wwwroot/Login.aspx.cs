using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class wwwroot_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (IsValidateForm())
        {
            try
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conDB"].ConnectionString);

                SqlCommand cmd = new SqlCommand("Select * from tblUser where UserName=@UserName and Password=@Password ", con);
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Open();
                int i = 0;
                i = cmd.ExecuteNonQuery();
                con.Close();   // We dont have to disturb DB 

                if (dt.Rows.Count > 0)
                {            
                        // Using Remember Me for coding
                        if(CheckBox1.Checked)
                        {
                            // Creating Cookie
                            HttpCookie cookie = new HttpCookie(txtUserName.Text, txtPassword.Text);
                            cookie.Expires = DateTime.Now.AddHours(2);
                            Response.Cookies.Add(cookie);
                        }                  
                        Session["user"] = txtUserName.Text;
                        Response.Write("<script> alert('Login Successful') </script>");
                        txtUserName.Text = string.Empty;  // Best Way to clear text
                        txtPassword.Text = "";
                        Response.Redirect("~/wwwroot/Admin/Brand.aspx");
                    }

                    else
                    {
                        Response.Write("<script> alert('Exception : Login Failed') </script>");
                        txtUserName.Text = string.Empty;
                        txtPassword.Text = "";
                        txtUserName.Focus(); 
                    }
                    con.Close();
                
            }

            catch (Exception ex)
            {
                Response.Write("<script> alert('Exception : Login Failed') </script>");

            }
        }

        else
        {
            Response.Write("<script> alert('Login Failed')  </script>");
        }

    } 

    private bool IsValidateForm()
    {

        string User = txtUserName.Text;
        string Pass = txtPassword.Text;


        if (User == "" && Pass == "")
        {
            Response.Write("<script> alert('UserName and Password are necessary ! plz enter and tryagain ...') </script>");
            return false;
        }

        else if (User == "")
        {
            Response.Write("<script> alert('UserName necessary ! plz enter UserName ...') </script>");
            return false;

        }

        else if (Pass == "")
        {
            Response.Write("<script> alert('Password necessary ! plz enter Password ...') </script>");
            return false;
        }

        else if (User.Length == 0)
        {
            Response.Write("<script> alert('Enter UserName. It can not be blank ...') </script>");
            return false;
        }

            // condition N0: 02
        else if (User.Length < 4)
        {
            Response.Write("<script> alert('Invalid Length. User Name should be atleast 4 characters ...') </script>");
            return false;
        }


        else if (Pass.Length < 4 || Pass.Length >= 18)
        {
            Response.Write("<script> alert('Invalid Length. Password should atleast 4 chracter Long & Max 18 Char ...') </script>");
            return false;
        }

        return true;
    }
}