<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="MedicalStore.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section style="background-color: #eee;">
        <div class="container py-5">
            <div class="row">
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
                                class="rounded-circle img-fluid" style="width: 150px;">
                            <h5 class="my-3">User</h5>
                            <div class="row">
                                <ul class="list-group list-group-flush rounded-3">
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <i class="fas fa-user fa-lg text-warning"></i>
                                        <asp:LinkButton ID="lbProfile" Text="Profile" CssClass="mb-0 text-decoration-none text-black" runat="server" OnClick="lbProfile_Click"></asp:LinkButton>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3 active">
                                        <i class="fa-solid fa-bag-shopping" style="color: #333333;"></i>
                                        <asp:LinkButton ID="lbOrder" Text="Order History" CssClass="mb-0 text-decoration-none text-black" runat="server" OnClick="lbOrder_Click"></asp:LinkButton>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <i class="fa-solid fa-truck-fast" style="color: #55acee;"></i>
                                        <asp:LinkButton ID="lbDelivery" Text="Delivery Tracking" CssClass="mb-0 text-decoration-none text-black" runat="server" OnClick="lbDelivery_Click"></asp:LinkButton>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 text-center">
                    <h1>Order History</h1>
                    <asp:Repeater ID="repeaterOrder" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <table class="table table-hover table-striped table-bordered table-responsive">
                                <tr>
                                    <th>Order ID</th>
                                    <th>Order DeliveryID</th>
                                    <th>Order Mode</th>
                                    <th>Order Date</th>
                                    <th>Total Amount</th>
                                    <th>Refund</th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#DataBinder.Eval(Container.DataItem, "OrderID") %></td>
                                <td><%#DataBinder.Eval(Container.DataItem, "DeliveryID") %></td>
                                <td><%#DataBinder.Eval(Container.DataItem, "Status") %></td>
                                <td><%#DataBinder.Eval(Container.DataItem, "OrderDate") %></td>
                                <td><%#DataBinder.Eval(Container.DataItem, "TotalAmount") %></td>
                                 <td>
                                     <asp:Button ID="btnRefund" CssClass="btn btn-primary btn-lg" runat="server" OnClick="btnRefund_Click" Text="Request Refund" Visible='<%# Eval("Status").ToString() != "Delivered" %>' CommandArgument='<%#DataBinder.Eval(Container.DataItem, "OrderID") %>'
                PostBackUrl='<%# "~/Refund.aspx?OrderID=" + DataBinder.Eval(Container.DataItem, "OrderID") %>'/>
                                     <asp:Button ID="btnNone" CssClass="btn btn-primary btn-lg" style="background-color: darkgrey;" runat="server"  Text="None" Visible='<%# Eval("Status").ToString() == "Delivered" %>' />        
                                 </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM Orders WHERE CustomerID = @CustomerID">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="CustomerID" SessionField="customerID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
