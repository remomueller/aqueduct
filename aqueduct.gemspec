# Compiling the Gem
# gem build aqueduct.gemspec
# gem install ./aqueduct-x.x.x.gem --no-ri --no-rdoc --local
#
# gem push aqueduct-x.x.x.gem
# gem list -r aqueduct
# gem install aqueduct

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "aqueduct/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "aqueduct"
  s.version     = Aqueduct::VERSION::STRING
  s.authors     = ["Remo Mueller"]
  s.email       = ["remosm@gmail.com"]
  s.homepage    = "https://github.com/remomueller"
  s.summary     = "Data integration gem designed to increase data flow between applications"
  s.description = "Data integration gem designed to increase data flow between applications using a common interface"
  s.license     = 'CC BY-NC-SA 3.0'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["aqueduct.gemspec", "CHANGELOG.md", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0.beta1"

  s.add_development_dependency "sqlite3"
end
