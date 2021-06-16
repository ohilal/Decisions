<%@ Page Title="statstics" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DecStatistics.aspx.cs" Inherits="Members_DecStatistics" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <cc1:Accordion  runat="server"
    ID="MyAccordion"
    SelectedIndex="0"
    HeaderCssClass="accordionHeader"
    HeaderSelectedCssClass="accordionHeaderSelected"
    ContentCssClass="accordionContent"
    AutoSize="None"
    FadeTransitions="true"
    TransitionDuration="250"
    FramesPerSecond="40"
    RequireOpenedPane="false"
    SuppressHeaderPostbacks="true">
  
    <Panes>
    <cc1:AccordionPane ID="annual" HeaderCssClass="accordionHeader" runat="server"
            
            ContentCssClass="accordionContent">
            <Header> احصائيات سنوية </Header>
            <Content>  
             <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="txtdecfrom" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="txtdecfrom_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtdecfrom" Format="MM/dd/yyyy">
                </cc1:CalendarExtender>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="txtdecto" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="txtdecto_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtdecto" Format="MM/dd/yyyy">
                </cc1:CalendarExtender>
            </td>
        </tr>
    </table>
    <asp:Button ID="btnsearch" runat="server" Text="تقرير" Width="250px" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="decType" HeaderText="decType" 
                SortExpression="decType" />
            <asp:BoundField DataField="total" HeaderText="total" ReadOnly="True" 
                SortExpression="total" />
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
            </Content>

         </cc1:AccordionPane >

         <cc1:AccordionPane  ID="monthly" HeaderCssClass="accordionHeader" runat="server">
         <Header>احصائيات شهرية</Header>
         <Content>
            
             <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtfromMonth" FirstDayOfWeek="Saturday" Format="MMM-yyyy">
             </cc1:CalendarExtender>
           

             <asp:TextBox ID="txtfromMonth" runat="server"></asp:TextBox>
             <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtfromMonth" FirstDayOfWeek="Saturday" Format="MMM-yyyy">
             </cc1:CalendarExtender>
             <asp:TextBox ID="txttoMonth" runat="server"></asp:TextBox>

             <asp:GridView ID="GridView3" runat="server" 
        DataSourceID="SqlDataSource2" AutoGenerateColumns="False">
                 <Columns>
                     <asp:BoundField DataField="decType" HeaderText="decType" 
                         SortExpression="decType" />
                     <asp:BoundField DataField="Dates" HeaderText="Dates" ReadOnly="True" 
                         SortExpression="Dates" />
                     <asp:BoundField DataField="Number" HeaderText="Number" ReadOnly="True" 
                         SortExpression="Number" />
                 </Columns>
             </asp:GridView>
             <br/>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        SelectCommand="monthstatistics" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtfromMonth" Name="fromMonth" 
                PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txttoMonth" Name="toMonth" PropertyName="Text" 
                Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
                   <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txttoMonth">
             </cc1:CalendarExtender>
             <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txttoMonth">
             </cc1:CalendarExtender>
            
             
         
         </Content>
         </cc1:AccordionPane>


    </Panes>
        
            
    

    
     
   
    </cc1:Accordion>

  
             <br/>
             
             <asp:Button ID="Button2" runat="server" Text="Button" 
        onclick="Button2_Click" />
       
   
       


   

</asp:Content>


