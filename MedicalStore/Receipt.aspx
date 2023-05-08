<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="MedicalStore.Receipt" %>

<!DOCTYPE html>

<link href="Content/bootstrap.min.css" rel="stylesheet" />
<script src="Scripts/bootstrap.js"></script>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Receipt</title>
    <style type="text/css">
        .auto-style1 {
            font-weight: bold;
        }

        .auto-style2 {
            text-align: center;
            width: 724px;
        }

        .auto-style3 {
            width: 724px;
        }
    </style>
</head>
<body>
    <form id="receipt" runat="server">
        <div class="container">
            <div class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 padding">
                <div class="card">
                    <div class="card-header p-4">
                        <div class="float-right">
                            <h3 class="mb-0">Order ID: <asp:Label ID="lblOrderID" runat="server"></asp:Label></h3>
                            Date: <asp:Label ID="lblOrderDate" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-sm-6">
                                <h5 class="mb-3">Payment Method : </h5>
                                <div><asp:Label ID="lblPaymentMethod" runat="server"></asp:Label></div>
                            </div>
                            <div class="col-sm-6 ">
                                <h5 class="mb-3">Shipped To:</h5>
                                <h3 class="text-dark mb-1"><asp:Label ID="lblDeliveryName" runat="server"></asp:Label></h3>
                                <div><asp:Label ID="lblDeliveryAddress" runat="server"></asp:Label></div>
                                <div>Phone: <asp:Label ID="lblDeliveryPhoneNo" runat="server"></asp:Label></div>

                            </div>
                        </div>
                        <div class="table-responsive-sm">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th class="center">#</th>
                                        <th>Item</th>
                                        <th>Description</th>
                                        <th class="right">Price</th>
                                        <th class="center">Qty</th>
                                        <th class="right">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="center">1</td>
                                        <td class="left strong">Panadol</td>
                                        <td class="left">Panadol activefast</td>
                                        <td class="right">RM15.00</td>
                                        <td class="center">100</td>
                                        <td class="right">RM1500.00</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-sm-5">
                            </div>
                            <div class="col-lg-4 col-sm-5 ml-auto">
                                <table class="table table-clear">
                                    <tbody>
                                        <tr>
                                            <td class="left">
                                                <strong class="text-dark">Subtotal</strong>
                                            </td>
                                            <td class="right">RM<asp:Label ID="lblSubtotal" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="left">
                                                <strong class="text-dark">Shipment Fee</strong>
                                            </td>
                                            <td class="right">RM<asp:Label ID="lblDeliveryFee" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="left">
                                                <strong class="text-dark">Total</strong>
                                            </td>
                                            <td class="right">
                                                <strong class="text-dark">RM<asp:Label ID="lblPaymentAmount" runat="server"></asp:Label></strong>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <br>
                        <div class="text-center">
                            <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Back" Width="151px" OnClick="Button1_Click1" />
                        </div>
                    </div>
                    <div class="container-fluid">
                        <footer class="py-3">
                            <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                            </ul>
                            <p class="text-center text-muted">© 2023 e-Healthy</p>
                        </footer>
                    </div>
                </div>
            </div>
        </div>


    </form>
</body>
</html>
