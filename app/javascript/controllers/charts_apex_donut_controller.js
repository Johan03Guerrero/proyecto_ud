import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["chart"]

  static values = {
    labels: Array,
    series: Array,
  }

  initialize() {
    this.chart = new ApexCharts(this.chartTarget, this.chartOptions);
    this.chart.render();
  }

  get chartOptions() {
    const colorList = [
      "#008FFB",
      "#00E396",
      "#FEB019",
      "#FF4560",
      "#775DD0",
      "#3f51b5",
      "#03a9f4",
      "#4caf50",
      "#f9ce1d",
      "#FF9800"
    ];
    return {
      series: this.seriesValue,
      chart: {
        width: 950,
        type: 'pie',
      },
      colors: colorList,
      labels: this.labelsValue,
      responsive: [{
        breakpoint: 480,
        options: {
          chart: {
            width: 780
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
          const serieValue = opt.w.globals.seriesTotals[opt.seriesIndex];
          const value = Math.round(val * 100) / 100;
          return [`${value}%`, label, `$ ${serieValue}`];
        },
        style: {
          fontSize: '11px',
          fontFamily: 'Helvetica, Arial, sans-serif',
          fontWeight: 'bold',
          colors: ['#fff']
        },
        offsetX: 0,
        offsetY: 0,
      },
      legend: {
        fontSize: '16px',
      }
    };
  }
}
