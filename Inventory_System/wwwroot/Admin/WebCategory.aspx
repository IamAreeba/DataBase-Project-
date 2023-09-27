<%@ Page Title="" Language="C#" MasterPageFile="~/wwwroot/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="WebCategory.aspx.cs" Inherits="Wwwroot_Admin_WebCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <%--This is for Head Section--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container bg-secondary text-white">
        <br />
  <h2>Add Category Details</h2>


    <div class="form-group">
      <label for="brand">Brand Name:</label>
        <asp:TextBox ID="txtCategory" class="form-control" runat="server" placeholder="Enter Brand"></asp:TextBox>
    </div>
      <br />

        <asp:button runat="server" text="Submit" ID="btnSubmit" class="btn btn-primary"  OnClick="btnSubmit_Click" />
        <br />
        <br />

</div>
    <br />
    <br />
    <hr />


    <%--Using GridView using Ajax--%>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>

            

        </ContentTemplate>
        
    </asp:UpdatePanel>

    <asp:GridView ID="Category" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="bindcat" EmptyDataText="Record not found ..." HorizontalAlign="Center" PageSize="5" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="category" HeaderText="Category Name" SortExpression="category" />
            <asp:BoundField DataField="Action" HeaderText="Action" SortExpression="Action" />
            <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" />
            <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#5D7B9D" BorderStyle="Double" ForeColor="White" Font-Bold="True" />
        <PagerSettings FirstPageText="First" LastPageText="Last" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="bindcat" runat="server" ConnectionString="<%$ ConnectionStrings:conDB %>" DeleteCommand="DELETE FROM [tblCategory] WHERE [id] = @id" InsertCommand="INSERT INTO [tblCategory] ([category], [Action], [CreatedBy], [CreatedDate]) VALUES (@category, @Action, @CreatedBy, @CreatedDate)" SelectCommand="SELECT * FROM [tblCategory]" UpdateCommand="UPDATE [tblCategory] SET [category] = @category, [Action] = @Action, [CreatedBy] = @CreatedBy, [CreatedDate] = @CreatedDate WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="category" Type="String" />
            <asp:Parameter Name="Action" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="category" Type="String" />
            <asp:Parameter Name="Action" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedDate" Type="DateTime" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


    

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


</asp:Content>

 