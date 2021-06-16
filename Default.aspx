<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="searchData" Title="ַבָֻֽ Úה ַֿׁ׃ֹ" EnableEventValidation="false" %>

<%@ Register Assembly="Infragistics2.WebUI.UltraWebTab.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
    Namespace="Infragistics.WebUI.UltraWebTab" TagPrefix="igtab" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="direction:ltr;text-align:center; padding:0 10px;">
<%-----------------------total number -------------------------------- --%>

    
    <%-----------------------End of igTabs-------------------------------- --%>
<div class="rtlDirection" style="text-align:justify; text-indent:10px;  padding:0 50px;">
			<p>Ýם
			 ֵ״ַׁ Ê״זםׁ ַב־ֿדַÊ ַבַבßÊׁזהםֹ בבוםֶֹ ַבÚַדֹ בבÊהדםֹ ַבױהַÚםֹ Êד ÊÝÚםב ַבֵױַֿׁ ַבֳזב דה " ָהß ַבדÚבזדַÊ ַבױהַÚםֹ  " Úבל ַבדזÞÚ ַבַבßÊׁזהם בבוםֶֹ&nbsp; זַב׀ם םÚÊָׁ הזÚַנ דה ֳהזַÚ ֵַֹֿׁ ַבדÚׁÝֹ ֽםֻ םֽÊזם Úבל ַבַֿׁ׃ַÊ זַבֳַָֻֽ זַבדזײזÚַÊ ַבוַדֹ Ýם דַּב ַבױהַÚֹ ַבÊם Êוד ַּׁב זד׃Êֻדׁם ַבױהַÚֹ זַבÊם Êד ֵÚַֿֿוַ ָדÚׁÝֹ Ýהםם ַבוםֶֹ ֳז ַבּוַÊ ׀ַÊ ַבױבֹ
			.
			</p>
			<p>Êד Êָזםָ ַבדזײזÚַÊ ֵבל דזײזÚַÊ  <a href="sectorSelect.aspx?secID=96">Úַדֹ</a>
			 - <a href="sectorSelect.aspx?secID=97">ּÛַׁÝםֹ</a>
			 –<a href="sectorSelect.aspx?secID=98">ַ׃ÊַׁÊםּםֹ</a> 
			  – 

                Þ״ַÚםֹ זםדßה בבַָֻֽ ַבָֻֽ
			   <a href="wordSearch.aspx">ָßבדַÊ ַֿבֹ Úבל ַבדזײזÚ</a> 
			   ֳז   <a href="branchSearch.aspx">ּוֹ ַבֵױַֿׁ</a>
			   ֳז   <a href="searchbydate.aspx">Êַׁם־ ַבֵױַֿׁ</a>
			   ֳז  <a href="CodeSearch.aspx">ֳßזַֿ ַבÊױהםÝ ַבÚָׁם ַבדזֽֿ</a>
			    בÊÚׂםׂ ֳֿזַÊ ַבַָֻֽ זד׃ַÚֿÊו Ýם ַבזױזב ֵבל ַבדÚבזדַÊ ַבÊם םֽÊַּוַ.</p>
				
				<br />
                <br />
            
                <asp:SqlDataSource ID="countsds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                    SelectCommand="SELECT count( * ) as total_record
,getDate()
 FROM dbo.Fullinfo">
                </asp:SqlDataSource>
                
    <div style="text-align:center;padding-right:200px;width:50%;">            
                
<asp:GridView ID="gdvTotal" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="countsds" 
                    EnableTheming="False" CellPadding="4" ForeColor="Black" 
                    GridLines="None" Width="450px">
                    <RowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="total_record" HeaderText="ֵּדַבל Úֿֿ ַבַֿׁ׃ַÊ"/> 
                             
                        <asp:BoundField DataField="Column1" DataFormatString="{0:dd MMMM yyyy}" 
                            HeaderText="ֽÊל Êַׁם־"  />
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="Black" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView> 

    </div>

                <br />
				&nbsp; &nbsp; 
				</div>
</div>
</asp:Content>

