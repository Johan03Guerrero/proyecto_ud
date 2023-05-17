import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["chart"]

  static values = {
    labels: Array,
    series: Array,
    width: Number,
  }

  initialize() {
    this.chart = new ApexCharts(this.chartTarget, this.chartOptions);
    this.chart.render();
  }

  get chartOptions() {
    const colorList = [
      "#FFB6C1",
      "#4682B4",
      "#FF8C00",
      "#696969",
      "#FF3700",
      "#008080",
      "#8A2BE2",
      "#556B2F",
      "#800080",
      "#006400",
      "#FF0F7A",
      "#4169E1",
      "#8B0000",
      "#008B8B",
      "#483D8B",
      "#00CED1",
      "#B22222",
      "#2F4F4F",
      "#008000",
      "#CD853F"
    ];
    return {
      series: this.seriesValue,
      chart: {
        width: this.widthValue,
        type: 'pie',
      },
      colors: colorList,
      labels: this.labelsValue,
      responsive: [{
        breakpoint: 480,
        options: {
          chart: {
            width: this.widthValue/1.2
          },
          legend: {
            position: 'start',
          }
        }
      }],
      dataLabels: {
        enabled: true,
        textAnchor: 'start',
        formatter: function (val, opt) {
          const label = opt.w.globals.labels[opt.seriesIndex];
          const serieValue = opt.w.globals.seriesTotals[opt.seriesIndex].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
          const value = Math.round(val * 100) / 100;
          return [`${value}%`, label, `$ ${serieValue}`];
        },
        style: {
          fontSize: '9px',
          fontFamily: 'Helvetica, Arial, sans-serif',
          fontWeight: 'bold',
          colors: ['#fff']
        },
        offsetX: 0,
        offsetY: 0,
      },
      legend: {
        fontSize: '14px',
      }
    };
  }
}
