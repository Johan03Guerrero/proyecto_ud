# frozen_string_literal: true

class PresupuestoConcepto < ApplicationRecord
  attr_accessor :file

  belongs_to :concepto
  belongs_to :periodo

  validates :periodo_id, uniqueness: { scope: :concepto_id }

  delegate :nombre, to: :concepto, prefix: true, allow_nil: true
  delegate :codigo, to: :concepto, prefix: true, allow_nil: true
  delegate :fecha, to: :periodo, prefix: true, allow_nil: true

  scope :filter_dashboard, lambda { |fecha_inicio, fecha_fin|
                             where(periodo:
                               Periodo.filter_fechas(fecha_inicio, fecha_fin).pluck(:id)).includes(:concepto, :periodo)
                           }

  scope :filter_concepto_dashboard, lambda { |fecha_inicio, fecha_fin, concepto|
                             where(concepto_id: concepto, periodo:
                               Periodo.filter_fechas(fecha_inicio, fecha_fin).pluck(:id)).includes(:concepto, :periodo)
                           }
end
