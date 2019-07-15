require 'rails_helper'

RSpec.describe "attendances/index", type: :view do
  before(:each) do
    assign(:attendances, [
      Attendance.create!(
        :deleted => false,
        :user => nil,
        :customer => nil
      ),
      Attendance.create!(
        :deleted => false,
        :user => nil,
        :customer => nil
      )
    ])
  end

  it "renders a list of attendances" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
