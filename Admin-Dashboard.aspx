<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin-Dashboard.aspx.cs" Inherits="awad.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <title></title>
        <link rel="stylesheet" type="text/css" href="../../Assets/css/DashBoard.css" />
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
    </head>
    <body>
        <div id="charts">
            <asp:Literal ID="lt" runat="server"></asp:Literal>
            <div id="chart_div" style="margin-left:auto; margin-right:auto; margin-top:30px; width:700px;"></div>
        </div>
        
        <input type="button" id="btnDownload" value="Download as PDF" onclick="downloadPDF()" style="display:block; margin:auto;" />

        <script type="text/javascript">
            google.load("visualization", "1", { packages: ["corechart"] });
            google.setOnLoadCallback(drawChart);
            function drawChart() {
                var options = {
                    title: 'Most Popular Products',
                    width: 700,
                    height: 500,
                    bar: { groupWidth: "95%" },
                    legend: { position: "none" },
                    isStacked: true
                };
                $.ajax({
                    type: "POST",
                    url: "Admin-Dashboard.aspx/GetChartData",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var data = google.visualization.arrayToDataTable(r.d);
                        var chart = new google.visualization.BarChart($("#chart_div")[0]);
                        chart.draw(data, options);
                    },
                    failure: function (r) {
                        alert(r.d);
                    },
                    error: function (r) {
                        alert(r.d);
                    }
                });
            }

            function downloadPDF() {
                html2canvas(document.querySelector("#chart_div")).then(canvas => {
                    var imgData = canvas.toDataURL('image/png');
                    var pdf = new jsPDF();
                    pdf.addImage(imgData, 'PNG', 10, 10);
                    pdf.save("chart.pdf");
                });
            }
        </script>
    </body>
    </html>
</asp:Content>
