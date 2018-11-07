<%@ Page Language="C#" MasterPageFile="~/Layout.Master" Title="Login" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MApp.Login" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="Server">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.28.5/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.28.5/dist/sweetalert2.min.css" />
    <script src="scripts/login.js"></script>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="Server">
    <div class="jumbotron text-center">
        <h1>Login</h1>
        <p>Resize this responsive page to see the effect!</p>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <%: ViewState["result"] %>
            </div>

            <div class="col-sm-4">
                <h2>Login</h2>
                <form class="form-horizontal" action="login.aspx" method="post">
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="email">Email:</label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="pass">Password:</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" id="pass" placeholder="Enter password" name="pass" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-8">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="remember" />
                                    Remember me</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-8">
                            <button type="submit" class="btn btn-default">Submit</button>
                        </div>
                    </div>
                </form>
            </div>

            <div class="col-sm-4">
                <kbd>ctrl + p</kbd>
                <button type="button" class="btn">Basic</button>
                <button type="button" class="btn btn-default" id="but">Click</button>
                <button type="button" class="btn btn-primary">Primary</button>
                <button type="button" class="btn btn-success">Success</button>
                <button type="button" class="btn btn-info">Info</button>
                <button type="button" class="btn btn-warning">Warning</button>
                <button type="button" class="btn btn-danger">Danger</button>
                <button type="button" class="btn btn-link">Link</button>
                <a href="#" class="tt" data-toggle="tooltip" title="Hooray!">ToolTip</a>
            </div>
        </div>
    </div>
</asp:Content>
