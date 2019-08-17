require 'rails_helper'

RSpec.describe "measurements/show", type: :view do
  before(:each) do
    @measurement = assign(:measurement, Measurement.create!(
      :body_weight => "Body Weight",
      :hips => "Hips"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Body Weight/)
    expect(rendered).to match(/Hips/)
  end
end
