class EstimatedProjectionService
  def initialize(data, inflacion, ipc)
    @data = data
    @inflacion = inflacion
    @ipc = ipc
  end

  def call
    promedios_transformados = []
    @data&.each do |concepto|
      valores = concepto[1..-1].drop(1).select { |valor| valor.is_a?(Float) }
      promedio = valores.sum / valores.length rescue 0
      promedio_transformado = promedio * (1 + @inflacion/100) * (1 + @ipc/100)
      promedios_transformados << [concepto[0], promedio_transformado]
    end

    labels = promedios_transformados.map { |concepto| concepto[0] }
    series = promedios_transformados.map { |concepto| concepto[1] }

    {
      labels: labels,
      series: series,
      result_complete: promedios_transformados
    }
  end
end
