<%@ Page Title="Product Maintenance" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ProductMaintenance.aspx.cs" Inherits="MedicalStore.ProductMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function showEditModal() {
            var editModal = new bootstrap.Modal(document.getElementById('editModal'));
            editModal.show();
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="ms-3">
        <h2>Product Maintenance</h2>
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
                        <label for="Name" class="form-label">Product Name</label>
                        <asp:TextBox ID="txtNameNew" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtNameNew" ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNameNew" ErrorMessage="No numeric &amp; special characters e.g. @!#%.&quot;" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="mb-3">
                        <label for="Desciption" class="form-label">Product Description</label>
                        <asp:TextBox ID="txtDescriptionNew" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtDescriptionNew" ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtDescriptionNew" ErrorMessage="No numeric &amp; special characters e.g. @!#%.&quot;" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="mb-3">
                        <label for="Type" class="form-label">Product Type</label>
                        <asp:DropDownList ID="ddlProductTypeNew" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Select" Selected="True">Select</asp:ListItem>
                            <asp:ListItem Value="Liquid">Liquid</asp:ListItem>
                            <asp:ListItem Value="Tablet">Tablet</asp:ListItem>
                            <asp:ListItem Value="Capsules">Capsules</asp:ListItem>
                            <asp:ListItem Value="Injections">Injections</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="ddlProductTypeNew" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
                    </div>
                    <div class="mb-3">
                        <label for="Price" class="form-label">Selling Price</label>
                        <asp:TextBox ID="txtPriceNew" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtPriceNew" ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPriceNew" ErrorMessage="No alphabet &amp; special characters e.g. @!#%.&quot;" ForeColor="Red" ValidationExpression="^\d+(,\d{3})*(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="mb-3">
                        <label for="PDImage" class="form-label">Product Image</label>
                        <asp:FileUpload ID="fuProductNew" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="fuProductNew" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="mb-3">
                        <label for="Manufacturer" class="form-label">Manufacturer</label>
                        <asp:DropDownList ID="ddlManufacturerNew" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ManufacturerID" CssClass="form-control">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="ddlManufacturerNew" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ManufacturerID], [Name] FROM [Manufacturers]"></asp:SqlDataSource>
                    </div>
                    <div class="mb-3">
                        <label for="Quantity" class="form-label">Quantity</label>
                        <asp:TextBox ID="txtQtyNew" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="txtQtyNew" ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtQtyNew" ErrorMessage="No alphabet &amp; special characters e.g. @!#%.&quot;" ForeColor="Red" ValidationExpression="^([1-9][0-9]{0,2})$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <asp:Button ID="btnSubmitNew" CssClass="btn btn-primary" Text="Save changes" runat="server" OnClick="btnSubmitNew_Click" CausesValidation="false" />
                </div>
            </div>
        </div>
    </div>

    <!-- Repeater -->
    <div class="container-fluid">
        <asp:Repeater ID="repeatUser" runat="server" OnItemCommand="repeatUser_ItemCommand">
            <HeaderTemplate>
                <table class="table table-hover table-responsive table-bordered">
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Product Image</th>
                        <th>Product Price</th>
                        <th>Product Quantity</th>
                        <th>Actions</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#DataBinder.Eval(Container.DataItem,"ProductID")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "Name") %></td>
                    <td>
                        <img src="../Images/ProductImg/<%#DataBinder.Eval(Container.DataItem, "ImageName") %>" class="img-fluid" style="width: 100px" /></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "Price") %></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "Quantity") %></td>
                    <td>
                        <asp:Button ID="btnEdit" CssClass="btn btn-sm btn-primary ms-2" Text="Edit" runat="server" CommandName="Edit" CommandArgument='<%#Eval ("ProductID") %>' UseSubmitBehavior="false" CausesValidation="false" />
                        <asp:Button ID="btnDelete" CssClass="btn btn-sm btn-danger ms-2" Text="Delete" runat="server" CommandName="Delete" CommandArgument='<%#Eval ("ProductID") %>' UseSubmitBehavior="false" OnClientClick="if (!confirm('Are you sure you want delete?')) return false;" CausesValidation="false"/>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="editModalLabel">Add Edit Customer</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="Name" class="form-label">Product Name</label>
                            <asp:TextBox ID="txtNameEdit" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtNameEdit" ForeColor="Red"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtNameEdit" ErrorMessage="No numeric &amp; special characters e.g. @!#%.&quot;" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="mb-3">
                            <label for="Desciption" class="form-label">Product Description</label>
                            <asp:TextBox ID="txtDescriptionEdit" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtDescriptionEdit" ForeColor="Red"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtDescriptionEdit" ErrorMessage="No numeric &amp; special characters e.g. @!#%.&quot;" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="mb-3">
                            <label for="Type" class="form-label">Product Type</label>
                            <asp:DropDownList ID="ddlProductTypeEdit" runat="server" CssClass="form-control">
                                <asp:ListItem Value="Select" Selected="True">Select</asp:ListItem>
                                <asp:ListItem Value="Liquid">Liquid</asp:ListItem>
                                <asp:ListItem Value="Tablet">Tablet</asp:ListItem>
                                <asp:ListItem Value="Capsules">Capsules</asp:ListItem>
                                <asp:ListItem Value="Injections">Injections</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="ddlProductTypeEdit" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <label for="Price" class="form-label">Selling Price</label>
                            <asp:TextBox ID="txtPriceEdit" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="txtPriceEdit" ForeColor="Red"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtPriceEdit" ErrorMessage="No alphabet &amp; special characters e.g. @!#%.&quot;" ForeColor="Red" ValidationExpression="^\d+(,\d{3})*(\.\d{1,2})?$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="mb-3">
                            <label for="PDImage" class="form-label">Product Image</label>
                            <asp:FileUpload ID="fuProductEdit" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="fuProductEdit" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <label for="Manufacturer" class="form-label">Manufacturer</label>
                            <asp:DropDownList ID="ddlManufacturerEdit" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ManufacturerID" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ControlToValidate="ddlManufacturerEdit" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ManufacturerID], [Name] FROM [Manufacturers]"></asp:SqlDataSource>
                        </div>
                        <div class="mb-3">
                            <label for="Quantity" class="form-label">Quantity</label>
                            <asp:TextBox ID="txtQtyEdit" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ControlToValidate="txtQtyEdit" ForeColor="Red"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtQtyEdit" ErrorMessage="No alphabet &amp; special characters e.g. @!#%.&quot;" ForeColor="Red" ValidationExpression="^([1-9][0-9]{0,2})$"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="mb-3">
                        <asp:HiddenField ID="hdfID" runat="server" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <asp:Button ID="btnSubmitEdit" CssClass="btn btn-primary" Text="Save changes" runat="server" OnClick="btnSubmitEdit_Click" CausesValidation="false"/>
                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
    </div>
</asp:Content>
