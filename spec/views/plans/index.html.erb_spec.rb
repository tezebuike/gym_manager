require 'rails_helper'

RSpec.describe "plans/index", type: :view do
  before(:each) do
    assign(:plans, [
      Plan.create!(
        :name => "Name",
        :type => "Type",
        :duration => 2
      ),
      Plan.create!(
        :name => "Name",
        :type => "Type",
        :duration => 2
      )
    ])
  end

  it "renders a list of plans" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
