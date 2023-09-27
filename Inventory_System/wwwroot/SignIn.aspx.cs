using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using DBFrameworks;

public partial class wwwroot_SignIn : System.Web.UI.Page
{

    int role = 1;
    string createdBy = "Admin";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (IsValidateForm())
        {
            try
            {

                //Simple Insert Code
                //DBSqlServer db = new DBSqlServer(AppSetting.ConnectionString());

                //We will not use this code because it is not professional

                //SqlConnection con = new SqlConnection(AppSetting.ConnectionString());
                //con.Open();
                //SqlCommand cmd = new SqlCommand("insert into tblUser(UserName, Password, RoleID, CreatedBy, CreatedDate) values('"+txtUserName.Text+"', '"+txtPassword.Text+"', '"+Convert.ToInt32(role)+"', '"+createdBy+"', '"+DateTime.Today+"')", con);
                //cmd.ExecuteNonQuery();
                //Response.Redirect("Admin/AdminHome.aspx");
                //Response.Write("<script> alert('Hello Coder Your record saved') </script>");


                SaveBrandRecord("sp_tblUserAddNewUser");
                Response.Write("<script> alert('Record Saved Successfully') </script>");
            }

            catch (Exception ex)
            {
                //Response.Write("<script> alert('Procedure or Function sp_AddUser has too many arguments specified...') </script>");
                // Response.Write("<script> alert('Error') </script>");
                Response.Write("<script> alert('" + ex.Message + "') </script>");

            }

        }


    }
    protected void txtUserName_TextChanged(object sender, EventArgs e)
    {
        try
        {
            DBSqlServer DB = new DBSqlServer(AppSetting.ConnectionString());
            bool isLogicalDetailsCorrect = Convert.ToBoolean(DB.GetScalarValue("sp_CheckUserNameAvailability", GetParameters()));
            if (isLogicalDetailsCorrect)
            {
                Session["User"] = txtUserName.Text;
                Label1.Text = "UserName Already Exist... ";
                Label1.ForeColor = System.Drawing.Color.Red;
            }

            else
            {
                Label1.Text = "UserName Available... ";
                Label1.ForeColor = System.Drawing.Color.Green;

            }




        }

        catch (Exception ex)
        {

            Response.Write(ex.Message);

        }
    }
    private DBParameter[] GetParameters()
    {
        List<DBParameter> parameters = new List<DBParameter>();
        DBParameter dbParam1 = new DBParameter();
        dbParam1.Parameter = "@UserName";
        dbParam1.Value = txtUserName.Text;
        parameters.Add(dbParam1);

        return parameters.ToArray();

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


    public void SaveBrandRecord(string storedProcName)
    {
        DBSqlServer db = new DBSqlServer(AppSetting.ConnectionString());
        db.SaveOrUpdateRecord(storedProcName, GetObject());
        Response.Write("<script> alert('Hello') </script> ");
    }

    public UserDetails GetObject()
    {
        UserDetails user = new UserDetails();
        user.UserName = txtUserName.Text;
        user.Password = txtPassword.Text;
        user.RoleID = role;
        user.CreatedBy = "Admin";
        return user;

    }
    public class UserDetails
    {
        public int  Id { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public int RoleID { get; set; }
        public string CreatedBy { get; set; }
    }


}

