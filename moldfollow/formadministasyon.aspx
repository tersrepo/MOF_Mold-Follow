<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="formadministasyon.aspx.cs" Inherits="moldfollow.formadministasyon" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 5px;
        }

        .auto-style2 {
            width: 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <h2 style="background-color: black; color: white; text-align: right; font-weight: bold">ISTASYON RAPORLARI//</h2>

    <form id="form1" runat="server">
        <dx:BootstrapChart ID="BootstrapChart1" runat="server" DataSourceID="SqlDataSource1" EncodeHtml="True" LoadingIndicatorText="" Palette="Office" CrosshairEnabled="True" CrosshairLabelVisible="True" TitleText="İSTASYON / MAX DAKİKA">
            <ArgumentAxis Offset="0" TickVisible="False" MinorTickVisible="False">
                <Label OverlappingBehavior="Rotate"></Label>
            </ArgumentAxis>
            <SeriesCollection>
                <dx:BootstrapChartSplineSeries ArgumentField="dakika" Axis="RES" Color="Black" HoverMode="AllSeriesPoints" IgnoreEmptyPoints="True" Name="MAX / DAKIKA" SelectionMode="AllArgumentPoints" TagField="per_ad" ValueField="istasyon">

                    <ValueErrorBar Type="Variance" />
                    <Point Size="20" Symbol="TriangleUp" />
                    <Label Position="Inside">
                        <ArgumentFormat Currency="" />
                    </Label>
                </dx:BootstrapChartSplineSeries>
            </SeriesCollection>
            <SettingsCommonAxis Offset="0" TickVisible="False" MinorTickVisible="False">
            </SettingsCommonAxis>
            <SettingsZoomAndPan AllowTouchGestures="True">
            </SettingsZoomAndPan>
            <TitleSettings HorizontalAlignment="Center" Text="İSTASYON / MAX DAKİKA">
                <SubTitleSettings Offset="-1">
                </SubTitleSettings>
            </TitleSettings>
            <%--<SettingsLegend VerticalAlignment="Bottom" HorizontalAlignment="Center" />--%>
            <SettingsToolTip Enabled="true">
                <Format Type="Currency" Precision="1" />
            </SettingsToolTip>
        </dx:BootstrapChart>

        <h3 style="background-color: black; color: white; text-align: center; font-weight: bold">CANLI DETAY</h3>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="select sum(sure) as 'dakika',istasyon from calisma_sure group by istasyon"></asp:SqlDataSource>
        <br />
        <dx:ASPxCardViewExporter ID="ASPxCardViewExporter1" runat="server" CardViewID="BootstrapCardView1" ExportSelectedCardsOnly="True">
        </dx:ASPxCardViewExporter>
        <dx:BootstrapCardView ID="BootstrapCardView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcecard">

            <StylesExport>
                <Default BorderSize="5" BorderSides="Right" BackColor="Yellow"></Default>

                <Card BorderSize="1" BorderSides="All" BackColor="Red"></Card>

                <Cell BorderSize="5" BackColor="#FFCC00"></Cell>

                <Group BorderSize="1" BorderSides="All"></Group>

                <TabbedGroup BorderSize="1" BorderSides="All"></TabbedGroup>

                <Tab BorderSize="10" BackColor="#FF9933" ForeColor="#FF9900"></Tab>

                <Caption BorderSize="5" HorizontalAlign="Right" BackColor="Red" ForeColor="Red" BorderSides="Bottom"></Caption>
                <Image BackColor="Red" BorderSides="Top" BorderSize="20" Font-Bold="True" ForeColor="#FF9900" HorizontalAlign="Center" VerticalAlign="bottom" Wrap="True">
                </Image>
                <TotalSummaryItemStyle BackColor="#CC0066" ForeColor="Yellow">
                </TotalSummaryItemStyle>
                <TotalSummaryPanelStyle BackColor="#009933" ForeColor="#FFCCCC">
                </TotalSummaryPanelStyle>
            </StylesExport>

            <FormatConditions>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red">
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt;= 10000000" Format="Custom" FieldName="Aciklama">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="White" Border-BorderStyle="Outset" Border-BorderWidth="4px" BackColor="Black" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/2ee6998e34c3e2eff7b894c66cfc5267.jpg" Repeat="RepeatX" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt;= 10000000" Format="Custom" FieldName="Aciklama">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="White" Border-BorderStyle="Outset" Border-BorderWidth="4px" BackColor="#FFCC00" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/2ee6998e34c3e2eff7b894c66cfc5267.jpg" Repeat="RepeatX" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] = 3000" Format="Custom" FieldName="toplam">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="White" Border-BorderStyle="Outset" Border-BorderWidth="4px" BackColor="#FFCC00" Font-Bold="True" ForeColor="Red">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/feb-07-2020-15-40-31-1581108057.gif" Repeat="RepeatX" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt;= 10000000" Format="Custom" FieldName="Aciklama">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Lime" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="#FFCC00" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/2ee6998e34c3e2eff7b894c66cfc5267.jpg" Repeat="RepeatX" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] = 3000" Format="Custom" FieldName="toplam">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Red" Border-BorderStyle="Outset" Border-BorderWidth="4px" BackColor="#FFCC00" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/2ee6998e34c3e2eff7b894c66cfc5267.jpg" Repeat="RepeatX" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt;= 10000000" Format="Custom" FieldName="Aciklama">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Lime" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="#FFCC00" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/2ee6998e34c3e2eff7b894c66cfc5267.jpg" Repeat="RepeatX" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt; 3001" Format="Custom" FieldName="toplam">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="#FFCC00" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/2ee6998e34c3e2eff7b894c66cfc5267.jpg" Repeat="RepeatX" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt;= 10000000" Format="Custom" FieldName="Aciklama">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Lime" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="#FFCC00" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/2ee6998e34c3e2eff7b894c66cfc5267.jpg" Repeat="RepeatX" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt; 3001" Format="Custom" FieldName="toplam">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="#FFCC00" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/2ee6998e34c3e2eff7b894c66cfc5267.jpg" Repeat="RepeatX" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt;= 10000000" Format="Custom" FieldName="Aciklama">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Lime" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="#FFCC00" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/2ee6998e34c3e2eff7b894c66cfc5267.jpg" Repeat="RepeatX" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt; 3001" Format="Custom" FieldName="toplam">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="#FFCC00" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/f88acab7ffd127b4465659500aa0538f.gif" Repeat="NoRepeat" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt;= 10000000" Format="Custom" FieldName="Aciklama">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Lime" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="#FFCC00" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/stru.gif" Repeat="RepeatX" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt; 3001" Format="Custom" FieldName="toplam">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="#FFCC00" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/2ee6998e34c3e2eff7b894c66cfc5267.jpg" Repeat="NoRepeat" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt;= 10000000" Format="Custom" FieldName="Aciklama">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Lime" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="Black" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/giphy.gif" Repeat="RepeatX" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt; 3001" Format="Custom" FieldName="toplam">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="Black" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/2ee6998e34c3e2eff7b894c66cfc5267.jpg" Repeat="NoRepeat" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt;= 10000000" Format="Custom" FieldName="Aciklama">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Lime" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="White" Font-Bold="True" Font-Overline="True" Font-Strikeout="True" ForeColor="Gray" Font-Underline="True" HorizontalAlign="Right">
                        <Paddings Padding="5px" />
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/giphy.gif" Repeat="NoRepeat" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt; 3001" Format="Custom" FieldName="toplam">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="Black" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/2ee6998e34c3e2eff7b894c66cfc5267.jpg" Repeat="NoRepeat" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt;= 10000000" Format="Custom" FieldName="Aciklama">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Lime" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="White" Font-Bold="True" Font-Overline="False" Font-Strikeout="False" ForeColor="Gray">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/giphy.gif" Repeat="NoRepeat" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt; 3001" Format="Custom" FieldName="toplam">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="Black" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/2ee6998e34c3e2eff7b894c66cfc5267.jpg" Repeat="NoRepeat" HorizontalPosition="right" VerticalPosition="bottom"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt;= 10000000" Format="Custom" FieldName="Aciklama">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Lime" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="White" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/batman.gif" Repeat="NoRepeat" HorizontalPosition="top" VerticalPosition="center"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight ApplyToCard="True" Expression="[toplam] &lt; 3001" Format="Custom" FieldName="toplam">
                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg"></BackgroundImage>
                    </LayoutItemStyle>

                    <CardStyle Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="4px" BackColor="Black" Font-Bold="True" ForeColor="White">
                        <BackgroundImage ImageUrl="~/Dosyalar1/image/batman.gif" Repeat="NoRepeat" HorizontalPosition="Top" VerticalPosition="Center"></BackgroundImage>
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
            </FormatConditions>
            <Columns>
                <dx:BootstrapCardViewTextColumn Caption="MAKİNE ADI" FieldName="mak_isim" ReadOnly="True" VisibleIndex="0" HeaderBadge-Text="mak_isim">
                    <HeaderBadge Text="mak_isim"></HeaderBadge>
                </dx:BootstrapCardViewTextColumn>
                <dx:BootstrapCardViewTextColumn FieldName="toplam" ReadOnly="True" VisibleIndex="1" Caption="TOPLAM ÇALIŞMA (MIN)">
                </dx:BootstrapCardViewTextColumn>
                <dx:BootstrapCardViewDateColumn FieldName="tarih" ReadOnly="True" VisibleIndex="2" Caption="SON İŞLEM">
                    <SettingsHeaderFilter Mode="DateRangeCalendar">
                    </SettingsHeaderFilter>
                    <ExportCellStyle ForeColor="#FF0066">
                    </ExportCellStyle>
                </dx:BootstrapCardViewDateColumn>
                <dx:BootstrapCardViewTextColumn FieldName="Aciklama" ReadOnly="True" VisibleIndex="3" Caption="ISLEM ACIKLAMA">
                </dx:BootstrapCardViewTextColumn>

                <dx:BootstrapCardViewTextColumn FieldName="Personel" ReadOnly="True" VisibleIndex="4" Caption="PERSONEL">
                </dx:BootstrapCardViewTextColumn>
                <dx:BootstrapCardViewTextColumn FieldName="kalipno1" ReadOnly="True" VisibleIndex="6" Caption="İSLEM SINIFI">
                </dx:BootstrapCardViewTextColumn>
                <dx:BootstrapCardViewTextColumn FieldName="kalipno" ReadOnly="True" VisibleIndex="5" Caption="KALIP NUMARASI">
                </dx:BootstrapCardViewTextColumn>

            </Columns>




            <CardLayoutProperties>
                <Items>
                    <dx:BootstrapCardViewCommandLayoutItem HorizontalAlign="Right">
                    </dx:BootstrapCardViewCommandLayoutItem>
                    <dx:BootstrapCardViewColumnLayoutItem ColumnName="mak_isim">
                    </dx:BootstrapCardViewColumnLayoutItem>
                    <dx:BootstrapCardViewColumnLayoutItem ColumnName="toplam">
                    </dx:BootstrapCardViewColumnLayoutItem>
                    <dx:BootstrapCardViewColumnLayoutItem ColumnName="tarih">
                    </dx:BootstrapCardViewColumnLayoutItem>
                    <dx:BootstrapCardViewColumnLayoutItem ColumnName="Aciklama">
                    </dx:BootstrapCardViewColumnLayoutItem>
                    <dx:BootstrapCardViewColumnLayoutItem ColumnName="Personel">
                    </dx:BootstrapCardViewColumnLayoutItem>
                    <dx:BootstrapCardViewColumnLayoutItem ColumnName="kalipno1">
                    </dx:BootstrapCardViewColumnLayoutItem>
                    <dx:BootstrapCardViewColumnLayoutItem ColumnName="kalipno">
                    </dx:BootstrapCardViewColumnLayoutItem>
                    <dx:BootstrapEditModeCommandLayoutItem HorizontalAlign="Right">
                    </dx:BootstrapEditModeCommandLayoutItem>
                </Items>
            </CardLayoutProperties>
            <Settings ShowCardHeader="true" />
            <SettingsBehavior AllowFocusedCard="true" />
            <SettingsPager AlwaysShowPager="True">
                <NextPageButton Text="Sonraki" />
                <Summary AllPagesText="Sayfa: {0} - {1} ({2} istasyon)" />
            </SettingsPager>
            <SettingsPopup>
                <HeaderFilter PopupAnimationType="Auto">
                </HeaderFilter>
            </SettingsPopup>
            <SettingsText CommandApplySearchPanelFilter="Aramak istediğiniz veriyi girin..." CommandBatchEditUpdate="ss" CommandClearSearchPanelFilter="Temizle" CommandEndlessPagingShowMoreCards="ss" CommandNew="SS" ConfirmOnLosingBatchChanges="SS" EmptyCard="REAC" ToolbarShowCardHeader="SS" ToolbarShowHeaderPanel="SS" />
            <SettingsDataSecurity AllowEdit="True" />

            <StylesExport>
                <Default BackColor="Yellow" BorderSides="Right" BorderSize="5">
                </Default>
                <Card BorderSize="5" BorderSides="All" ForeColor="Yellow" HorizontalAlign="Right" VerticalAlign="Top"></Card>

                <Cell BackColor="#FFCC00" BorderSize="5">
                </Cell>

                <Group BorderSize="1" BorderSides="All"></Group>

                <TabbedGroup BorderSize="1" BorderSides="All"></TabbedGroup>

                <Tab BorderSize="1"></Tab>
                <Caption BackColor="Red" BorderSize="5" ForeColor="Red" HorizontalAlign="Right">
                </Caption>

                <Image BorderSize="20" BorderSides="Top" HorizontalAlign="Center" VerticalAlign="Top" Wrap="True" BackColor="Red" Font-Bold="True" ForeColor="#FF9900"></Image>

                <TotalSummaryItemStyle BackColor="#CC0066" ForeColor="Yellow"></TotalSummaryItemStyle>

                <TotalSummaryPanelStyle BackColor="#009933" ForeColor="#FFCCCC"></TotalSummaryPanelStyle>
            </StylesExport>

            <SettingsSearchPanel Visible="True" />

            <SettingsExport ExportSelectedCardsOnly="False"></SettingsExport>

            <Templates>

                <CardHeader><%# Eval("mak_isim") %></CardHeader>
            </Templates>




            <FormatConditions>
                <dx:CardViewFormatConditionHighlight FieldName="Aciklama" Expression="[toplam] <= 10000000" Format="Custom" ApplyToCard="true">

                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg" />
                    </LayoutItemStyle>
                    <CardStyle BackColor="#000000" ForeColor="White" Border-BorderColor="Lime" Border-BorderStyle="Solid" Border-BorderWidth="4px" Font-Bold="True">
                        <BackgroundImage HorizontalPosition="top" ImageUrl="~/Dosyalar1/image/on.jpg" Repeat="NoRepeat" VerticalPosition="center" />
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <%--          <dx:GridViewFormatConditionColorScale FieldName="Aciklama" Format="BlueWhiteRed" />--%>

                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>

                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red">
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>

                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>

            </FormatConditions>

            <FormatConditions>
                <dx:CardViewFormatConditionHighlight FieldName="toplam" Expression="[toplam] < 3001" Format="Custom" ApplyToCard="true">

                    <LayoutItemStyle BackColor="#3333FF">
                        <BackgroundImage ImageUrl="~/Dosyalar1/bootstrap-3.3.7/dist/fonts/glyphicons-halflings-regular.svg" />
                    </LayoutItemStyle>
                    <CardStyle BackColor="Black" ForeColor="White" Border-BorderColor="Red" Border-BorderStyle="Solid" Border-BorderWidth="4px" Font-Bold="True">
                        <BackgroundImage HorizontalPosition="Top" ImageUrl="~/Dosyalar1/image/off.jpg" Repeat="NoRepeat" VerticalPosition="Center" />
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <%--          <dx:GridViewFormatConditionColorScale FieldName="Aciklama" Format="BlueWhiteRed" />--%>

                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>

                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>
                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red">
                    </CardStyle>
                </dx:CardViewFormatConditionHighlight>

                <dx:CardViewFormatConditionHighlight>
                    <CardStyle BackColor="Red"></CardStyle>
                </dx:CardViewFormatConditionHighlight>

            </FormatConditions>

        </dx:BootstrapCardView>

        <h3 style="background-color: black; color: white; text-align: center; font-weight: bold">SONLANDIRILAN İŞLEM DETAY</h3>
        <br />
        <br />

        <asp:SqlDataSource ID="SqlDataSourcecard" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT 
mak_id
,mak_isim
,(Select isnull(sum(cast(islem_persure as int)),0) From KT_ISLEMLER Where mak_id=islem_istasyon) as 'toplam'
,ISNULL((Select max(islem_bitirme) From KT_ISLEMLER Where mak_id=islem_istasyon),'') as 'tarih'
,ISNULL((Select top 1 islem_aciklama From KT_ISLEMLER Where mak_id=islem_istasyon  order by islem_bitirme desc),'ISLEM YOK') as 'Aciklama'
,ISNULL((Select max(per_ad) From KT_ISLEMLER JOIN KT_PERSONEL ON KT_ISLEMLER.islem_personel=KT_PERSONEL.per_id Where mak_id=islem_istasyon ),'USER' ) as 'Personel'
,ISNULL((Select max(islem_kalipno) From KT_ISLEMLER Where mak_id=islem_istasyon),'*') as 'kalipno'
,ISNULL((Select max(surectip_ad) From KT_ISLEMLER JOIN KT_SURECTIP ON KT_ISLEMLER.islem_sinif=KT_SURECTIP.surectip_id Where mak_id=islem_istasyon),'*') as 'kalipno'

FROM KT_MAKINATIP"></asp:SqlDataSource>
        <br />
        <dx:BootstrapGridView ID="BootstrapGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcetable">
            <SettingsText SearchPanelEditorNullText="Arama metni girin..." />
            <Columns>
                <dx:BootstrapGridViewCommandColumn VisibleIndex="0">
                </dx:BootstrapGridViewCommandColumn>
                <dx:BootstrapGridViewDateColumn FieldName="islem_bitirme" VisibleIndex="1" Caption="İşlem Tarih">
                </dx:BootstrapGridViewDateColumn>
                <dx:BootstrapGridViewTextColumn FieldName="mak_isim" VisibleIndex="2" Caption="İstasyon">
                </dx:BootstrapGridViewTextColumn>
                <dx:BootstrapGridViewTextColumn FieldName="islem_persure" VisibleIndex="3" Caption="Çalışma Süresi">
                </dx:BootstrapGridViewTextColumn>
                <dx:BootstrapGridViewTextColumn FieldName="kalip_isim" ReadOnly="True" VisibleIndex="4" Caption="İşlenen Parça">
                </dx:BootstrapGridViewTextColumn>
            </Columns>
            <SettingsSearchPanel Visible="True" />
        </dx:BootstrapGridView>
        <asp:SqlDataSource ID="SqlDataSourcetable" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT islem_bitirme,mak_isim,(islem_kalipno),islem_istasyon,islem_persure
,ISNULL((select MAX(maliyet_tutar) from KT_MALIYET where maliyet_maktip=islem_istasyon),' ') as 'maliyetcarpan'
,islem_persure * ISNULL((select max(maliyet_tutar) from KT_MALIYET where maliyet_maktip=islem_istasyon),' ')  as 'maliyettutar' 
,ISNULL((select kalipno from KT_kalipadlari where islem_kalipno=kalipisim),' ') as 'kalip_isim'

from KT_ISLEMLER JOIN KT_MAKINATIP on KT_ISLEMLER.islem_istasyon=KT_MAKINATIP.mak_id order by islem_bitirme desc"></asp:SqlDataSource>
        <br />
        <h3 style="background-color: black; color: white; text-align: center; font-weight: bold">DURUS LISTESI</h3>
        <dx:BootstrapGridView ID="BootstrapGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcedurus">
            <SettingsText SearchPanelEditorNullText="Arama metni girin..." />
            <Columns>
                <dx:BootstrapGridViewCommandColumn VisibleIndex="0">
                </dx:BootstrapGridViewCommandColumn>
                <dx:BootstrapGridViewTextColumn FieldName="durus_neden" VisibleIndex="2" Caption="Durus Neden">
                </dx:BootstrapGridViewTextColumn>
                <dx:BootstrapGridViewTextColumn FieldName="durus_date" VisibleIndex="5" Caption="Tarih">
                </dx:BootstrapGridViewTextColumn>
                <dx:BootstrapGridViewTextColumn FieldName="mak_isim" VisibleIndex="1" Caption="İstasyon">
                </dx:BootstrapGridViewTextColumn>
                <dx:BootstrapGridViewTextColumn FieldName="kalipno" VisibleIndex="3" Caption="Bağlı Kalıp">
                </dx:BootstrapGridViewTextColumn>
                <dx:BootstrapGridViewTextColumn FieldName="per_ad" VisibleIndex="4" Caption="Personel">
                </dx:BootstrapGridViewTextColumn>
            </Columns>
            <SettingsSearchPanel Visible="True" />
        </dx:BootstrapGridView>
        <asp:SqlDataSource ID="SqlDataSourcedurus" runat="server" ConnectionString="<%$ ConnectionStrings:Db_kaliphanetakipConnectionString %>" SelectCommand="SELECT mak_isim,durus_kalipno,islem_personel,per_ad,durus_neden,kalipno,durus_date,durus_min FROM KT_DURUSLAR
JOIN KT_ISLEMLER ON KT_DURUSLAR.durus_islemid=KT_ISLEMLER.islem_id
JOIN KT_PERSONEL ON KT_ISLEMLER.islem_personel=KT_PERSONEL.per_id
JOIN KT_kalipadlari ON KT_ISLEMLER.islem_kalipno=KT_kalipadlari.kalipisim
JOIN KT_MAKINATIP ON KT_ISLEMLER.islem_istasyon=KT_MAKINATIP.mak_id"></asp:SqlDataSource>
        <br />
        <br />
        <table style="width: 100%;">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1"></td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>

        </table>
    </form>


</asp:Content>
