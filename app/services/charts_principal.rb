# frozen_string_literal: true

class ChartsPrincipal

  def initialize(year, type)
    @year = year
    @type = type
  end
  
  def call
    hash_rubros_funcionamiento = @type == 'ingresos' ? Concepto::HASH_INGRESOS_FUNCIONAMIENTO : Concepto::HASH_GASTOS_FUNCIONAMIENTO
    json_pie_presupuesto_funcionamiento(@year, hash_rubros_funcionamiento)
  end
  
  private
  
  def json_pie_presupuesto_funcionamiento(year, hash_rubros_funcionamiento)
    periodos = Periodo.filter_year(year)
    json_final = {}
    hash_conceptos = Concepto.where(codigo: hash_rubros_funcionamiento.values.flatten).pluck(:id, :codigo, :nombre)
    hash_conceptos = hash_conceptos.map do |concepto|
      [concepto[1], "#{concepto[0]}-#{concepto[2]}"]
    end.to_h
    if periodos.present? 
      periodos.each do |periodo|
        hash_rubros_funcionamiento.each do |rubro_funcionamiento|
          presupuesto_inicial = nil
          rubro_funcionamiento.last.each do |codigo|
            concepto = hash_conceptos[codigo]
            presupuesto_inicial = PresupuestoConcepto.find_by(concepto_id: concepto.split("-").first, periodo_id: periodo.id) rescue ''
            break if presupuesto_inicial.present?
          end
          if presupuesto_inicial.present?
            json_final[rubro_funcionamiento.first] = presupuesto_inicial.presupuesto_inicial
          end
        end
      end
    end
    json_final
  end
end
