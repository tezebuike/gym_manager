require 'rails_helper'

RSpec.describe "subscriptions/show", type: :view do
  before(:each) do
    @subscription = assign(:subscription, Subscription.create!(
      :receipt_number => "Receipt Number",
      :mode_of_payment => "Mode Of Payment",
      :amount_paid => "9.99",
      :balance => "9.99",
      :discount => "9.99",
      :status => "Status",
      :customer => nil,
      :plan => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Receipt Number/)
    expect(rendered).to match(/Mode Of Payment/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
