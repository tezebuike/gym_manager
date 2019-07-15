require 'rails_helper'

RSpec.describe "subscriptions/index", type: :view do
  before(:each) do
    assign(:subscriptions, [
      Subscription.create!(
        :receipt_number => "Receipt Number",
        :mode_of_payment => "Mode Of Payment",
        :amount_paid => "9.99",
        :balance => "9.99",
        :discount => "9.99",
        :status => "Status",
        :customer => nil,
        :plan => nil
      ),
      Subscription.create!(
        :receipt_number => "Receipt Number",
        :mode_of_payment => "Mode Of Payment",
        :amount_paid => "9.99",
        :balance => "9.99",
        :discount => "9.99",
        :status => "Status",
        :customer => nil,
        :plan => nil
      )
    ])
  end

  it "renders a list of subscriptions" do
    render
    assert_select "tr>td", :text => "Receipt Number".to_s, :count => 2
    assert_select "tr>td", :text => "Mode Of Payment".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
