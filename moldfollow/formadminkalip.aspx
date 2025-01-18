<%@ Page Title="" Language="C#" ValidateRequest="false" EnableEventValidation="false" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="formadminkalip.aspx.cs" Inherits="moldfollow.formadminkalip" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    
    
    <h2 style="background-color:slategray;color:white;text-align:right;font-weight:bold">MALIYET ÖRNEKLEM//</h2>

    <form id="form1" runat="server">
        <asp:Table ID="Table1" runat="server">
        </asp:Table>
        <table style="width:100%;">
            <tr>

                <td>

                 

                    <asp:SqlDataSource ID="SqlDataSourcechartsure" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT  
KALIPNO
,KALIPADI
,SUM(ISLEMSURE) as 'TOPLAM CALISMA(DAK)'
,SUM(MALIYETTUTAR) as 'TOPLAM MALIYET'


FROM

(SELECT islem_kalipno KALIPNO,islem_istasyon ISTASYON,CAST (islem_persure AS INT) ISLEMSURE
,ISNULL((select MAX(maliyet_tutar) from KT_MALIYET where maliyet_maktip=islem_istasyon),' ') MALIYETCARPAN
,islem_persure * ISNULL((select max(maliyet_tutar) from KT_MALIYET where maliyet_maktip=islem_istasyon),' ') MALIYETTUTAR
,ISNULL((select kalipno from KT_kalipadlari where islem_kalipno=kalipisim),' ') as KALIPADI
from KT_ISLEMLER 
) A GROUP BY KALIPNO,KALIPADI"></asp:SqlDataSource>
                </td>
                <td>
              

                
                 

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT  
KALIPNO
,KALIPADI
,SUM(ISLEMSURE) as 'TOPLAM CALISMA(DAK)'
,SUM(MALIYETTUTAR) as 'TOPLAM MALIYET'


FROM

(SELECT islem_kalipno KALIPNO,islem_istasyon ISTASYON,CAST (islem_persure AS INT) ISLEMSURE
,ISNULL((select MAX(maliyet_tutar) from KT_MALIYET where maliyet_maktip=islem_istasyon),' ') MALIYETCARPAN
,islem_persure * ISNULL((select max(maliyet_tutar) from KT_MALIYET where maliyet_maktip=islem_istasyon),' ') MALIYETTUTAR
,ISNULL((select kalipno from KT_kalipadlari where islem_kalipno=kalipisim),' ') as KALIPADI
from KT_ISLEMLER 
) A GROUP BY KALIPNO,KALIPADI"></asp:SqlDataSource>
                

                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
      

                    <dx:BootstrapChart ID="BootstrapChart3" runat="server" DataSourceID="SqlDataSourcechartsure" EncodeHtml="True" LoadingIndicatorText="" Palette="Office"  CrosshairEnabled="True" CrosshairLabelVisible="True" TitleText="KALIP/MALIYET" Rotated="True">
        <ArgumentAxis Offset="0" TickVisible="False" MinorTickVisible="False">
<Label OverlappingBehavior="Rotate"></Label>
</ArgumentAxis>
        <SeriesCollection>
            <dx:BootstrapChartStackedSplineSeries ArgumentField="KALIPADI" Axis="RES" Color="#FC4136" HoverMode="OnlyPoint" IgnoreEmptyPoints="True" Name="KALIP / MALIYET" SelectionMode="OnlyPoint" TagField="KALIPADI" ValueField="TOPLAM MALIYET">
                <Point Size="17" />
                <Label ConnectorVisible="True" Position="Outside" Visible="True">
                    <ArgumentFormat Currency="₺" />
                    <Format Currency="₺" Formatter="function(value) {


	
}" Type="Decimal" />
                </Label>
            </dx:BootstrapChartStackedSplineSeries>
        </SeriesCollection>
        <SettingsCommonAxis Offset="0" TickVisible="False" MinorTickVisible="False">
        </SettingsCommonAxis>
        <SettingsZoomAndPan AllowTouchGestures="True">
            <DragBoxStyle Color="#CCCCCC" />
        </SettingsZoomAndPan>
        <TitleSettings horizontalalignment="Center" Text="KALIP/MALIYET">
            <SubTitleSettings Offset="-1">
            </SubTitleSettings>
        </TitleSettings>

    <SettingsToolTip Enabled="true">
        <ArgumentFormat Currency="TRY" />
        <Format Type="Currency" Precision="1" Currency="TRY" />
    </SettingsToolTip>
    </dx:BootstrapChart>
                 
             <h3 style="background-color:slategray;color:white;text-align:center;font-weight:bold">KALIP LİSTESİ</h3>
                    <br />
        <dx:BootstrapGridView ID="BootstrapGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcegrid">
            <SettingsPager NumericButtonCount="20" PageSize="5">
            </SettingsPager>
            <Columns>
                <dx:BootstrapGridViewTextColumn FieldName="TOPLAM CALISMA(DAK)" VisibleIndex="3" ReadOnly="True">
                </dx:BootstrapGridViewTextColumn>
                <dx:BootstrapGridViewTextColumn FieldName="TOPLAM MALIYET" ReadOnly="True" VisibleIndex="4">
                </dx:BootstrapGridViewTextColumn>
                <dx:BootstrapGridViewHyperLinkColumn Caption="NO - DETAY " FieldName="KALIPNO" VisibleIndex="0">
                    <PropertiesHyperLinkEdit NavigateUrlFormatString="formadminkalip.aspx?KALIPNO={0}" NullDisplayText="GIT" Text="GIT" TextField="KALIPNO">
                        <Badge Text="DETAYA GIT 🠗" />
                    </PropertiesHyperLinkEdit>
                </dx:BootstrapGridViewHyperLinkColumn>
                <dx:BootstrapGridViewTextColumn FieldName="KALIPADI" ReadOnly="True" VisibleIndex="2">
                </dx:BootstrapGridViewTextColumn>
            </Columns>
        </dx:BootstrapGridView>
        <asp:SqlDataSource ID="SqlDataSourcegrid" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT  
