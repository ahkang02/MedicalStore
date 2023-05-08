<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminProfile.aspx.cs" Inherits="MedicalStore.Admin.AdminProfile" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                                    <p class="mb-0">ID</p>
                                </div>
                                <div class="col-sm-9">
                                    <asp:Label ID="lblStaffID" runat="server" CssClass="text-muted mb-0"></asp:Label>
                                    
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Full Name</p>
                                </div>
                                <div class="col-sm-9">
                                    <asp:Label ID="lblStaffName" runat="server" CssClass="text-muted mb-0"></asp:Label>
                                    
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Email</p>
                                </div>
                                <div class="col-sm-9">
                                    <asp:Label ID="lblStaffEmail" runat="server" CssClass="text-muted mb-0"></asp:Label>
                                    
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Gender</p>
                                </div>
                                <div class="col-sm-9">
                                    <asp:Label ID="lblStaffGender" runat="server" CssClass="text-muted mb-0"></asp:Label>
                                    
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Contact Number</p>
                                </div>
                                <div class="col-sm-9">
                                    <asp:Label ID="lblStaffContactNo" runat="server" CssClass="text-muted mb-0"></asp:Label>
                                    
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Address</p>
                                </div>
                                <div class="col-sm-9">
                                    <asp:Label ID="lblStaffAddress" runat="server" CssClass="text-muted mb-0"></asp:Label>
                                    
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Role</p>
                                </div>
                                <div class="col-sm-9">
                                    <asp:Label ID="lblRole" runat="server" CssClass="text-muted mb-0"></asp:Label>
                                    
                                </div>
                            </div>
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</asp:Content>
