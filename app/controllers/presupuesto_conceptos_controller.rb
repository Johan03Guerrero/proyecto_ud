# frozen_string_literal: true

class PresupuestoConceptosController < ApplicationController
  def create
    xlsx_importer = XlsxImporterService.new(presupuesto_concepto_params[:file])
    errors = xlsx_importer.call
    if errors.empty?
      redirect_to root_path(partial: 'form'), notice: 'El archivo se ha cargado exitosamente'
    else
      redirect_to root_path(partial: 'form'), alert: "Error al cargar el archivo excel: #{errors.join(', ')}"
    end
  rescue StandardError => e
    puts "Se ha producido una excepción: #{e.message}"
    redirect_to root_path(partial: 'form'),
                alert: 'Error al cargar el archivo excel, verifique que el formato sea el correcto'
  end

  private

  def presupuesto_concepto_params
    params.require(:presupuesto_concepto).permit(
      :presupuesto_inicial,
      :adicion_modificacion_mes,
      :adicion_modificacion_acumulado,
      :presupuesto_definitivo,
      :recaudo_mes,
      :recaudo_acumulado,
      :ejecucion,
      :saldo_por_recaudar,
      :concepto_id,
      :periodo_id,
      :file
    )
  end
end
