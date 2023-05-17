class FormatNumberService
  def initialize(number)
    @number = number
  end

  def call
    parts = @number.to_s.split(',')
    whole_part = parts[0].reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    decimal_part = parts[1] if parts.length > 1
  
    if decimal_part
      formatted_number = "#{whole_part}.#{decimal_part}"
    else
      formatted_number = whole_part
    end
  
    formatted_number
  end
end