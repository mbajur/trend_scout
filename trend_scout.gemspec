require_relative "lib/trend_scout/version"

Gem::Specification.new do |spec|
  spec.name        = "trend_scout"
  spec.version     = TrendScout::VERSION
  spec.authors     = ["mbajur"]
  spec.email       = ["mbajur@gmail.com"]
  spec.homepage    = "https://github.com/mbajur/trend_scout"
  spec.summary     = "A tool for tracking numerical trends, storing values, generating charts, and detecting anomalies."
  spec.description = "trend_scout monitors prices, currency rates, or any other number values, saving daily data, visualizing trends, and alerting users about anomalies."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mbajur/trend_scout"
  spec.metadata["changelog_uri"] = "https://github.com/mbajur/trend_scout"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.5.1"
  spec.add_dependency "chartkick"
end
