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
