<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Settings.ascx.cs" Inherits="Sprep.Soo.Dnn.SessionWarning.Settings" %>


<%@ Register TagName="label" TagPrefix="dnn" Src="~/controls/labelcontrol.ascx" %>

	<h2 id="dnnSitePanel-BasicSettings" class="dnnFormSectionHead"><a href="" class="dnnSectionExpanded"><%=LocalizeString("BasicSettings")%></a></h2>
	<fieldset>
        <div class="dnnFormItem">
            <dnn:Label ID="Label1" runat="server" text="Current Session Expiry Time" /> 
 
            <dnn:Label ID="Label2" runat="server" text="Current Session Expiry Time" /> 
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblSetting1" runat="server" /> 
 
            <asp:TextBox ID="txtSetting1" runat="server" />
        </div>
        <%--<div class="dnnFormItem">
            <dnn:label ID="lblSetting2" runat="server" />
            <asp:TextBox ID="txtSetting2" runat="server" />
        </div>--%>
    </fieldset>

