<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UserReport.aspx.cs" Inherits="MedicalStore.Admin.CustomerReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h1 class="text-center mb-4">Simple Report</h1>
        <div class="table-responsive">

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th></th>
                        <th>Role Name</th>
                        <th>Number</th>
                        <th>Phone</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>John Doe</td>
                        <td>johndoe@example.com</td>
                        <td>123-456-7890</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Jane Doe</td>
                        <td>janedoe@example.com</td>
                        <td>555-555-5555</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Bob Smith</td>
                        <td>bobsmith@example.com</td>
                        <td>555-123-4567</td>
                    </tr>
                </tbody>
            </table>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Age" HeaderText="Age" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" />
                </Columns>

            </asp:GridView>
        </div>
    </div>
</asp:Content>

