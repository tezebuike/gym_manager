require 'rails_helper'

RSpec.describe "customers/new", type: :view do
  before(:each) do
    assign(:customer, Customer.new(
      :slug => "MyString",
      :first_name => "MyString",
      :middle_name => "MyString",
      :email => "MyString",
      :phone_number => "",
      :address => "MyString",
      :gender => "MyString",
      :status => "MyString"
    ))
  end

  it "renders new customer form" do
    render

    assert_select "form[action=?][method=?]", customers_path, "post" do

      assert_select "input[name=?]", "customer[slug]"

      assert_select "input[name=?]", "customer[first_name]"

      assert_select "input[name=?]", "customer[middle_name]"

      assert_select "input[name=?]", "customer[email]"

      assert_select "input[name=?]", "customer[phone_number]"

      assert_select "input[name=?]", "customer[address]"

      assert_select "input[name=?]", "customer[gender]"

      assert_select "input[name=?]", "customer[status]"
    end
  end
end
