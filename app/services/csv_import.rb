require 'csv'

class CsvImport
  def import(file)
    CSV.foreach(file, headers: true) do |row|
      CustomerImportService.import_customer(row)
    end
  end
end
