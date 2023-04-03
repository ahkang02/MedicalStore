<%@ Page Title="Product Maintenance" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ProductMaintenance.aspx.cs" Inherits="MedicalStore.ProductMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="ms-3">
        <h2>Product Maintenance</h2>
    </div>

    <div class="d-flex container-fluid justify-content-end align-items-end">
        <asp:Button ID="btnNew" CssClass="btn btn-primary" runat="server" data-bs-toggle="modal" data-bs-target="#newModal" Text="New" OnClientClick="return false;"/>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="newModal" tabindex="-1" aria-labelledby="newModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="newModalLabel">Add New Product</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="PDID" class="form-label">Product ID</label>
                        <asp:TextBox ID="txtID" runat="server" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="Name" class="form-label">Product Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                    </div>
                     <div class="mb-3">
                        <label for="Desciption" class="form-label">Product Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="Type" class="form-label">Product Type</label>
                        <asp:TextBox ID="txtType" runat="server" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="Price" class="form-label">Selling Price</label>
                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="PDImage" class="form-label">Product Image</label>
                        <asp:FileUpload ID="fuProduct" runat="server" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="Manufacturer" class="form-label">Manufacturer</label>
                        <asp:DropDownList ID="ddlManufacturer" runat="server" DataSourceID="SqlDataSource1" DataTextField="ManufacturerID" DataValueField="ManufacturerID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ManufacturerID] FROM [Manufacturers]"></asp:SqlDataSource>
                  
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <asp:Button ID="btnSubmit" CssClass="btn btn-primary" Text="Save changes" runat="server" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Repeater -->
    <div class="container-fluid">
        <asp:Repeater ID="repeatUser" runat="server">
            <HeaderTemplate>
                <table class="table table-hover table-responsive table-bordered">
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Product Image</th>
                        <th>Actions</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#DataBinder.Eval(Container.DataItem,"ProductID")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "ProductName") %></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "ProductImage") %></td>
                    <td>
                        <asp:Button ID="btnEdit" CssClass="btn btn-sm btn-primary ms-2" Text="Edit" runat="server" data-bs-toggle="modal" data-bs-target="#editModal" UseSutmitBehavior="false" CommandName="Edit" CommandArgument="" OnClientClick="return false;" />
                        <asp:Button ID="btnDelete" CssClass="btn btn-sm btn-danger ms-2" Text="Delete" runat="server" data-bs-toggle="modal" data-bs-target="#deleteModal" UseSubmitBehavior="false" CommandName="Delete" CommandArgument="" OnClientClick="return false;" />
                    </td>
                </tr>

                <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="editModalLabel">Modal title</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                ...
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="deleteModalLabel">Modal title</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                ...
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
