require 'rails_helper'

RSpec.describe "attendances/edit", type: :view do
  before(:each) do
    @attendance = assign(:attendance, Attendance.create!(
      :deleted => false,
      :user => nil,
      :customer => nil
    ))
  end

  it "renders the edit attendance form" do
    render

    assert_select "form[action=?][method=?]", attendance_path(@attendance), "post" do

      assert_select "input[name=?]", "attendance[deleted]"

      assert_select "input[name=?]", "attendance[user_id]"

      assert_select "input[name=?]", "attendance[customer_id]"
    end
  end
end
