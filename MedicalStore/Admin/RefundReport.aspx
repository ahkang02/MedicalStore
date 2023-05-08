<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="RefundReport.aspx.cs" Inherits="MedicalStore.Admin.RefundReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h1 class="text-center mb-4">Refund Report</h1>
        <div class="table-responsive">

            <table class="table table-striped">
                <thead>
                    <tr>

                        <th>Refund Status</th>
                        <th>Count</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>In-Progress</td>
                        <td>
                            <asp:Label ID="lblInProgress" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Accept</td>
                        <td>
                            <asp:Label ID="lblCustCnt" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Reject</td>
                        <td>
                            <asp:Label ID="lblStaffCnt" runat="server" Text=""></asp:Label></td>

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
