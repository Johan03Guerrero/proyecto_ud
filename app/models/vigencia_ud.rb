# frozen_string_literal: true

class VigenciaUd < ApplicationRecord
  has_many :periodo
  after_initialize :set_default_values
  validates :anho_vigencia_ud, uniqueness: true

  def set_default_values
    self.archivo_vigencia_ud ||= []
  end
end
