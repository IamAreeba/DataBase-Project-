using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DBFrameworks;  // Validatin is same as we have did in Login Page

public partial class wwwroot_Admin_Brand : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtAction.Text = "Insert";
            txtCreatedBy.Text = Session["user"].ToString();
            txtCreatedDate.Text = DateTime.Today.ToShortTimeString();



            // Displaying Record in GridView
            LoadDataIntoGridView();
        }


        
       
    }


    private void LoadDataIntoGridView()
    {
        LoadData(GridViewBrand, "sp_showBrandInGridView");
    }

    public void LoadData(GridView gv, string storedProceName)
    {
        DBSqlServer db = new DBSqlServer(AppSetting.ConnectionString());
        gv.DataSource = db.GetDataList(storedProceName);
        gv.DataBind();
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        // First Do Validation
        if (IsValidateForm())
        {
           // DBSqlServer db = new DBSqlServer(AppSetting.ConnectionString());
            try
            {
                SaveBrandInfo("sp_InsertBrand");
                Response.Write("<script> alert('Record Saved Successfully') </script>");
                // Calling grid method to reload the data that we have added
                LoadDataIntoGridView();
            }

            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
        

    }

    private void SaveBrandInfo(string storedProcName)
    {
        DBSqlServer db = new DBSqlServer(AppSetting.ConnectionString());
        db.SaveOrUpdateRecord(storedProcName, GetObject());
    }

    public object GetObject()
    {
        BrandDetails Brand = new BrandDetails();
        Brand.brand = txtBrand.Text;
        Brand.Action = "Insert";
        Brand.CreatedBy = Session["user"].ToString();
        Brand.CreatedDate = DateTime.Today.ToShortTimeString();
        
        //txtCreatedBy.Text = Brand.CreatedBy;

        return Brand;
    }
    public class BrandDetails
    {
        public int Id { get; set; }
        public string brand { get; set; }
        public string Action { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
    }


    private bool IsValidateForm()
    {

        string brand = txtBrand.Text;
        string action = txtAction.Text;
        string createdBy = txtCreatedBy.Text;
        string createdDate = txtCreatedDate.Text;
        


        if (brand == "")
        {
            Response.Write("<script> alert('Brand  necessary ! plz enter and tryagain ...') </script>");
            return false;
        }

        //else if (action == "")
        //{
        //    Response.Write("<script> alert('Action necessary ! plz enter Action ...') </script>");
        //    return false;

        //}

        //else if (createdBy == "")
        //{
        //    Response.Write("<script> alert('CreatedBy necessary ! plz enter CreatedBy ...') </script>");
        //    return false;
        //}

        else if (brand.Length == 0)
        {
            Response.Write("<script> alert('Enter Brand. It can not be blank ...') </script>");
            return false;
        }

            // condition N0: 02
        else if (brand.Length < 4)
        {
            Response.Write("<script> alert('Invalid Length. User Brand should be atleast 4 characters ...') </script>");
            return false;
        }


        //else if (action.Length < 4 || action.Length >= 18)
        //{
        //    Response.Write("<script> alert('Invalid Length. Action should atleast 4 chracter Long & Max 18 Char ...') </script>");
        //    return false;
        //}

        return true;
    }



    protected void GridViewBrand_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void GridViewBrand_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewBrand.EditIndex = -1;


        // Displaying Record in GridView
        LoadDataIntoGridView();

    }

    protected void GridViewBrand_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // For Updating
        int bid = Convert.ToInt32(GridViewBrand.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewBrand.Rows[e.RowIndex];
        Label lblID = (Label)row.FindControl("lblID");
      
        SqlConnection con = new SqlConnection(AppSetting.ConnectionString());
        con.Open();
        //SqlCommand cmd = new SqlCommand("Update tblBrand set brand=@brand, Action=@Action, CreatedBy=@Createdby, CreatedDate=GETDATE() where Id=@Id", con);

        //SqlCommand cmd = new SqlCommand("delete from tblBrand where Id = @Id", con);
        SqlCommand cmd = new SqlCommand("sp_Deletebrand", con);

        cmd.CommandType = System.Data.CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@Id", bid);
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Write("<script> alert('Deleted Successfully') </script>");

        // Displaying Record in GridView
        LoadDataIntoGridView();


    }

    protected void GridViewBrand_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //Response.Write("<script> alert('Edit button clicked') </script>");
        GridViewBrand.EditIndex = e.NewEditIndex;



        // Displaying Record in GridView
        LoadDataIntoGridView();


    }

    protected void GridViewBrand_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        // For Updating
        int bid = Convert.ToInt32(GridViewBrand.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow) GridViewBrand.Rows[e.RowIndex];
        Label lblID = (Label)row.FindControl("lblID");
        TextBox txtBrand = (TextBox)row.Cells[1].Controls[0];
        TextBox txtActivity = (TextBox)row.Cells[2].Controls[0];
        TextBox txtCreatedBy = (TextBox)row.Cells[3].Controls[0];
        TextBox txtCreatedDate = (TextBox)row.Cells[4].Controls[0];

        GridViewBrand.EditIndex = -1;

        SqlConnection con = new SqlConnection(AppSetting.ConnectionString());
        con.Open();
        SqlCommand cmd = new SqlCommand("Update tblBrand set brand=@brand, Action=@Action, CreatedBy=@Createdby, CreatedDate=GETDATE() where Id=@Id", con);

        //SqlCommand cmd = new SqlCommand("sp_UpdateBrand", con);
        cmd.CommandType = System.Data.CommandType.Text;

        cmd.Parameters.AddWithValue("@Id", bid);
        cmd.Parameters.AddWithValue("@brand", txtBrand.Text);
        cmd.Parameters.AddWithValue("@Action", "Update");
        cmd.Parameters.AddWithValue("CreatedBy", Session["user"].ToString());
        cmd.Parameters.AddWithValue("CreatedDate", DateTime.Today.ToShortTimeString());
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Write("<script> alert('Update Successfully') </script>");
            
        // Displaying Record in GridView
        LoadDataIntoGridView();
    }

}
