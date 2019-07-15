require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
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

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do

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
