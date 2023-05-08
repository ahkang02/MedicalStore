<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UserReport.aspx.cs" Inherits="MedicalStore.Admin.CustomerReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h1 class="text-center mb-4">User Report</h1>
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
                        <td>Customer</td>
                        <td><asp:Label ID="lblCustCnt" runat="server" Text=""></asp:Label></td>

                    </tr>
                    <tr>
                        <td>Staff</td>
                        <td><asp:Label ID="lblStaffCnt" runat="server" Text=""></asp:Label></td>

                    </tr>
                    <tr>
                        <td>Manager</td>
                        <td><asp:Label ID="lblManagerCnt" runat="server" Text=""></asp:Label></td>

                    </tr>
                    <tr>
                        <td>Admin</td>
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

