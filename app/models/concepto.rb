# frozen_string_literal: true

class Concepto < ApplicationRecord
  has_many :presupuesto_concepto


  HASH_GASTOS_FUNCIONAMIENTO = {
    "Aportes patronales al sector privado y publico": ["3-1-1-03"],
    "Servicios personales asociados a la nomina": ["3-1-1-01"],
    "Servicios personales indirectos": ["3-1-1-02"],
    "Adquisicion de bienes": ["3-1-2-01"],
    "Adquisicion de servicios": ["3-1-2-02"],
    "Otros gastos generales": ["3-1-2-03"],
    "Transferencias para funcionamiento": ["3-1-3"],
    "Inversion directa": ["3-3-1"],
    "Transferencias para inversion": ["3-3-2"],
  }
end
