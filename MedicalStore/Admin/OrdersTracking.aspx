<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OrdersTracking.aspx.cs" Inherits="MedicalStore.Admin.OrdersTracking" %>

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
        <h2>Order Tracking</h2>
    </div>
    <!-- Repeater -->
    <div class="container-fluid">
        <asp:Repeater ID="repeatUser" runat="server" OnItemCommand="repeatUser_ItemCommand">
            <HeaderTemplate>
                <table class="table table-hover table-responsive table-bordered">
                    <tr>
                        <th>Delivery ID</th>
                        <th>Delivery Status</th>
                        <th>Delivery Date</th>
                        <th>Delivery Fee</th>
                        <th>Handle By Staff</th>
                        <th>Actions</th>
                    </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td><%#DataBinder.Eval(Container.DataItem,"DeliveryID")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem,"Status")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "Date") %></td>
                    <td>RM<%#DataBinder.Eval(Container.DataItem, "Fee") %></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "Name") %></td>
                    <td>
                        <asp:Button ID="btnUpdate" CssClass="btn btn-sm btn-primary ms-2" Text="Update Status" runat="server" CommandName="Update" CommandArgument='<%#Eval ("DeliveryID") %>' UseSubmitBehavior="false" CausesValidation="false" />
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="EditModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="EditModalLabel">Update Delivery Status</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="Name" class="form-label">Delivery ID</label>
                            <asp:TextBox ID="txtID" runat="server" CssClass="form-control" ReadOnly="true" />
                        </div>
                        <div class="mb-3">
                            <label for="Status" class="form-label">Delivery Status</label>
                            <asp:DropDownList ID="ddlStatusEdit" runat="server" CssClass="form-control">
                                <asp:ListItem Value="Order Received">Order Received</asp:ListItem>
                                <asp:ListItem Value="Packaging">Packaging</asp:ListItem>
                                <asp:ListItem Value="In Transit">In Transit</asp:ListItem>
                                <asp:ListItem Value="Out For Delivery">Out For Delivery</asp:ListItem>
                                <asp:ListItem Value="Delivered">Delivered</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="ddlStatusEdit" InitialValue="Please Select" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <label for="Date" class="form-label">Expected Delivery Date</label>
                            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" ReadOnly="true" />
                        </div>
                        <div class="mb-3">
                            <label for="Fee" class="form-label">Delivery Fee</label>
                            <asp:TextBox ID="txtFee" runat="server" CssClass="form-control" ReadOnly="true" />
                        </div>
                        <div class="mb-3">
                            <label for="Name" class="form-label">Recipient Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ReadOnly="true" />
                        </div>
                        <div class="mb-3">
                            <label for="Address" class="form-label">Recipient Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" ReadOnly="true" />
                        </div>
                        <div class="mb-3">
                            <label for="Name" class="form-label">Recipient Contact</label>
                            <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" ReadOnly="true" />
                        </div>
                        <div class="mb-3">
                            <label for="Name" class="form-label">Delivery Boy</label>
                            <asp:TextBox ID="txtStaffName" runat="server" CssClass="form-control" ReadOnly="true" />
                        </div>
                    </div>
                    <div class="mb-3">
                        <asp:HiddenField ID="hdfID" runat="server" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <asp:Button ID="btnSubmitEdit" CssClass="btn btn-primary" Text="Save changes" runat="server" OnClick="btnSubmitEdit_Click" CausesValidation="false" />
                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT D.DeliveryID, D.Status, D.Date, D.Fee, D.Address, S.Name FROM Deliveries D, Orders O, Staffs S Where O.DeliveryID = D.DeliveryID AND D.StaffID = S.StaffID "></asp:SqlDataSource>
    </div>
</asp:Content>
