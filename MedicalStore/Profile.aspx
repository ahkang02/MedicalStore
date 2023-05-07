<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="MedicalStore.Profile" %>

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
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3 active">
                                        <i class="fas fa-user fa-lg text-warning"></i>
                                        <asp:LinkButton ID="lbProfile" Text="Profile" CssClass="mb-0 text-decoration-none text-black" runat="server" OnClick="lbProfile_Click"></asp:LinkButton>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center p-3">
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
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Full Name</p>
                                </div>
                                <div class="col-sm-9">
                                    <asp:Label ID="lblName" runat="server" CssClass="text-muted mb-0"></asp:Label>
                                    
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Email</p>
                                </div>
                                <div class="col-sm-9">
                                    <asp:Label ID="lblEmail" runat="server" CssClass="text-muted mb-0"></asp:Label>
                                    
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Gender</p>
                                </div>
                                <div class="col-sm-9">
                                    <asp:Label ID="lblGender" runat="server" CssClass="text-muted mb-0"></asp:Label>
                                    
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Contact Number</p>
                                </div>
                                <div class="col-sm-9">
                                    <asp:Label ID="lblContactNo" runat="server" CssClass="text-muted mb-0"></asp:Label>
                                    
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Address</p>
                                </div>
                                <div class="col-sm-9">
                                    <asp:Label ID="lblAddress" runat="server" CssClass="text-muted mb-0"></asp:Label>
                                    
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Password</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">Password</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-end">
                        <asp:Button ID="editBtn" runat="server" CssClass="btn btn-lg btn-primary" Text="Edit" OnClick="editBtn_Click" />
                    </div>
                </div>
            </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
