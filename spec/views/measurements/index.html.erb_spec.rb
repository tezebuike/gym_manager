require 'rails_helper'

RSpec.describe "measurements/index", type: :view do
  before(:each) do
    assign(:measurements, [
      Measurement.create!(
        :body_weight => "Body Weight",
        :hips => "Hips"
      ),
      Measurement.create!(
        :body_weight => "Body Weight",
        :hips => "Hips"
      )
    ])
  end

  it "renders a list of measurements" do
    render
    assert_select "tr>td", :text => "Body Weight".to_s, :count => 2
    assert_select "tr>td", :text => "Hips".to_s, :count => 2
  end
end
