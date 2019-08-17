require 'rails_helper'

RSpec.describe "measurements/edit", type: :view do
  before(:each) do
    @measurement = assign(:measurement, Measurement.create!(
      :body_weight => "MyString",
      :hips => "MyString"
    ))
  end

  it "renders the edit measurement form" do
    render

    assert_select "form[action=?][method=?]", measurement_path(@measurement), "post" do

      assert_select "input[name=?]", "measurement[body_weight]"

      assert_select "input[name=?]", "measurement[hips]"
    end
  end
end
