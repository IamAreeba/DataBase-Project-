 using DBFrameworks;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DBFrameworks;  // Validatin is same as we have did in Login Page
public partial class wwwroot_Admin_WebPageProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // First check if our page loaded first time
        if (!this.IsPostBack)
        {
            BindDdlBrand();

            // Displaying Record in GridView
            LoadDataIntoGridView();

        }

    }

    private void LoadDataIntoGridView()
    {
        LoadData(GridViewProduct, "sp_ShowProductInGridView");
    }

    public void LoadData(GridView gv, string storedProcName)
    {
        DBSqlServer db = new DBSqlServer(AppSetting.ConnectionString());
        gv.DataSource = db.GetDataList(storedProcName);
        gv.DataBind();

    }



    private void BindDdlBrand()
    {
        LoadDataIntoDropDownList(ddlBrand, "sp_searchBrand");
        LoadDataIntoDropDownListCategory(ddlCategory, "sp_searchCategory");
    }

    private void LoadDataIntoDropDownListCategory(DropDownList ddl, string storedProcName)
    {
        // Make obj of DBSqlServer class
        DBSqlServer db = new DBSqlServer(AppSetting.ConnectionString());
        ddl.DataSource = db.GetDataList(storedProcName);
        ddl.DataTextField = "category"; //brand table in DB
        ddl.DataValueField = "id"; //Value field means which value we want to save in DB
        ddl.DataBind();
        ddl.SelectedIndex = -1;

    }

    private void LoadDataIntoDropDownList(DropDownList ddl, string storedProcName)
    {
        // Make obj of DBSqlServer class
        DBSqlServer db = new DBSqlServer(AppSetting.ConnectionString());
        ddl.DataSource = db.GetDataList(storedProcName);
        ddl.DataTextField = "brand"; //brand table in DB
        ddl.DataValueField = "Id"; //Value field means which value we want to save in DB
        ddl.DataBind();
        ddl.SelectedIndex = -1; 
        
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsValidateForm())
        {
            
            try
            {
                SaveProductInfo("sp_InsertProduct");
                Response.Write("<script> alert('Record Saved Successfully') </script>");
                //txtCategory.Text = string.Empty;

                // Displaying Record in GridView
                LoadDataIntoGridView();
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

    private bool IsValidateForm()
    {
        //string cat = txtCategory.Text;
        if (txtProductID.Text == string.Empty)
        {
            Response.Write("<script> alert('ProductID is necessary ! Please enter and try again...') </script>");
            return false;
        }

        else if(txtDesc.Text == string.Empty)
        {
            Response.Write("<script> alert('Emter Product Name or Description is necessary ! Please enter and try again...') </script>");
            return false;
        }

        else if (ddlBrand.Text == string.Empty)
        {
            Response.Write("<script> alert('Select Brand is necessary ! Please enter and try again...') </script>");
            return false;
        }

        else if (ddlCategory.Text == string.Empty)
        {
            Response.Write("<script> alert('Select Category is necessary ! Please enter and try again...') </script>");
            return false;
        }

        return true;
    }

    private void SaveProductInfo(string storedProcName)
    {
        DBSqlServer db = new DBSqlServer(AppSetting.ConnectionString());
        db.SaveOrUpdateRecord(storedProcName, GetObject());

    }

    private object GetObject()
    {
        ProductDetails pd = new ProductDetails();
        pd.pcode = txtProductID.Text;
        pd.barcode = txtBarCode.Text;
        pd.pdesc = txtDesc.Text;
        pd.brandid = Convert.ToInt32(ddlBrand.SelectedIndex);
        pd.categoryid = Convert.ToInt32(ddlCategory.SelectedIndex);
        pd.Price = Convert.ToDecimal(txtPrice.Text);
        pd.qty = Convert.ToInt32(txtQty.Text);
        pd.reorder = 0;

        return pd;
    }

    public class ProductDetails
    {
        public string pcode { get; set; }
        public string barcode { get; set; }
        public string pdesc { get; set; }
        public int brandid { get; set; }
        public int categoryid { get; set; }
        public decimal Price { get; set; }
        public int qty { get; set; }
        public int reorder { get; set; }
    }



    protected void GridViewProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void GridViewProduct_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        GridViewProduct.EditIndex = -1;

        // Displaying Record in GridView
        LoadDataIntoGridView();

    }

    protected void GridViewProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //int pid = Convert.ToInt32(GridViewProduct.DataKeys[e.RowIndex].Value.ToString());
        //// For Updating
        //GridViewRow row = (GridViewRow)GridViewProduct.Rows[e.RowIndex];
        //Label lblID = (Label)row.FindControl("lblID");

        //SqlConnection con = new SqlConnection(AppSetting.ConnectionString());
        //con.Open();
        ////SqlCommand cmd = new SqlCommand("Update tblBrand set brand=@brand, Action=@Action, CreatedBy=@Createdby, CreatedDate=GETDATE() where Id=@Id", con);

        //SqlCommand cmd = new SqlCommand("delete from tblProduct where pcode = @pcode", con);
        ////SqlCommand cmd = new SqlCommand("sp_Deletebrand", con);

        //cmd.CommandType = System.Data.CommandType.Text;

        //cmd.Parameters.AddWithValue("@pcode", pid);
        //cmd.ExecuteNonQuery();
        //con.Close();

        //Response.Write("<script> alert('Deleted Successfully') </script>");



    }

    protected void GridViewProduct_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //When click on edit make it a textbox
        //Response.Write("<script> alert('Edit Button Clicked') </script>");
        GridViewProduct.EditIndex = e.NewEditIndex;

        // Displaying Record in GridView
        LoadDataIntoGridView();

    }
    
    protected void GridViewProduct_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int pid = Convert.ToInt32(GridViewProduct.DataKeys[e.RowIndex].Value.ToString());
        //We have to find the row. Below this line we will get row index
        GridViewRow row = (GridViewRow)GridViewProduct.Rows[e.RowIndex];

        //CreatingModelDataSourceEventArgs Dynamic control like Label, TextBox

        //while have put the ID in label
        Label lblID = (Label)row.FindControl("lblID");
        
        TextBox txtBarCode = (TextBox)row.Cells[1].Controls[0];
        TextBox txtDesc = (TextBox)row.Cells[2].Controls[0];
        TextBox ddlBrand = (TextBox)row.Cells[3].Controls[0];
        TextBox ddlCategory = (TextBox)row.Cells[4].Controls[0];
        TextBox txtPrice = (TextBox)row.Cells[5].Controls[0];
        TextBox Qty = (TextBox)row.Cells[6].Controls[0];

        GridViewProduct.EditIndex = -1;
        SqlConnection con = new SqlConnection(AppSetting.ConnectionString());
        con.Open();
        SqlCommand cmd = new SqlCommand("update tblProduct set barcode=@barcode, pdesc=@pdesc, price=@price, brandid=@brandid, categoryid=@categoryid, qty=@qty where pcode=@pcode ", con);
        cmd.Parameters.AddWithValue("@pcode", pid);
        cmd.Parameters.AddWithValue("@barcode", txtBarCode.Text);
        cmd.Parameters.AddWithValue("@pdesc", txtDesc.Text);
        cmd.Parameters.AddWithValue("@brandid", ddlBrand.Text);
        cmd.Parameters.AddWithValue("@categoryid", ddlBrand.Text);
        cmd.Parameters.AddWithValue("@price", txtPrice.Text);
        cmd.Parameters.AddWithValue("@qty", txtQty.Text);

        cmd.ExecuteNonQuery();
        con.Close();



        Response.Write("<script> alert('Update Button Clicked') </script>");
       

        // Displaying Record in GridView
        LoadDataIntoGridView();




    }
}