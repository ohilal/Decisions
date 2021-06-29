<%@ Page Title="statstics" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DecStatistics.aspx.cs" Inherits="Members_DecStatistics"  %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    .auto-style1 {
        direction: ltr;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h2 class="text-info text-center">إحصائيات</h2>
    <div class="row form-inline">
   <label class="col-form-label"> التاريخ من </label> 
    <asp:TextBox ID="txtdecfrom" runat="server" TextMode="Date" CssClass="form-control col-3"></asp:TextBox>
                <%--<cc1:CalendarExtender ID="txtdecfrom_CalendarExtender" runat="server" SelectedDate="<%# DateTime.Now %>"
                    Enabled="True" TargetControlID="txtdecfrom" Format="MM/dd/yyyy">
                </cc1:CalendarExtender>--%>
    &nbsp;
       <label class="col-form-label"> إلى  </label>     
                <asp:TextBox ID="txtdecto" runat="server" TextMode="Date" CssClass="form-control col-3"></asp:TextBox>
                <%--<cc1:CalendarExtender ID="txtdecto_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtdecto" Format="MM/dd/yyyy">
                </cc1:CalendarExtender>--%>
           &nbsp;
   <asp:Button ID="btnsearch" runat="server" Text="تقرير" CssClass="btn btn-info btn-lg "/></div>
    <div class="container topMargin">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1" CssClass="table table-striped" Width="50%">
        <Columns>
            <asp:BoundField DataField="decType" HeaderText="نوع القرار" 
                SortExpression="decType" />
            <asp:BoundField DataField="total" HeaderText="المجموع" ReadOnly="True" 
                SortExpression="total" ItemStyle-Width="20%" >
<ItemStyle Width="20%"></ItemStyle>
            </asp:BoundField>
        </Columns>
    </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="select decType,COUNT(* ) as [total] from dbo.decisions_Info 

inner join dbo.decision_Types on dbo.decisions_Info.decTypeID=decision_Types.decTypeID

where (decDate between @fromdate and @todate) 
 group by dbo.decision_Types.decType">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtdecfrom" Name="fromdate" 
            PropertyName="Text" />
        <asp:ControlParameter ControlID="txtdecto" Name="todate" PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource> 
    

  
             <br/>

       
   
        <asp:chart runat="server" ID="ctl00" DataSourceID="chartsource" Height="400px" RightToLeft="Yes" Width="400px"><Series><asp:Series Name="Series1" XValueMember="decType" YValueMembers="total"></asp:Series></Series><ChartAreas><asp:ChartArea Name="ChartArea1"></asp:ChartArea></ChartAreas></asp:chart>
	<asp:SqlDataSource ID="chartsource" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="SELECT decision_Types.decType, COUNT(*) AS total FROM decisions_Info INNER JOIN decision_Types ON decisions_Info.decTypeID = decision_Types.decTypeID 
where (decDate between @fromdate and @todate)
 GROUP BY decision_Types.decType">
		<SelectParameters>
			<asp:ControlParameter ControlID="txtdecfrom" Name="fromdate" PropertyName="Text" />
			<asp:ControlParameter ControlID="txtdecto" Name="todate" PropertyName="Text" />
		</SelectParameters>
	</asp:SqlDataSource>

</div>
   
	
</asp:Content>


