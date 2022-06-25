require "rocket_api/rocket_commands"
require "rocket_api/errors"
require "rocket_api/constants"

RSpec.describe RocketApi::RocketCommands do
  context "#init_gem_files" do
    context "in case of empty file name" do
      it "should raise RocketApi::InitFilesError" do
        expect{ RocketApi::RocketCommands.init_files({}) }.to raise_error(RocketApi::InitFilesError)
      end
    end
  end

  context "#init_gem_dir" do
    context "in case of not empty dir" do
      it "should raise RocketApi::CreateDirError" do
        expect{ RocketApi::RocketCommands.init_dirs({}) }.to raise_error(RocketApi::CreateDirError)
      end
    end
  end
end