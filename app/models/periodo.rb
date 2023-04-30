# frozen_string_literal: true

class Periodo < ApplicationRecord
  belongs_to :vigencia_ud
  has_many :presupuesto_concepto

  scope :filter_fechas, lambda { |fecha_inicio, fecha_fin|
                          map do |periodo|
                            if Date.parse(periodo.fecha) >= fecha_inicio && Date.parse(periodo.fecha) <= fecha_fin
                              periodo
                            end
                          end .compact
                        }

  scope :filter_year, lambda { |year|
                          map do |periodo|
                            if Date.parse(periodo.fecha) >= Date.parse("01-01-#{year}") && Date.parse(periodo.fecha) <= Date.parse("01-12-#{year}")
                              periodo
                            end
                          end .compact.sort_by { |periodo| Date.parse(periodo.fecha) }
                        }
end
