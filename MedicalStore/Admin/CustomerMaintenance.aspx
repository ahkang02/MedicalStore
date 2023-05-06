<%@ Page Title="Customer Maintenance" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CustomerMaintenance.aspx.cs" Inherits="MedicalStore.Admin.CustomerMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="ms-3">
        <h2>Customer Maintenance</h2>
    </div>

    <div class="d-flex container-fluid justify-content-end align-items-end">
        <asp:Button ID="btnNew" CssClass="btn btn-primary" runat="server" data-bs-toggle="modal" data-bs-target="#newModal" Text="New" OnClientClick="return false;" />
    </div>

    <!-- Modal -->
    <div class="modal fade" id="newModal" tabindex="-1" aria-labelledby="newModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="newModalLabel">Add New Customer</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="Name" class="form-label">Customer Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="Gender" class="form-label">Gender</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Value="" Selected="True">Select</asp:ListItem>
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label for="Address" class="form-label">Address</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="ContactNumber" class="form-label">Contact Number</label>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Password</label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Password" />
                    </div>
                    <div class="mb-3">
                        <asp:HiddenField ID="hdfRole" runat="server" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <asp:Button ID="btnSubmit" CssClass="btn btn-primary" Text="Save changes" runat="server" />
                </div>
            </div>
        </div>
    </div>

    <!-- Repeater -->
    <div class="container-fluid">
        <asp:Repeater ID="repeatUser" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="repeatUser_ItemCommand">
            <HeaderTemplate>
                <table class="table table-hover table-responsive table-bordered">
                    <tr>
                        <th>Customer ID</th>
                        <th>Customer Name</th>
                        <th>Actions</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#DataBinder.Eval(Container.DataItem,"CustomerID")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "Name") %></td>
                    <td>
                        <asp:Button ID="btnEdit" CssClass="btn btn-sm btn-primary ms-2" Text="Edit" runat="server" data-bs-toggle="modal" data-bs-target="#editModal" UseSutmitBehavior="false" CommandName="Edit" CommandArgument='<%#Eval ("CustomerID") %>' OnClientClick="return false;" />
                        <asp:Button ID="btnDelete" CssClass="btn btn-sm btn-danger ms-2" Text="Delete" runat="server" data-bs-toggle="modal" data-bs-target="#deleteModal" UseSubmitBehavior="false" CommandName="Delete" CommandArgument='<%#Eval ("CustomerID") %>' OnClientClick="return false;" />
                    </td>
                </tr>

                <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="editModalLabel">Edit Customer</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="Name" class="form-label">Customer Name</label>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                                </div>
                                <div class="mb-3">
                                    <label for="Gender" class="form-label">Gender</label>
                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="" Selected="True">Select</asp:ListItem>
                                        <asp:ListItem Value="Male">Male</asp:ListItem>
                                        <asp:ListItem Value="Female">Female</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="mb-3">
                                    <label for="Address" class="form-label">Address</label>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
                                </div>
                                <div class="mb-3">
                                    <label for="ContactNumber" class="form-label">Contact Number</label>
                                    <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" />
                                </div>
                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Password</label>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Password" />
                                </div>
                                <div class="mb-3">
                                    <asp:HiddenField ID="hdfRole" runat="server" />
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" Text="Save changes" runat="server" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
    </div>
</asp:Content>
