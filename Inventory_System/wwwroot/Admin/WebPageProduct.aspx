<%@ Page Title="" Language="C#" MasterPageFile="~/wwwroot/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="WebPageProduct.aspx.cs" Inherits="wwwroot_Admin_WebPageProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <%--This is for Head Section--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <%--For Gridview links--%>
    <link rel="stylesheet" href="Content/bootstrap.cosmo.min.css" />
    <link rel="stylesheet" href="Content/StyleSheet.css" />

    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>

    <script type="text/javascript"> 

    $(function () {
        $('[id*= GridViewProduct]').footable();
    });
    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


  <div class="container bg-secondary text-white">
  <h2>&nbsp;Add Product Details</h2>


    <div class="from-group">
      <label for="product code">Product Code:</label>
        <asp:TextBox ID="txtProductID" class="form-control" runat="server" placeholder="Enter PID"></asp:TextBox>
    </div>

    <br />

    <div class="from-group">
      <label for="BarCode">Product Name:</label>
        <asp:TextBox ID="txtBarCode" class="form-control" runat="server" placeholder="Enter BarCode"></asp:TextBox>
    </div>

    <br />

    <div class="from-group">
      <label for="#">Description (PName) :</label>
      <asp:TextBox ID="txtDesc" class="form-control" runat="server" placeholder="Enter Description or Product Name"></asp:TextBox>     
    </div>

    <br />

    <div class="from-group">
      <label for="Brand">Select Brand:</label>
        <asp:DropDownList ID="ddlBrand" class="form-control" runat="server">
            <asp:ListItem>Nokia</asp:ListItem>
            <asp:ListItem>Motrolla</asp:ListItem>
            <asp:ListItem>Vivo</asp:ListItem>
        </asp:DropDownList>
    </div>

    <br />

    <div class="from-group">
      <label for="Category">Category:</label>
      <asp:DropDownList ID="ddlCategory" class="form-control" runat="server">
          <asp:ListItem>TV</asp:ListItem>
          <asp:ListItem>Mobile</asp:ListItem>
          <asp:ListItem>Other Electronic</asp:ListItem>
        </asp:DropDownList>
    </div>
    
    <br />

    <div class="from-group">
      <label for="Price">Price:</label>
        <asp:TextBox ID="txtPrice" class="form-control" runat="server" placeholder="Enter Price"></asp:TextBox>
    </div>

    <br />

    <div class="from-group">
      <label for="Qty">Quantity:</label>
        <asp:TextBox ID="txtQty" class="form-control" runat="server" placeholder="Enter Quantity"></asp:TextBox>
    </div>

    <br />

    <asp:button runat="server" text="Submit" ID="btnSubmit" class="btn btn-primary" OnClick="btnSubmit_Click" />
    <br />
     <br />

</div>
    <br />
    <br />

    <%--Working on GridView--%>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:GridView ID="GridViewProduct" runat="server" DataKeyNames="pcode"
        style="max-width: 100% " CssClass="footable" BackColor="White" BorderColor="#3366CC"
        BorderWidth="1px" CellPadding="4" HorizontalAlign="Center" AutoGenerateColumns="false"
        OnPageIndexChanging="GridViewProduct_PageIndexChanging" OnRowCancelingEdit="GridViewProduct_RowCancelingEdit"
         OnRowDeleting="GridViewProduct_RowDeleting" OnRowEditing="GridViewProduct_RowEditing" OnRowUpdating="GridViewProduct_RowUpdating" >

        <HeaderStyle Font-Bold="true" HorizontalAlign="center" BorderWidth="1px" />

        <Columns>
            <%--the no of records you want to display you have to add that quantity of bounded field--%>
            
            <%--If u want to take the data from db and display it on Gridview use bound field--%>

            <asp:BoundField DataField="pcode" HeaderText="Product Code" />
            <asp:BoundField DataField="barcode" HeaderText="Bar Code" />
            <asp:BoundField DataField="pdesc" HeaderText="Product Description" />
            <asp:BoundField DataField="brandid" HeaderText="BrandID"  Visible="false"/>
            <asp:BoundField DataField="categoryid" HeaderText="CategoryID" Visible="false" />
            <asp:BoundField DataField="price" HeaderText="Price" />
            <asp:BoundField DataField="qty" HeaderText="Quantity" />
            <asp:BoundField DataField="reorder" HeaderText="Reorder" />

            <%--Adding 2 buttons--%>
            <asp:CommandField ShowEditButton="true" />
            <asp:CommandField ShowDeleteButton="true" />


        </Columns>

    </asp:GridView>
   


</asp:Content>

