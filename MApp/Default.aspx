<%@ Page Language="C#" MasterPageFile="~/Layout.Master" Title="Login" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MApp.Default" %>


<asp:Content ID="C1" ContentPlaceHolderID="head" runat="Server">
    <script src="scripts/core.js"></script>
</asp:Content>

<asp:Content ID="C2" ContentPlaceHolderID="body" runat="Server">

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog" id="innerModal">
            <!-- Modal content-->
            <div class="modal-content" id="myModalContent">
                <div class="modal-header">
                    <button id="modalClose" type="button" class="close" data-dismiss="modal">&times;</button>
                    <table>
                        <tr>
                            <td>
                                <button type="submit" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-user" /></button>
                            </td>
                            <td>
                                <button type="button" class="logout-40x40" style="border: none; padding: 0; cursor: pointer;" data-dismiss="modal"></button>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-body" id="myModalBody">
                    <iframe id="modalFrame"></iframe>
                </div>
            </div>
        </div>
    </div>

    <div class="jumbotron text-center">
        <h1>Login</h1>
        <p>Resize this responsive page to see the effect!</p>
        <button type="button" class="btn btn-primary" id="btnConsulta" data-target="#myModal" data-toggle="modal">
            <asp:Label runat="server" ID="lbConsulta" Text="Consulta"></asp:Label>
        </button>
    </div>
</asp:Content>
