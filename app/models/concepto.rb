# frozen_string_literal: true

class Concepto < ApplicationRecord
  has_many :presupuesto_concepto
  validates :fecha, uniqueness: true
end
