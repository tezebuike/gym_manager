require 'rails_helper'

RSpec.describe "plans/edit", type: :view do
  before(:each) do
    @plan = assign(:plan, Plan.create!(
      :name => "MyString",
      :type => "",
      :duration => 1
    ))
  end

  it "renders the edit plan form" do
    render

    assert_select "form[action=?][method=?]", plan_path(@plan), "post" do

      assert_select "input[name=?]", "plan[name]"

      assert_select "input[name=?]", "plan[type]"

      assert_select "input[name=?]", "plan[duration]"
    end
  end
end
