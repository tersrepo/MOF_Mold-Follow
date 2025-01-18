<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="formadminkalipdetay.aspx.cs" Inherits="moldfollow.formadminkalipdetay" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">


    <form id="form1" runat="server">

        <h2 style="background-color:black;color:white;text-align:right;font-weight:bold">KALIP RAPORLARI//</h2>




    <table style="width:100%;height:100%;">
        <tr>
            <td>
      

                <br />
                <h3 style="background-color:black;color:white;text-align:center;font-weight:bold">AKTIF ISLEM LISTESI</h3>

                <dx:BootstrapGridView ID="BootstrapGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDevam">
                    <Columns>
                        <dx:BootstrapGridViewTextColumn FieldName="islem_kalipno" VisibleIndex="5" Caption="Kalıp No">
                            <Columns>
                                <dx:BootstrapGridViewTextColumn Caption="Kalıp" FieldName="kalipno" HorizontalAlign="Center" VisibleIndex="0">
                                </dx:BootstrapGridViewTextColumn>
                            </Columns>
                            <ExportCellStyle BackColor="#FF3300">
                            </ExportCellStyle>
                        </dx:BootstrapGridViewTextColumn>
                        <dx:BootstrapGridViewTextColumn FieldName="islem_aciklama" VisibleIndex="8" Caption="İslem Aciklama">
                        </dx:BootstrapGridViewTextColumn>
                        <dx:BootstrapGridViewTextColumn FieldName="detay_aciklama" VisibleIndex="9" Caption="Detay">
                        </dx:BootstrapGridViewTextColumn>
                        <dx:BootstrapGridViewTextColumn Caption="Sınıf" FieldName="surectip_ad" VisibleIndex="10">
                        </dx:BootstrapGridViewTextColumn>
                    </Columns>
                </dx:BootstrapGridView>
                <asp:SqlDataSource ID="SqlDataSourceDevam" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT  parse(islem_persure as int) as sure,islem_istasyon,mak_isim as istasyon,islem_bitirme,islem_maliyet,islem_malcarpan,maliyet_tutar,maliyet_tar,islem_kalipno,kalipno,islem_sinif,surectip_ad,islem_baslama,islem_aciklama,islem_detay,detay_aciklama from KT_ISLEMLER 
JOIN KT_MAKINATIP ON KT_ISLEMLER.islem_istasyon=KT_MAKINATIP.mak_id
JOIN KT_PERSONEL ON KT_ISLEMLER.islem_personel=KT_PERSONEL.per_id
JOIN KT_SURECTIP ON KT_ISLEMLER.islem_sinif=KT_SURECTIP.surectip_id
JOIN KT_ISLEMDETAY ON KT_ISLEMLER.islem_detay=KT_ISLEMDETAY.detay_id
JOIN KT_ISLEMSUREC ON KT_ISLEMLER.islem_surec=KT_ISLEMSUREC.islemsurec_id
JOIN KT_MALIYET ON KT_ISLEMLER.islem_malcarpan=KT_MALIYET.maliyet_id

JOIN KT_kalipadlari ON KT_ISLEMLER.islem_kalipno=KT_kalipadlari.kalipisim where islem_surec=1"></asp:SqlDataSource>
                <br />
      

    <dx:BootstrapChart ID="BootstrapChart1" runat="server" DataSourceID="SqlDataSourcekalip" EncodeHtml="True" LoadingIndicatorText="" Palette="Office"  CrosshairEnabled="True" CrosshairLabelVisible="True" TitleText="İSTASYON / CALISMA" Rotated="True">
        <ArgumentAxis Offset="0" TickVisible="False" MinorTickVisible="False">
<Label OverlappingBehavior="Rotate"></Label>
</ArgumentAxis>
        <SeriesCollection>
            <dx:BootstrapChartSplineSeries ArgumentField="TOPLAM CALISMA(DAK)" Axis="RES" Color="#FF3300" HoverMode="AllSeriesPoints" IgnoreEmptyPoints="True" Name="MAX / DAKIKA" SelectionMode="AllArgumentPoints" TagField="KALIPNO" ValueField="KALIPADI">
                <Point Size="23" />
                <Label Position="Outside">
                    <ArgumentFormat Currency="" />
                </Label>
            </dx:BootstrapChartSplineSeries>
        </SeriesCollection>
        <SettingsCommonAxis Offset="0" TickVisible="False" MinorTickVisible="False">
        </SettingsCommonAxis>
        <SettingsZoomAndPan AllowTouchGestures="True">
        </SettingsZoomAndPan>
        <TitleSettings horizontalalignment="Center" Text="İSTASYON / CALISMA">
            <SubTitleSettings Offset="-1">
            </SubTitleSettings>
        </TitleSettings>
            <%--<SettingsLegend VerticalAlignment="Bottom" HorizontalAlignment="Center" />--%>
    <SettingsToolTip Enabled="true">
        <Format Type="Currency" Precision="1" />
    </SettingsToolTip>
    </dx:BootstrapChart>

                <asp:SqlDataSource ID="SqlDataSourcekalip" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT  
