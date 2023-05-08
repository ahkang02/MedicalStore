<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DeliveryReport.aspx.cs" Inherits="MedicalStore.Admin.DeliveryReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h1 class="text-center mb-4">Delivery Report</h1>
        <div class="table-responsive">

            <table class="table table-striped">
                <thead>
                    <tr>

                        <th>Delivery Status</th>
                        <th>Count</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Order Received</td>
                        <td>
                            <asp:Label ID="lblCustCnt" runat="server" Text=""></asp:Label></td>

                    </tr>
                    <tr>
                        <td>In-Transit</td>
                        <td>
                            <asp:Label ID="lblStaffCnt" runat="server" Text=""></asp:Label></td>

                    </tr>
                    <tr>
                        <td>Out For Delivery</td>
                        <td>
                            <asp:Label ID="lblManagerCnt" runat="server" Text=""></asp:Label></td>

                    </tr>
                    <tr>
                        <td>Delivered</td>
                        <td>
                            <asp:Label ID="lblAdminCnt" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Completed</td>
                        <td>
                            <asp:Label ID="lblComplete" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Label ID="lblTotalCnt" runat="server" Text=""></asp:Label></td>

                    </tr>
                </tbody>
            </table>

        </div>
    </div>
</asp:Content>
