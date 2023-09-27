<%@ Page Title="" Language="C#" MasterPageFile="~/wwwroot/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Brand.aspx.cs" Inherits="wwwroot_Admin_Brand" %>

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
        $('[id*= GridViewBrand]').footable();
    });
</script>



</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container bg-secondary text-white">
  <h2>Add Brand Details</h2>


    <div class="mb-3 mt-3">
      <label for="brand">Brand Name:</label>
        <asp:TextBox ID="txtBrand" class="form-control" runat="server" placeholder="Enter Brand"></asp:TextBox>
    </div>


    <div class="mb-3">
      <label for="pwd">Action:</label>
      <asp:TextBox ID="txtAction" class="form-control" runat="server" placeholder="Enter Action"></asp:TextBox>     
    </div>


    <div class="mb-3">
      <label for="pwd">Created By:</label>
      <asp:TextBox ID="txtCreatedBy" class="form-control" runat="server" placeholder="Enter Created By"></asp:TextBox>
    </div>

    <div class="mb-3">
      <label for="pwd">Created Date:</label>
      <asp:TextBox ID="txtCreatedDate"  class="form-control" runat="server" placeholder="Enter Created Date"></asp:TextBox>
    </div>
    

        <asp:button runat="server" text="Submit" ID="btnSubmit" class="btn btn-primary"  OnClick="btnSubmit_Click" onClientClick="return Validate()" />
        <br />

</div>
    <br />
    <br />
    

    <%--JS code for Validation--%>
    <script type="text/javascript">

        function Validate() {
            var brand = document.getElementById("txtBrand").value;
            var action = document.getElementById("txtAction").value;
            var createdBy = document.getElementById("txtCreatedBy").value;
            var createdDate = document.getElementById("txtCreatedDate").value;

            if (brand != "") {
                alert('Enter Brand Name');
                document.getElementById("txtBrand").focus();

                return false;
            }

            //else if (action != "") {
            //    alert('Enter Action Name');
            //    document.getElementById("txtAction").focus();

            //    return false;
            //}

            //else if (createdBy != "") {
            //    alert('Enter Created By Name');
            //    document.getElementById("txtCreatedBy").focus();

            //    return false;
            //}

            //else if (createdDate != "") {
            //    alert('Enter Created Date Name');
            //    document.getElementById("txtCreatedDate").focus();

            //    return false;
            //}

            return true;
        }
    </script>

    
    <%--Including Grid View--%>
    <hr />
    <asp:GridView ID="GridViewBrand" runat="server" EmptyDataText="Record not found"
        Style="max-width: 100%" CssClass="footable" CellPadding="4" AutoGenerateColumns="False"  
        HorizontalAlign="Center" OnPageIndexChanging="GridViewBrand_PageIndexChanging"
        OnRowCancelingEdit="GridViewBrand_RowCancelingEdit" OnRowDeleting="GridViewBrand_RowDeleting"
        OnRowEditing="GridViewBrand_RowEditing" OnRowUpdating="GridViewBrand_RowUpdating"
         DataKeyNames="Id" ForeColor="#333333" GridLines="None" >

        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Brand Id" />
            <asp:BoundField DataField="brand" HeaderText="Brand Name" />
            <asp:BoundField DataField="Action" HeaderText="Activity" />
            <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" />
            <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" />

            <asp:CommandField ShowEditButton="true" />
            <asp:CommandField ShowDeleteButton="true" />


        </Columns>
        
        
            
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        
        
            
    </asp:GridView>

    <br />

</asp:Content>

