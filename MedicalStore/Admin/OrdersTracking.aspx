<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OrdersTracking.aspx.cs" Inherits="MedicalStore.Admin.OrdersTracking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="ms-3">
        <h2>Order Tracking</h2>
    </div>
    <!-- Repeater -->
    <div class="container-fluid">
        <asp:Repeater ID="repeatUser" runat="server" DataSourceID="SqlDataSource1">
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
                    <td>
                        <asp:DropDownList ID="ddlStatus" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Status" DataValueField="Status">
                        </asp:DropDownList>
                    </td>
                    <td><%#DataBinder.Eval(Container.DataItem, "Date") %></td>
                    <td>RM<%#DataBinder.Eval(Container.DataItem, "Fee") %></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "Name") %></td>
                    <td>
                        <asp:Button ID="btnSave" Text="Save" CssClass="btn btn-primary" runat="server" /></td>
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Status] From Deliveries"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT D.DeliveryID, D.Status, D.Date, D.Fee, D.Address, S.Name FROM Deliveries D, Orders O, Staffs S Where O.DeliveryID = D.DeliveryID AND D.StaffID = S.StaffID "></asp:SqlDataSource>
    </div>
</asp:Content>
