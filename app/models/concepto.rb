# frozen_string_literal: true

class Concepto < ApplicationRecord
  has_many :presupuesto_concepto

  scope :filter_dashboard, lambda { |tipo_concepto|
    where("codigo LIKE ?", "#{tipo_concepto}%")
  }

  HASH_GASTOS_FUNCIONAMIENTO = {
    "Gastos de funcionamiento": ["3-1"],
    "Servicios personales": ["3-1-1"],
    "Gastos generales": ["3-1-2"],
    "Promocion de la investigacion y desarrollo cientifico": ["3-1-6"],
    "Mejoramiento y ampliacion de la infraestructura fisica de la universidad": ["3-3-7"],
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

  HASH_INGRESOS_FUNCIONAMIENTO = {
    "Ingresos tributarios": ["2-1-1"],
    "Ingresos no tributarios": ["2-1-2"],
    "Transferencias nacion": ["2-2-1"],
    "Recursos de capital": ["2-4"],
    "Rendimientos por operaciones financieras": ["2-4-3"],
    "Transferencias administracion central": ["2-2-4"],
    "Venta de bienes y servicios": ["2-1-2-04-01"],
  }
end