KALIPNO
,KALIPADI
,SUM(ISLEMSURE) as 'TOPLAM CALISMA(DAK)'
,SUM(MALIYETTUTAR) as 'TOPLAM MALIYET'


FROM

(SELECT islem_kalipno KALIPNO,islem_istasyon ISTASYON,CAST (islem_persure AS INT) ISLEMSURE
,ISNULL((select MAX(maliyet_tutar) from KT_MALIYET where maliyet_maktip=islem_istasyon),' ') MALIYETCARPAN
,islem_persure * ISNULL((select max(maliyet_tutar) from KT_MALIYET where maliyet_maktip=islem_istasyon),' ') MALIYETTUTAR
,ISNULL((select kalipno from KT_kalipadlari where islem_kalipno=kalipisim),'ONCEKI DONEM LISTESI') as KALIPADI
from KT_ISLEMLER 
) A GROUP BY KALIPNO,KALIPADI order by [TOPLAM MALIYET] desc"></asp:SqlDataSource>
        <marquee direction="right" bgColor="#1271a9" style="font-size:large; color:white">
KALIP İSLEM DETAYLARI</marquee>
        <dx:BootstrapGridView ID="BootstrapGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <dx:BootstrapGridViewTextColumn FieldName="islem_persure" VisibleIndex="4" Caption="Süre / Dakika">
                </dx:BootstrapGridViewTextColumn>
                <dx:BootstrapGridViewTextColumn FieldName="islem_aciklama" VisibleIndex="1" Caption="İşlem Açıklama">
                </dx:BootstrapGridViewTextColumn>
                <dx:BootstrapGridViewTextColumn FieldName="maliyettutar" ReadOnly="True" VisibleIndex="6" Caption="Maliyet">
                </dx:BootstrapGridViewTextColumn>
                <dx:BootstrapGridViewTextColumn FieldName="makisim" ReadOnly="True" VisibleIndex="2" Caption="İstasyon">
                </dx:BootstrapGridViewTextColumn>
                <dx:BootstrapGridViewTextColumn FieldName=" perisim" ReadOnly="True" VisibleIndex="3" Caption="Personel">
                </dx:BootstrapGridViewTextColumn>
                <dx:BootstrapGridViewDateColumn Caption="Gerçekleşme Tarih" FieldName="islem_bitirme" VisibleIndex="0">
                </dx:BootstrapGridViewDateColumn>
            </Columns>
        </dx:BootstrapGridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT (islem_kalipno),islem_istasyon,islem_persure,islem_aciklama,islem_bitirme
,ISNULL((select MAX(maliyet_tutar) from KT_MALIYET where maliyet_maktip=islem_istasyon),' ') as 'maliyetcarpan'
,islem_persure * ISNULL((select max(maliyet_tutar) from KT_MALIYET where maliyet_maktip=islem_istasyon),' ')  as 'maliyettutar' 
,ISNULL((select kalipno from KT_kalipadlari where islem_kalipno=kalipisim),' ') as 'kalip_isim'
,ISNULL((select mak_isim from KT_MAKINATIP where islem_istasyon=mak_id),' ') as 'makisim'
,ISNULL((select per_ad from KT_PERSONEL where islem_personel=per_id),' ') as ' perisim'

from KT_ISLEMLER WHERE islem_kalipno = @KALIPNO ORDER BY islem_bitirme DESC">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="KALIPNO" Name="KALIPNO" QueryStringField="KALIPNO" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        

        <asp:Button ID="Btn_ExportToExcel" runat="server" CssClass=" btn btn-block" OnClick="Btn_ExportToExcel_Click" Text="RAPORU INDIR/(.XLSX)" BackColor="ForestGreen" ForeColor="White" />
                 

        <br />
    </form>
   



</asp:Content>
