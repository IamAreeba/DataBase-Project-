<%@ Page Title="" Language="C#" MasterPageFile="~/wwwroot/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddRecord.aspx.cs" Inherits="wwwroot_Admin_AddRecord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%; 
            background-color:gray;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3 style="color:forestgreen; text-align:center" >Product Info</h3>

    
    <table class="auto-style1">
        <tr>
            <td>Product ID</td>
            <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Name</td>
            <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Price</td>
            <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button ID="Button1" runat="server" Text="Submit" /></td>
            <td>&nbsp;</td>
        </tr>
    </table>
&nbsp;
</asp:Content>











