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
    const colorList = [
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
      "#FFB6C1",
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
        height: 350,
        type: 'line',
        dropShadow: {
          enabled: true,
          color: '#000',
          top: 18,
          left: 7,
          blur: 10,
          opacity: 0.3
        },
      },
      colors: colorList,
      stroke: {
        width: 5,
        curve: 'smooth'
      },
      dataLabels: {
        enabled: true,
      },
      xaxis: {
        categories: this.labelsValue,
        title: {
          text: 'Concepto'
        },
        labels: {
          rotate: -25,
          rotateAlways: true,
          style: {
            colors: [],
            fontSize: '9px',
            fontFamily: 'Helvetica, Arial, sans-serif',
            fontWeight: 400,
            cssClass: 'apexcharts-xaxis-label',
          },
        },
      },
      yaxis: {
        title: {
          text: 'Presupuesto Inicial'
        },
        min: 0,
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
        position: 'top',
      }
    };
  }
}
