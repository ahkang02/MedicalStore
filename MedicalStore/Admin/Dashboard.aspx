<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="MedicalStore.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ms-3 text-center">
        <h2>Main Dashboard</h2>
    </div>
    <section class="mt-3">
        <div class="text-center mb-3">
            <h2>Analytics of E-Healthy Dashboard</h2>
        </div>
        <div class="row">
            <div class="col-xl-3 col-sm-6 col-12 mb-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between px-md-1">
                            <div class="align-self-center">
                                <i class="fas fa-pencil-alt text-info fa-3x"></i>
                            </div>
                            <div class="text-end">
                                <asp:Label ID="lblProducts" runat="server" CssClass="h3"></asp:Label>
                                <p class="mb-0">Total Products</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-12 mb-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between px-md-1">
                            <div class="align-self-center">
                                <i class="far fa-heart text-danger fa-3x"></i>
                            </div>
                            <div class="text-end">
                                <asp:Label ID="lblSales" runat="server" CssClass="h3"></asp:Label>
                                <p class="mb-0">Total Sales</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-12 mb-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between px-md-1">
                            <div class="align-self-center">
                                <i class="fas fa-sack-xmark text-success fa-3x"></i>
                            </div>
                            <div class="text-end">
                                <asp:Label ID="lblRefund" runat="server" CssClass="h3"></asp:Label>
                                <p class="mb-0">Total Refunds</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-12 mb-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between px-md-1">
                            <div class="align-self-center">
                                <i class="fas fa-cart-shopping text-danger fa-3x"></i>
                            </div>
                            <div class="text-end">
                                <asp:Label ID="lblOrders" runat="server" CssClass="h3"></asp:Label>
                                <p class="mb-0">Total Orders</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-3 col-sm-6 col-12 mb-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between px-md-1">
                            <div>
                                <asp:Label ID="lblUsers" runat="server" CssClass="h3"></asp:Label>
                                <p class="mb-0">Total Users</p>
                            </div>
                            <div class="align-self-center">
                                <i class="fas fa-user text-danger fa-3x"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-12 mb-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between px-md-1">
                            <div>
                                <asp:Label ID="lblCustomers" runat="server" CssClass="h3"></asp:Label>
                                <p class="mb-0">Total Customers</p>
                            </div>
                            <div class="align-self-center">
                                <i class="far fa-user text-success fa-3x"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-12 mb-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between px-md-1">
                            <div>
                                <asp:Label ID="lblStaff" runat="server" CssClass="h3"></asp:Label>
                                <p class="mb-0">Total Staffs</p>
                            </div>
                            <div class="align-self-center">
                                <i class="fas fa-user text-warning fa-3x"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 col-12 mb-4">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between px-md-1">
                            <div>
                                <asp:Label ID="lblManager" runat="server" CssClass="h3"></asp:Label>
                                <p class="mb-0">Total Managers</p>
                            </div>
                            <div class="align-self-center">
                                <i class="far fa-user text-info fa-3x"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--Section: Minimal statistics cards-->

    <section class="mt-4 mb-4 w-100">
                <div class="text-center mb-3">
            <h2>Statistical Chart</h2>
        </div>
        <div class="card">
            <div class="card-header py-3">
                <h5 class="mb-0 text-center"><strong>Sales By Date</strong></h5>
            </div>
            <div class="card-body">
                <canvas class="my-4 w-100" id="myChart" height="380"></canvas>
            </div>
        </div>
    </section>

    <div>
        <asp:Literal ID="jsCodeLiteral" runat="server"></asp:Literal>
    </div>

</asp:Content>
