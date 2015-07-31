<!-- requires bootstrap 3 based skin -->
<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="View.ascx.cs" Inherits="Sprep.Soo.Dnn.SessionWarning.View" %>
<%@ Register TagPrefix="dnn" TagName="JavaScriptLibraryInclude" Src="~/admin/Skins/JavaScriptLibraryInclude.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement"
    Assembly="DotNetNuke.Web.Client" %>
<asp:Panel ID="ScopeWrapper" runat="server">
    
    <asp:Panel runat="server" CssClass="modal fade" ID="ModalScope">
        <div class="modal-dialog">
            <div class="modal-content">


                <div data-bind="if: SessionTimeout() > 0">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Page Session Ending</h4>
                    </div>
                    <div class="modal-body">
                        <p><strong>Psst! You still there?!</strong></p>
                        <p>Your Page Session will expire in <span data-bind="text: SessionTimeout"></span> minutes. Once it ends all unsaved changes will be lost.</p>
                        <p>Click the Continue button to continue your session</p>
                    </div>
                    <div class="modal-footer">
                        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                            <ContentTemplate>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <asp:LinkButton runat="server" ID="btnContinue" class="btn btn-primary" data-bind="click: resetTimeout">Continue Session</asp:LinkButton>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

                <div data-bind="ifnot: SessionTimeout() > 0">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Page Session Ended</h4>
                    </div>
                    <div class="modal-body">
                        <p>Your Page Session has expired</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>



            </div>
        </div>
    </asp:Panel>
    <%-- <pre data-bind="text: ko.toJSON($root, null, 2)"></pre>  --%>
</asp:Panel>

<dnn:JavaScriptLibraryInclude runat="server" Name="knockout" version="3.1.0" />
<dnn:DnnJsInclude runat="server" FilePath="/desktopmodules/sprep/sessionwarning/js/SessionViewModel.js" />

<script type="text/javascript">

    (function() { //do this to avoid setting global variables
        
        var settings = new Object();
        settings.ScopeWrapper = '<%= ScopeWrapper.ClientID %>';
        settings.SessionTimeout = <%= SessionTimeout %>;
        settings.WarningTimeInMinutes = <%= WarningTimeoutInMinutes %>;
        settings.ModalScope = '<%= ModalScope.ClientID %>';
        settings.UserId = <%= UserInfo.UserID %>;
    
        var vm = new SessionViewModel(settings);
        $(function() {
            ko.applyBindings(vm, $('#' + settings.ScopeWrapper).get(0) );

        });

        vm.onModuleLoad();
    })();

</script>
