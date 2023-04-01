<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Delivery.aspx.cs" Inherits="MedicalStore.Delivery" %>
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
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <i class="fa-solid fa-bag-shopping" style="color: #333333;"></i>
                                        <asp:LinkButton ID="lbOrder" Text="Order History" CssClass="mb-0 text-decoration-none text-black" runat="server" OnClick="lbOrder_Click"></asp:LinkButton>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3 active">
                                        <i class="fa-solid fa-truck-fast" style="color: #55acee;"></i>
                                        <asp:LinkButton ID="lbDelivery" Text="Delivery Tracking" CssClass="mb-0 text-decoration-none text-black" runat="server" OnClick="lbDelivery_Click"></asp:LinkButton>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 text-center">
                    <h1>Delivery Tracking History</h1>
                    <asp:Repeater ID="repeaterOrder" runat="server">
                        <HeaderTemplate>
                            <table class="table table-hover table-striped table-bordered table-responsive">
                                <tr>
                                    <th>Delivery ID</th>
                                    <th>Delivery Date</th>
                                    <th>Delivery Fee</th>
                                    <th>Delivery Address</th>
                                    <th>Delivery Status</th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#DataBinder.Eval(Container.DataItem, "DeliveryID") %></td>
                                <td><%#DataBinder.Eval(Container.DataItem, "DeliveryDate") %></td>
                                <td><%#DataBinder.Eval(Container.DataItem, "DeliveryFee") %></td>
                                <td><%#DataBinder.Eval(Container.DataItem, "DeliveryAddress") %></td>
                                <td><%#DataBinder.Eval(Container.DataItem, "DeliveryStatus") %></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
