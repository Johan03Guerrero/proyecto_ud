# frozen_string_literal: true
class DataVariacion
  def initialize(data_years, years, type)
    @data_years = data_years
    @years = years
    @type = type
  end

  def call
    data_year_1, data_year_2, gastos_total, *categories, data_final = transform_data
    data_formula = calculate_data_formula(data_year_1, data_year_2)
    json_data_final(data_formula, gastos_total, categories, data_final)
  end

  private

  def transform_data
    data_final = {}
    initial_data = get_initial_data
    gastos_total, *categories = initial_data
    year_1 = @data_years.first
    year_2 = @data_years.last

    @data_years.each_with_index do |x, index|
      data_final[@years[index]] = x
    end

    @years.each do |year|
      gastos_total << data_final[year].values.sum
    end

    if @type == "ingresos"
      gastos_total[0] = "INGRESOS FUNCIONAMIENTO"
    else
      gastos_total[0] = "GASTOS FUNCIONAMIENTO"
    end

    year_1[gastos_total[0].to_sym] = gastos_total[1]
    year_2[gastos_total[0].to_sym] = gastos_total.last

    [year_1, year_2, gastos_total, *categories, data_final]
  end

  def calculate_data_formula(data_year_1, data_year_2)
    data_year_1.map do |category, value|
      [category, calculate_variation_formula(value, data_year_2[category])]
    end.to_h
  end

  def json_data_final(data_formula, gastos_total, categories, data_final)
    categories.each do |category|
      category << data_formula[category.first.to_sym]
      data_final.each do |_, data_year|
        category << data_year[category.first.to_sym]
      end
    end
    gastos_total << data_formula[gastos_total[0].to_sym]
    gastos_total[1], gastos_total[-1] = gastos_total[-1], gastos_total[1]
    [gastos_total, *categories]
  end

  def calculate_variation_formula(year_final, year_old)
    ((year_final - year_old) * 100 / year_final).round(2)
  end

  def get_initial_data
    if @type == "ingresos"
      [
        ['INGRESOS FUNCIONAMIENTO'],
        ['Ingresos tributarios'],
        ['Ingresos no tributarios'],
        ['Transferencias nacion'],
        ['Recursos de capital'],
        ['Rendimientos por operaciones financieras'],
        ['Transferencias administracion central'],
        ['Venta de bienes y servicios'],
      ]
    else
      [
        ['GASTOS FUNCIONAMIENTO'],
        ['Gastos de funcionamiento'],
        ['Servicios personales'],
        ['Gastos generales'],
        ['Promocion de la investigacion y desarrollo cientifico'],
        ['Mejoramiento y ampliacion de la infraestructura fisica de la universidad'],
        ['Aportes patronales al sector privado y publico'],
        ['Servicios personales asociados a la nomina'],
        ['Servicios personales indirectos'],
        ['Adquisicion de bienes'],
        ['Adquisicion de servicios'],
        ['Otros gastos generales'],
        ['Transferencias para funcionamiento'],
        ['Inversion directa'],
        ['Transferencias para inversion'],
      ]
    end
  end
end
