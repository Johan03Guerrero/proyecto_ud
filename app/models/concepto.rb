# frozen_string_literal: true

class Concepto < ApplicationRecord
  has_many :presupuesto_concepto


  HASH_GASTOS_FUNCIONAMIENTO = {
    "Pago Pensiones": ["3-34"],
    "Nómina Administrativos": ["3-1-1-1", "3-1-1-01"],
    "Nómina Docentes": ["3-1-2-1-01"],
    "Nómina Trabajadores Oficiales": ["3-1-2-1-02-1", "3-1-2-1-02-10"],
    "Profesores Hora Cátedra y Vinculación Especial": ["3-1-2-1-02-99-0", "3-1-2-1-02-99-01"],
    "Gastos Generales": ["3-1-1-2"],
  }
end
