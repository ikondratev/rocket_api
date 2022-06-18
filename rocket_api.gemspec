lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "English"
require "rocket_api/version"

Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  if s.respond_to? :required_rubygems_version=
    s.required_rubygems_version = Gem::Requirement.new(">= 0")
  end
  s.rubygems_version = "2.7"
  s.required_ruby_version = ">=2.2"
  s.name = "rocket_api"
  s.version = RocketApi::VERSION
  s.executables << "rocket_api"
  s.license = "MIT"
  s.summary = "Create gem project structure and init main files in directory"
  s.description = "Initialize directory with gem's structure.\n Include:\n*.gemspec\nlib/version\n.gitignore\nbin/*"
  s.authors = ["Ilya Kondratev"]
  s.email = "ilyafulleveline@gmail.com"
  s.homepage = "https://github.com/ikondratev/rocket_api"
  s.files = `git ls-files`.split($RS)
  s.add_dependency "rubocop", "~> 1.26"
  s.add_dependency "rubocop-rake"
end
