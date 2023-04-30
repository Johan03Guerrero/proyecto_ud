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
                    opacity: 0.3
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
                categories: this.labelsValue,
                title: {
                    text: 'Concepto'
                }
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
