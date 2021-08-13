# frozen_string_literal: true

require_relative "lib/simple_graphql_client/version"

Gem::Specification.new do |spec|
  spec.name          = "simple_graphql_client"
  spec.version       = SimpleGraphqlClient::VERSION
  spec.authors       = ["Christophe Verbinnen"]
  spec.email         = ["christophev@knowbe4.com"]

  spec.summary       = "Dead simple GQL client"
  spec.description   = "does the bare minimum"
  spec.homepage      = "https://github.com/djpate/simple-graphql-client"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/djpate/simple-graphql-client"
  spec.metadata["changelog_uri"] = "https://github.com/djpate/simple-graphql-client/blob/main/Changelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "rest-client", "~> 2.1"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
