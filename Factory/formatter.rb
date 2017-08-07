class CsvFormatter
  def format(data)
    return '' if data.empty?

    result = data.keys.join(',') + '\n'
    result += data.values.join(',') + '\n'
  end
end

class JsonFormatter
  require 'json'
  
  def format(data)
    return '' if data.empty?

    data.to_json
  end
end

class Formatter
  def self.for(type)
    case type
    when 'csv'
      CsvFormatter.new
    when 'json'
      JsonFormatter.new
    else
      raise 'Not supported.'
    end
  end
end

class ReportGenerator
  def self.generate(data, type)
    Formatter.for(type).format(data)
  end
end

report_data = { name: 'klockner', age: 26, country: 'Brazil' }
puts ReportGenerator.generate(report_data, 'json')