KALIPNO,surectip
,KALIPADI
,SUM(ISLEMSURE) as 'TOPLAM CALISMA(DAK)'
,SUM(MALIYETTUTAR) as 'TOPLAM MALIYET'

FROM

(SELECT islem_kalipno KALIPNO,islem_istasyon ISTASYON,CAST (islem_persure AS INT) ISLEMSURE
,ISNULL((select MAX(maliyet_tutar) from KT_MALIYET where maliyet_maktip=islem_istasyon),' ') MALIYETCARPAN
,islem_persure * ISNULL((select max(maliyet_tutar) from KT_MALIYET where maliyet_maktip=islem_istasyon),' ') MALIYETTUTAR
,ISNULL((select kalipno from KT_kalipadlari where islem_kalipno=kalipisim),'ONCEKI DONEM LISTESI') as KALIPADI
,ISNULL((select top 1 surectip_ad from KT_ISLEMLER JOIN KT_SURECTIP ON KT_ISLEMLER.islem_sinif=KT_SURECTIP.surectip_id where islem_sinif=surectip_id order by islem_malcarpan),'REV') surectip
from KT_ISLEMLER 
) A GROUP BY KALIPNO,KALIPADI,surectip"></asp:SqlDataSource>
                <br />
                 <h3 style="background-color:black;color:white;text-align:center;font-weight:bold">SONLANDIRILMIS ISLEM LISTESI</h3>
                <dx:BootstrapGridView ID="BootstrapGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcekalipsurec2">
                    <Columns>
                        <dx:BootstrapGridViewTextColumn Caption="Toplam Sure(MIN)" FieldName="sure" ReadOnly="True" VisibleIndex="10">
                        </dx:BootstrapGridViewTextColumn>
                        <dx:BootstrapGridViewDateColumn Caption="Bitirme" FieldName="islem_bitirme" VisibleIndex="9">
                        </dx:BootstrapGridViewDateColumn>
                        <dx:BootstrapGridViewTextColumn Caption="Sinif" FieldName="surectip_ad" VisibleIndex="5">
                        </dx:BootstrapGridViewTextColumn>
                        <dx:BootstrapGridViewDateColumn Caption="Baslama" FieldName="islem_baslama" VisibleIndex="2">
                        </dx:BootstrapGridViewDateColumn>
                        <dx:BootstrapGridViewTextColumn Caption="Aciklama" FieldName="islem_aciklama" VisibleIndex="3">
                        </dx:BootstrapGridViewTextColumn>
                        <dx:BootstrapGridViewTextColumn Caption="Detay" FieldName="detay_aciklama" VisibleIndex="4">
                        </dx:BootstrapGridViewTextColumn>
                        <dx:BootstrapGridViewTextColumn Caption="Personel" FieldName="per_ad" VisibleIndex="6">
                        </dx:BootstrapGridViewTextColumn>
                        <dx:BootstrapGridViewTextColumn Caption="Kalıp No" FieldName="islem_kalipno" VisibleIndex="0">
                        </dx:BootstrapGridViewTextColumn>       
                        <dx:BootstrapGridViewTextColumn Caption="Kalıp" FieldName="kalipno" VisibleIndex="1">
                        </dx:BootstrapGridViewTextColumn>
                        <dx:BootstrapGridViewTextColumn Caption="İstasyon" FieldName="istasyon" VisibleIndex="8">
                        </dx:BootstrapGridViewTextColumn>
                    </Columns>
                </dx:BootstrapGridView>
                <asp:SqlDataSource ID="SqlDataSourcekalipsurec2" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT  parse(islem_persure as int) as sure,islem_istasyon,mak_isim as istasyon,islem_bitirme,islem_maliyet,islem_malcarpan,maliyet_tutar,maliyet_tar,islem_kalipno,kalipno,islem_sinif,surectip_ad,islem_baslama,islem_aciklama,islem_detay,detay_aciklama,per_ad from KT_ISLEMLER 
JOIN KT_MAKINATIP ON KT_ISLEMLER.islem_istasyon=KT_MAKINATIP.mak_id
JOIN KT_PERSONEL ON KT_ISLEMLER.islem_personel=KT_PERSONEL.per_id
JOIN KT_SURECTIP ON KT_ISLEMLER.islem_sinif=KT_SURECTIP.surectip_id
JOIN KT_ISLEMDETAY ON KT_ISLEMLER.islem_detay=KT_ISLEMDETAY.detay_id
JOIN KT_ISLEMSUREC ON KT_ISLEMLER.islem_surec=KT_ISLEMSUREC.islemsurec_id
JOIN KT_MALIYET ON KT_ISLEMLER.islem_malcarpan=KT_MALIYET.maliyet_id

JOIN KT_kalipadlari ON KT_ISLEMLER.islem_kalipno=KT_kalipadlari.kalipisim where islem_surec=2 order by islem_bitirme desc"></asp:SqlDataSource>
            </td>

        </tr>
   
    </table>


    </form>


</asp:Content>
