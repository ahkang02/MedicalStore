<%@ Page Title="Customer Maintenance" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CustomerMaintenance.aspx.cs" Inherits="MedicalStore.Admin.CustomerMaintenance" %>

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
                        <asp:TextBox ID="txtNameNew" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNameNew" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNameNew" ErrorMessage="No numeric &amp; special characters e.g. @!#%.&quot;" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="mb-3">
                        <label for="Gender" class="form-label">Gender</label>
                        <asp:DropDownList ID="ddlGenderNew" runat="server" CssClass="form-control">
                            <asp:ListItem Value="" Selected="True">Select</asp:ListItem>
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="ddlGenderNew" InitialValue="Please Select" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="mb-3">
                        <label for="Address" class="form-label">Email</label>
                        <asp:TextBox ID="txtEmailNew" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmailNew" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailNew" ErrorMessage="Invalid email format. !#%.&quot;" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="mb-3">
                        <label for="Address" class="form-label">Address</label>
                        <asp:TextBox ID="txtAddressNew" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddressNew" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>
                    <div class="mb-3">
                        <label for="ContactNumber" class="form-label">Contact Number</label>
                        <asp:TextBox ID="txtContactNew" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtContactNew" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtContactNew" ErrorMessage="Invalid phone number format. eg: 01267938478" ForeColor="Red" ValidationExpression="^(01)[0-46-9]*[0-9]{7,8}$"></asp:RegularExpressionValidator>


                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Username</label>
                        <asp:TextBox ID="txtUsernameNew" runat="server" CssClass="form-control" />
                        <asp:Label ID="lblUsernameExists" runat="server" ForeColor="Red"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtUsernameNew" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Password</label>
                        <asp:TextBox ID="txtPasswordNew" runat="server" CssClass="form-control" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPasswordNew" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtPasswordNew" ErrorMessage="Password shall be atleast eight characters,one letter, one number and one special character" ForeColor="Red" ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <asp:Button ID="btnSubmitNew" CssClass="btn btn-primary" Text="Save changes" runat="server" OnClick="btnSubmitNew_Click" CausesValidation="false"/>
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
                        <asp:Button ID="btnEdit" CssClass="btn btn-sm btn-primary ms-2" Text="Edit" runat="server" CommandName="Edit" CommandArgument='<%#Eval ("CustomerID") %>' UseSubmitBehavior="false" CausesValidation="false" />
                        <asp:Button ID="btnDelete" CssClass="btn btn-sm btn-danger ms-2" Text="Delete" runat="server" CommandName="Delete" CommandArgument='<%#Eval ("CustomerID") %>' UseSubmitBehavior="false" OnClientClick="if (!confirm('Are you sure you want delete?')) return false;" CausesValidation="false"/>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="EditModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="EditModalLabel">Edit Customer</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="Name" class="form-label">Customer Name</label>
                            <asp:TextBox ID="txtNameEdit" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtNameEdit" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtNameEdit" ErrorMessage="No numeric &amp; special characters e.g. @!#%.&quot;" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="mb-3">
                            <label for="Gender" class="form-label">Gender</label>
                            <asp:DropDownList ID="ddlGenderEdit" runat="server" CssClass="form-control">
                                <asp:ListItem Value="" Selected="True">Select</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="ddlGenderEdit" InitialValue="Please Select" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <label for="Address" class="form-label">Email</label>
                            <asp:TextBox ID="txtEmailEdit" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtEmailEdit" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtEmailEdit" ErrorMessage="Invalid email format. !#%.&quot;" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="mb-3">
                            <label for="Address" class="form-label">Address</label>
                            <asp:TextBox ID="txtAddressEdit" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtAddressEdit" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                        </div>
                        <div class="mb-3">
                            <label for="ContactNumber" class="form-label">Contact Number</label>
                            <asp:TextBox ID="txtContactEdit" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtContactEdit" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtContactEdit" ErrorMessage="Invalid phone number format. eg: 01267938478" ForeColor="Red" ValidationExpression="^(01)[0-46-9]*[0-9]{7,8}$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Password</label>
                            <asp:TextBox ID="txtPasswordEdit" runat="server" CssClass="form-control" TextMode="Password" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtPasswordEdit" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtPasswordEdit" ErrorMessage="Password shall be atleast eight characters,one letter, one number and one special character" ForeColor="Red" ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"></asp:RegularExpressionValidator>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customers] WHERE Status &lt;&gt; @Status">
            <SelectParameters>
                <asp:Parameter DefaultValue="Inactive Account (Removed)" Name="Status" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
