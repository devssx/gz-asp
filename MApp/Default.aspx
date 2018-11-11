<%@ Page Language="C#" MasterPageFile="~/Layout.Master" Title="Login" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MApp.Default" %>


<asp:Content ID="C1" ContentPlaceHolderID="head" runat="Server">
    <script src="scripts/core.js"></script>
</asp:Content>

<asp:Content ID="C2" ContentPlaceHolderID="body" runat="Server">

    <!-- Modal -->
    <div class="modal fade" id="mw" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <table>
                        <tr>
                            <td>
                                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-user" /></button>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-body">
                    <iframe id="mwFrame"></iframe>
                </div>
            </div>
        </div>
    </div>

    <div class="jumbotron text-center">
        <h1>Login</h1>
        <p>Resize this responsive page to see the effect!</p>
        <button type="button" class="btn btn-primary" id="btnConsulta">
            <asp:Label runat="server" ID="lbConsulta" Text="Show Modal"></asp:Label>
        </button>
    </div>
</asp:Content>
