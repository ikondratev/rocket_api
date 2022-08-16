require "rocket_api/constants"
require "rocket_api/errors"

RSpec.describe RocketApi::Validation do
  include RocketApi::Validation
  describe "#presence_check" do
    let(:collection) { RocketApi::AVAILABLE_COMMANDS }

    context "in case of available commands" do
      it "shouldn't raise any errors" do
        result = presence_check(collection, "init")
        expect{ result }.not_to raise_error
        expect(result).to be(nil)
      end
    end

    context "in case of not available commands" do
      it "should raise RocketApi::ValidationError" do
        expect{ presence_check(collection, "initt") }.to raise_error(RocketApi::ValidationError)
      end
    end
  end

  describe "#check_valid_commands" do
    context "in case of valid commands" do
      let(:commands) do
        RocketApi::UserCommands.new(
          init: "init",
          app: "gem",
          name: "gem_name"
        )
      end

      it "shouldn't raise any errors" do
        result = check_valid_commands(commands)
        expect{ result }.not_to raise_error
        expect(result).to be(nil)
      end
    end

    context "in case of not valid commands" do
      let(:commands_s) do
        RocketApi::UserCommands.new(
          init: "wrong_command",
          app: "wrong_command",
          name: "wrong_command"
        )
      end

      it "should raise RocketApi::ValidationError" do
        expect{ check_valid_commands(commands_s) }.to raise_error(RocketApi::ValidationError)
      end
    end
  end
end