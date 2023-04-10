import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["chart"]

  static values = {
    labels: Array,
    series: Array,
    title: String,
  }

  initialize() {
    this.chart = new ApexCharts(this.chartTarget, this.chartOptions);
    this.chart.render();
  }

  get chartOptions() {
    return {
      series: this.seriesValue,
      chart: {
        height: 350,
        type: 'line',
        dropShadow: {
          enabled: true,
          color: '#000',
          top: 18,
          left: 7,
          blur: 10,
          opacity: 0.2
        },
      },
      stroke: {
        width: 5,
        curve: 'smooth'
      },
      dataLabels: {
        enabled: true,
      },
      xaxis: {
        type: 'datetime',
        categories: this.labelsValue,
        tickAmount: 10,
        labels: {
          formatter: function (value, timestamp, opts) {
            return opts.dateFormatter(new Date(timestamp), 'MMM yyyy')
          }
        }
      },
      title: {
        text: this.titleValue,
        align: 'left',
        style: {
          fontSize: "16px",
          color: '#666'
        }
      },
      legend: {
        position: 'bottom',
        horizontalAlign: 'center',
        floating: true,
        offsetY: -25,
        offsetX: -5
      }
    };
  }
}