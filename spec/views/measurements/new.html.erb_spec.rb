require 'rails_helper'

RSpec.describe "measurements/new", type: :view do
  before(:each) do
    assign(:measurement, Measurement.new(
      :body_weight => "MyString",
      :hips => "MyString"
    ))
  end

  it "renders new measurement form" do
    render

    assert_select "form[action=?][method=?]", measurements_path, "post" do

      assert_select "input[name=?]", "measurement[body_weight]"

      assert_select "input[name=?]", "measurement[hips]"
    end
  end
end
