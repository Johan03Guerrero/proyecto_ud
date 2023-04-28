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
    return {
      series: this.seriesValue,
      chart: {
        width: 680,
        type: 'pie',
      },
      labels: this.labelsValue,
      responsive: [{
        breakpoint: 480,
        options: {
          chart: {
            width: 210
          },
          legend: {
            position: 'start',
          }
        }
      }],
      dataLabels: {
        enabled: true,
        textAnchor: 'start',
        formatter: function(val, opt) {
          const label = opt.w.globals.labels[opt.seriesIndex];
          const serieValue = opt.w.globals.seriesTotals[opt.seriesIndex];
          const value =  Math.round(val * 100) / 100;
          return (label + ":  $" + serieValue + ", " + value + "%");
        },
        style: {
          fontSize: '18px',
          fontFamily: 'Helvetica, Arial, sans-serif',
          fontWeight: 'bold',
        },
        offsetX: 0,
      },
      theme: {
        palette: 'palette2'
      },
    };
  }
}
