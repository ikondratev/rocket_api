require "rocket_api/core"
require "rocket_api/errors"
require "rocket_api/constants"

RSpec.describe RocketApi::Core do
  include RocketApi::Core
  describe "#apply_commads" do
    context "in case of non empty commands" do
      let(:commands) do
        ["init", "gem", "gem_name"]
      end

      it "should return valid result" do
        result = apply_commands(commands)
        expect{ result }.not_to raise_error
        expect(result).to be_kind_of(RocketApi::UserCommands)
        expect(result.init).to eq("init")
        expect(result.app).to eq("gem")
        expect(result.name).to eq("gem_name")
      end
    end

    context "in case of empty fields" do
      let(:commands) do
        ["init", "gem"]
      end

      it "should raise error ApplyCommandsError" do
        expect{ apply_commands(commands) }.to raise_error(RocketApi::ApplyCommandsError)
      end
    end

    context "in case of wrong literal name" do
      let(:commands) do
        ["Init", "coMMand", "$#gem_name#"]
      end

      it "shouldn't raise any errors" do
        result = apply_commands(commands)
        expect{ result }.not_to raise_error
        expect(result.init).to eq("init")
        expect(result.app).to eq("command")
        expect(result.name).to eq("gem_name")
      end
    end
  end
end