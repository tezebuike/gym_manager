require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :slug => "Slug",
      :first_name => "First Name",
      :middle_name => "Middle Name",
      :email => "Email",
      :phone_number => "",
      :address => "Address",
      :gender => "Gender",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Middle Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Status/)
  end
end
