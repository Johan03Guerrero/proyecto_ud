class DataVariacionChart
  def initialize(data, years)
    @data = data
    @years = years
  end

  def call
    labels = @data.map { |item| item[0] }

    series = @years.map do |year|
      {
        name: "serie_#{year}",
        data: @data.map { |item| item[@years.index(year) + 2] }
      }
    end

    series_variacion = @data.map { |item| item[1] }

    {
      labels: labels,
      series: series,
      series_variacion: series_variacion
    }
  end
end