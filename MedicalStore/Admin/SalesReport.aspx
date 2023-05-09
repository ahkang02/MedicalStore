<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SalesReport.aspx.cs" Inherits="MedicalStore.Admin.SalesReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h1 class="text-center mb-4">Product Report</h1>
        <div class="table-responsive">

            <table class="table table-striped">
                <thead>
                    <tr>

                        <th>Role Name</th>
                        <th>Count</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Capsules</td>
                        <td><asp:Label ID="lblCustCnt" runat="server" Text=""></asp:Label></td>

                    </tr>
                    <tr>
                        <td>Liquid</td>
                        <td><asp:Label ID="lblStaffCnt" runat="server" Text=""></asp:Label></td>

                    </tr>
                    <tr>
                        <td>Injections</td>
                        <td><asp:Label ID="lblManagerCnt" runat="server" Text=""></asp:Label></td>

                    </tr>
                    <tr>
                        <td>Tablets</td>
                        <td><asp:Label ID="lblAdminCnt" runat="server" Text=""></asp:Label></td>

                    </tr>
                    <tr>
                        <td></td>
                        <td><asp:Label ID="lblTotalCnt" runat="server" Text=""></asp:Label></td>

                    </tr>
                </tbody>
            </table>

        </div>
    </div>
</asp:Content>
