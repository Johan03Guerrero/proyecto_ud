# frozen_string_literal: true

require 'roo-xls'

class XlsxImporterService
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    xlsx = Roo::Spreadsheet.open(@file_path)
    xlsx.default_sheet = xlsx.sheets.first
    header = xlsx.row(1)
    data = (2..xlsx.last_row).map { |i| Hash[header.zip(xlsx.row(i))] }
    process_data(data)
  end

  private

  def process_data(data)
    periodos_hash = Periodo.pluck(:fecha, :id).to_h
    conceptos_hash = Concepto.pluck(:codigo, :id).to_h
    errors = []
    data = data.map do |row|
      periodo_id, concepto_id = data_hash(row, periodos_hash, conceptos_hash, errors)
      build_presupuesto_concepto(row, periodo_id, concepto_id)
    end
    PresupuestoConcepto.insert_all(data)
    errors
  end

  def data_hash(row, periodos_hash, conceptos_hash, errors)
    periodo_id = periodos_hash[row['fecha'].to_s]
    periodo_id = create_periodo(row, periodos_hash, errors) if periodo_id.nil?
    concepto_id = conceptos_hash[row['codigo'].to_s.gsub(' ', '')] ||
                  create_concepto(row, conceptos_hash)
    [periodo_id, concepto_id]
  end

  def create_periodo(row, periodos_hash, errors)
    anho_vigencia = obtener_anho_vigencia(row['fecha'])
    if anho_vigencia.nil?
      errors << errors(nil, 'Formato de fecha incorrecto', row)
      return nil
    end

    vigencia = buscar_vigencia(anho_vigencia, errors)
    if vigencia.nil?
      errors << errors(nil, 'No existe vigencia para ese año', row)
      return nil
    end

    periodo_id = crear_periodo(row['fecha'], vigencia, errors)
    return nil if periodo_id.nil?

    periodos_hash[row['fecha'].to_s] = periodo_id
    periodo_id
  end

  def obtener_anho_vigencia(fecha)
    fecha.split('-').last.length == 4 ? fecha.split('-').last.to_i : nil
  end

  def buscar_vigencia(anho_vigencia, _errors)
    VigenciaUd.find_by_anho_vigencia_ud(anho_vigencia)
  end

  def crear_periodo(fecha, vigencia, errors)
    periodo = Periodo.find_or_create_by(fecha: fecha, vigencia_ud: vigencia)
    if periodo.valid?
      periodo.id
    else
      errors << errors(nil, periodo.errors.full_messages.join(', '), row)
      nil
    end
  end

  def errors(id, error, row)
    { presupuesto_concepto_id: id, error: error, datos: row.to_s }
  end

  def create_concepto(row, conceptos_hash)
    concepto = Concepto.create(codigo: row['codigo'].to_s, nombre: row['concepto'])
    conceptos_hash[row['codigo'].to_s.gsub(' ', '')] = concepto.id
    concepto.id
  end

  def build_presupuesto_concepto(row, periodo_id, concepto_id)
    {
      presupuesto_inicial: row['presupuesto_inicial'].to_f,
      adicion_modificacion_mes: row['adicion_modificacion_mes'].to_f,
      adicion_modificacion_acumulado: row['adicion_modificacion_acumulado'].to_f,
      presupuesto_definitivo: row['presupuesto_definitivo'].to_f,
      recaudo_mes: row['recaudo_mes'].to_f,
      recaudo_acumulado: row['recaudo_acumulado'].to_f,
      ejecucion: row['porcentaje_ejecucion'].to_f,
      saldo_por_recaudar: row['saldo_por_recaudar'].to_f,
      concepto_id: concepto_id,
      periodo_id: periodo_id
    }
  end
end
