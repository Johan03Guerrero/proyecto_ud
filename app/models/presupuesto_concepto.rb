# frozen_string_literal: true

class PresupuestoConcepto < ApplicationRecord
  attr_accessor :file

  belongs_to :concepto
  belongs_to :periodo

  validates :periodo_id, uniqueness: { scope: :concepto_id }

  delegate :nombre, to: :concepto, prefix: true, allow_nil: true
  delegate :codigo, to: :concepto, prefix: true, allow_nil: true
  delegate :fecha, to: :periodo, prefix: true, allow_nil: true

  scope :filter_dashboard, lambda { |fecha_inicio, fecha_fin, tipo_concepto|
                             where(periodo_id:
                               Periodo.filter_fechas(fecha_inicio, fecha_fin).pluck(:id),
                               concepto_id: Concepto.filter_dashboard(tipo_concepto).pluck(:id)
                              ).includes(:concepto, :periodo)
                           }

  scope :filter_concepto_dashboard, lambda { |fecha_inicio, fecha_fin, concepto|
                             where(concepto_id: concepto, periodo_id:
                               Periodo.filter_fechas(fecha_inicio, fecha_fin).pluck(:id)).includes(:concepto, :periodo)
                           }
end
