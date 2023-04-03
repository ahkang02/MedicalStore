﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="MedicalStore.Receipt" %>

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
                            <h3 class="mb-0">Invoice #BBB10234</h3>
                            Date: 12 Jun,2019
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-sm-6">
                                <h5 class="mb-3">Billed To:</h5>
                                <h3 class="text-dark mb-1">Tejinder Singh</h3>
                                <div>29, Singla Street</div>
                                <div>Sikeston,New Delhi 110034</div>
                                <div>Email: contact@bbbootstrap.com</div>
                                <div>Phone: +91 9897 989 989</div>
                                <br>
                                <div>Payment Method : </div>
                            </div>
                            <div class="col-sm-6 ">
                                <h5 class="mb-3">Shipped To:</h5>
                                <h3 class="text-dark mb-1">Akshay Singh</h3>
                                <div>478, Nai Sadak</div>
                                <div>Chandni chowk, New delhi, 110006</div>
                                <div>Email: info@tikon.com</div>
                                <div>Phone: +91 9895 398 009</div>

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
                                        <td class="left strong">Iphone 10X</td>
                                        <td class="left">Iphone 10X with headphone</td>
                                        <td class="right">$1500</td>
                                        <td class="center">10</td>
                                        <td class="right">$15,000</td>
                                    </tr>
                                    <tr>
                                        <td class="center">2</td>
                                        <td class="left">Iphone 8X</td>
                                        <td class="left">Iphone 8X with extended warranty</td>
                                        <td class="right">$1200</td>
                                        <td class="center">10</td>
                                        <td class="right">$12,000</td>
                                    </tr>
                                    <tr>
                                        <td class="center">3</td>
                                        <td class="left">Samsung 4C</td>
                                        <td class="left">Samsung 4C with extended warranty</td>
                                        <td class="right">$800</td>
                                        <td class="center">10</td>
                                        <td class="right">$8000</td>
                                    </tr>
                                    <tr>
                                        <td class="center">4</td>
                                        <td class="left">Google Pixel</td>
                                        <td class="left">Google prime with Amazon prime membership</td>
                                        <td class="right">$500</td>
                                        <td class="center">10</td>
                                        <td class="right">$5000</td>
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
                                            <td class="right">$28,809,00</td>
                                        </tr>
                                        <tr>
                                            <td class="left">
                                                <strong class="text-dark">Shipment Fee</strong>
                                            </td>
                                            <td class="right">$2,304,00</td>
                                        </tr>
                                        <tr>
                                            <td class="left">
                                                <strong class="text-dark">Total</strong>
                                            </td>
                                            <td class="right">
                                                <strong class="text-dark">$20,744,00</strong>
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
