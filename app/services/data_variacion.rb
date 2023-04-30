# frozen_string_literal: true
class DataVariacion
    def initialize(data_years, years)
      @data_years = data_years
      @years = years
    end
  
    def call
      data_year_1, data_year_2, gastos_total, *categories, data_final = transform_data
      data_formula = calculate_data_formula(data_year_1, data_year_2)
      json_data_final(data_formula, gastos_total, categories, data_final)
    end
  
    private
  
    def transform_data
      data_final = {}
      gastos_total, *categories = initial_data
      year_1 = @data_years.first
      year_2 = @data_years.last
  
      @data_years.each_with_index do |x, index|
        data_final[@years[index]] = x
      end
  
      @years.each do |year|
        gastos_total << data_final[year].values.sum
      end
  
      year_1['GASTOS FUNCIONAMIENTO'.to_sym] = gastos_total[1]
      year_2['GASTOS FUNCIONAMIENTO'.to_sym] = gastos_total.last
  
      [year_1, year_2, gastos_total, *categories, data_final]
    end
  
    def calculate_data_formula(data_year_1, data_year_2)
      data_year_1.map do |category, value|
        [category, calculate_variation_formula(value, data_year_2[category])]
      end.to_h
    end
  
    def json_data_final(data_formula, gastos_total, categories, data_final)
      categories.each do |category|
        data_final.each do |_, data_year|
          category << data_year[category.first.to_sym]
        end
        category << data_formula[category.first.to_sym]
      end
      gastos_total << data_formula["GASTOS FUNCIONAMIENTO".to_sym]
      [gastos_total, *categories]
    end
  
    def calculate_variation_formula(year_final, year_old)
      ((year_final - year_old) * 100 / year_final).round(2)
    end
  
    def initial_data
      [
        ['GASTOS FUNCIONAMIENTO'],
        ['Nómina Administrativos'],
        ['Nómina Docentes'],
        ['Nómina Trabajadores Oficiales'],
        ['Profesores Hora Cátedra y Vinculación Especial'],
        ['Gastos Generales'],
        ['Pago Pensiones']
      ]
    end
  end
  