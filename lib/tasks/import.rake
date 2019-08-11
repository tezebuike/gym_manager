namespace :import do
  desc "import sales records into the database"
  task import_customers: :environment do
    file = File.join Rails.root, "surefit data.csv"

    CustomerImportService.new(file).import
    puts "Completed"
  end
end