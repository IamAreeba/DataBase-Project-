using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class wwwroot_check1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        /*  

        string User = txtUserName.Text;
        string Pass = txtPassword.Text;


        if (User == "" && Pass == "")
        {
            Response.Write("<script> alert('UserName and Password are necessary ! plz enter and tryagain ...') </script>");
            return;
        }

        else if (User == "")
        {
            Response.Write("<script> alert('UserName necessary ! plz enter UserName ...') </script>");
            return;
            
        }

        else if (Pass == "")
        {
           Response.Write("<script> alert('Password necessary ! plz enter Password ...') </script>");
           return;
        }

        else if (User.Length == 0)
        {
            Response.Write("<script> alert('Enter UserName. It can not be blank ...') </script>");
            return;
        }

            // condition N0: 02
        else if (User.Length < 4)
        {
            Response.Write("<script> alert('Invalid Length. User Name should be atleast 4 characters ...') </script>");
            return;
        }


        else if (Pass.Length < 4 || Pass.Length >= 18)
        {
            Response.Write("<script> alert('Invalid Length. Password should atleast 4 chracter Long & Max 18 Char ...') </script>");
            return;
        }
         
        */

        if (IsValidateForm())
        {
            try
            {
                //string constring = "server=.; database=AADB; integrated security=true;";
                //SqlConnection con = new SqlConnection("server=.; database=AADB; integrated security=true;");
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conDB"].ConnectionString);
                //con.Open();
                //string query = "Select * From tblUser where UserName = '" + txtUserName.Text + "' and Password = '" + txtPassword.Text + "' ";
                //SqlCommand cmd = new SqlCommand("Select * From tblUser where UserName = '" + txtUserName.Text + "' and Password = '" + txtPassword.Text + "' ", con);
                SqlCommand cmd = new SqlCommand("Select * From tblUser where UserName = @UserName and Password = @Password", con);
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);


                //SqlDataReader dr = cmd.ExecuteReader();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();                                          // Make Virtual Table called DataBind Table
                sda.Fill(dt);
                //con.Close();
                con.Open();

                int i = 0;
                i = cmd.ExecuteNonQuery();
                con.Close();


                // How to check UserName and Password is matched or not. dr has every info record
                if(dt.Rows.Count > 0)   // if (dr.Read())  // dr = -1 After that dr = 1,2,3...
                {
                    Session["user"] = txtUserName.Text;
                    // Login code write
                    Response.Write("<script> alert('Login Successful') </script>");
                    txtUserName.Text = string.Empty;
                    txtPassword.Text = "";
                    Response.Redirect("HomePage01.aspx");
                }
                else
                {
                    // Login code write
                    Response.Write("<script> alert('Login Failed error') </script>");
                    txtUserName.Text = string.Empty;
                    txtPassword.Text = "";
                    txtUserName.Focus();
                }
                con.Close(); 

            }

            catch(Exception  )
            {
                Response.Write("<script> alert('Exception Login Failed') </script>");
               
            }
            
        }

        else
        {
            Response.Write("<script> alert('Validation fail error') </script>");
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

