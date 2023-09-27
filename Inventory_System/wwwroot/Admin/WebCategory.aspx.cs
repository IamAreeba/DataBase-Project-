using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using DBFrameworks;

public partial class Wwwroot_Admin_WebCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsValidateForm())
        {
            // DBSqlServer db = new DBSqlServer(AppSetting.ConnectionString());
            try
            {
                SaveCategoryInfo("sp_InsertCategory");
                Response.Write("<script> alert('Record Saved Successfully') </script>");
                txtCategory.Text = string.Empty;

                // Displaying Record in GridView
                //LoadDataIntoGridView();

            }

            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }

        else
        {

        }

    }

    private void SaveCategoryInfo(string storedProcName)
    {
        DBSqlServer db = new DBSqlServer(AppSetting.ConnectionString());
        db.SaveOrUpdateRecord(storedProcName, GetObject());
    }

    private object GetObject()
    {
        CategoryDetails c = new CategoryDetails();
        c.category = txtCategory.Text;
        c.Action = "Insert";
        c.CreatedBy = Session["user"].ToString();
        c.CreatedDate = DateTime.Today.ToShortTimeString();

        //txtCreatedBy.Text = Brand.CreatedBy;

        return c;
        
    }

    private bool IsValidateForm()
    {
        string cat = txtCategory.Text;
        if (cat == "")
        {
            Response.Write("<script> alert('category is necessary ! Please enter and try again...') </script>");
            return false;
        }
        return true;
    }


    public class CategoryDetails
    {
        public int Id { get; set; }
        public string category { get; set; }
        public string Action { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
    }

}