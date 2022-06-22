require "rocket_api/version"

RSpec.describe RocketApi do
  it "has a valid version number" do
    expect(Gem::Version.new(RocketApi::VERSION).class).to eq(Gem::Version)
  end
end