<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="MedicalStore.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <style>
        
    </style>


    <div class="card-deck">

        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ProductID" DataSourceID="SqlDataSource1">


            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>

            <ItemTemplate>
                <tr style="">
                    <td>

                        <div class="card" style="width: 18rem;">
                            <img src="Images/ProductImg/<%# Eval("ImageName") %>" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Name") %></h5>
                                <h5 class="card-subtitle mb-2 text-muted"><%# Eval("Price") %></h5>
                                <p class="card-text"><%# Eval("Description") %></p>
                                <a href="#" class="btn btn-primary">Add to cart</a>
                            </div>
                        </div>

                    </td>

                </tr>
            </ItemTemplate>


        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
    </div>

</asp:Content>


