using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class wwwroot_Login7_Stored_Pro : System.Web.UI.Page
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
                /*
                 
                string conString = "server=.; database=AADB; integrated security=true;";
                SqlConnection con = new SqlConnection(conString);
                con.Open();
                string query = "Select * from tblUser where UserName = '"+txtUserName+"' and Password = '"+txtPassword+"'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                Response.Write("<script> alert('Login Correct') </script>");
                con.Close();
                  
               */

                /*
                 
                SqlConnection con = new SqlConnection("server=.; database=AADB; integrated security=true;");
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblUser where UserName='" + txtUserName + "' and Password = '" + txtPassword + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                con.Close();
                 
                */


                /*

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conDB"].ConnectionString);
                SqlCommand cmd = new SqlCommand("Select * from tblUser where UserName= @UserName and Password = @Password", con);
                cmd.Parameters.AddWithValue("@UserName", txtUserName);
                cmd.Parameters.AddWithValue("@password", txtPassword);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();                                              // Make Virtual Table called DataBind Table
                sda.Fill(dt);
                con.Open();
                int i = 0;
                i = cmd.ExecuteNonQuery();
                con.Close();
                  
                */ 

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conDB"].ConnectionString);
                SqlCommand cmd = new SqlCommand("usp_CheckLoginDetails", con);
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();                                              // Make Virtual Table called DataBind Table
                sda.Fill(dt);
                con.Open();
                int i = 0;
                i = cmd.ExecuteNonQuery();
                con.Close();


                if (dt.Rows.Count > 0)
                {
                    Session["user"] = txtUserName.Text;
                    // Login code write
                    Response.Write("<script> alert('Login Successful') </script>");
                    txtUserName.Text = string.Empty;
                    // or
                    txtUserName.Text = "";
                    Response.Redirect("HomePage01.aspx");
                }

                else
                {
                    // Login code write
                    Response.Write("<script> alert('Login Failed Error') </script>");
                    txtUserName.Text = string.Empty;
                    txtUserName.Focus();
                }
                con.Close();

            }

            catch(Exception ex)
            {
                Response.Write("<script> alert('Exception Login Failed') </script>");
                Response.Write(ex.Message);

            }

        }


        else
        {
            Response.Write("<script> alert('Validation Failed Error') </script>");
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