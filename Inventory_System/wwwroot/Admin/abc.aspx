<%@ Page Title="" Language="C#" MasterPageFile="~/wwwroot/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="abc.aspx.cs" Inherits="wwwroot_Admin_abc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <%--This is for Head Section--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container mt-3 bg-success p-3">
  <h2>Add Brand Details</h2>


    <div class="mb-3 mt-3">
      <label for="brand">Brand Name:</label>
        <asp:TextBox ID="txtBrand" class="form-control" runat="server" ></asp:TextBox>
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
      <asp:TextBox ID="txtCreatedDate"  class="form-control" runat="server" placeholder="Enter Created Dat"></asp:TextBox>
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

            if (pass != "") {
                alert('Enter Brand Name');
                document.getElementById("txtBrand").focus();

                return false;
            }

            else if (action != "") {
                alert('Enter Action Name');
                document.getElementById("txtAction").focus();

                return false;
            }

            else if (createdBy != "") {
                alert('Enter Created By Name');
                document.getElementById("txtCreatedBy").focus();

                return false;
            }

            else if (createdDate != "") {
                alert('Enter Created Date Name');
                document.getElementById("txtCreatedDate").focus();

                return false;
            } 

            return true;
        }

    </script>

</asp:Content>

