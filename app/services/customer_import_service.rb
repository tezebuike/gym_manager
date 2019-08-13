class CustomerImportService
  TITLES = ['mr.', 'mrs.', 'miss.', 'prof.', 'pastor', 'ps.', 'engr.', 'dr.', 'ms']

  def initialize(file)
    @file = file
  end

  def import(file_import: CsvImport.new)
    file_import.import(@file)
  end

  def self.import_customer(row)
    puts "\n\n got here"
    p row
    customer_data = {}
    customer_data[:slug] = row["SLUG"].split('.').join('').upcase
    customer_data[:date_of_birth] = normalize_birthday(row["BIRTHDAY"]) if row["BIRTHDAY"].present?
    customer_data[:email] = row["EMAIL"].downcase if row["EMAIL"].present?
    customer_data[:address] = row["ADDRESS"].titleize if row["ADDRESS"].present?
    customer_data[:phone_number] = row["PHONE NO"] if row["PHONE NO"].present?

    customer_data.merge!(normalize_full_name(row["NAME"]))
    customer = Customer.new(customer_data)
    if customer.save
      puts "Created customer with SF ID - #{customer_data[:slug]}"
      cust = customer
    else
      cust = customer
      puts "Failed to create customer - #{customer_data[:slug]}. Error: #{customer.errors.full_messages}"
    end
  end

  def self.normalize_birthday(birthday)
    dob = Date.parse(birthday)
    if dob.year == 2019
      dob = dob.change(year: 1990)
    end
    dob
  end

  def self.normalize_full_name(fullname)
    names = fullname.split
    if TITLES.any? { |s| s.include?(names.first.downcase) }
      title = names.first.split('.')[0].capitalize + "."
      names.delete(title)
    end
    last_name = names[0].capitalize
    first_name = names[1].capitalize if names[1].present?
    first_name = last_name if first_name.nil?
    middle_name = names[2].capitalize if names[2].present?

    return {
      title: title,
      last_name: last_name,
      first_name: first_name,
      middle_name: middle_name,
    }
  end
end
