require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        :slug => "Slug",
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :email => "Email",
        :phone_number => "",
        :address => "Address",
        :gender => "Gender",
        :status => "Status"
      ),
      Customer.create!(
        :slug => "Slug",
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :email => "Email",
        :phone_number => "",
        :address => "Address",
        :gender => "Gender",
        :status => "Status"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
