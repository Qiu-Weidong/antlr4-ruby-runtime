# frozen_string_literal: true

require_relative "lib/antlr4ruby/version"

Gem::Specification.new do |spec|
  spec.name = "antlr4ruby"
  spec.version = Antlr4ruby::VERSION
  spec.authors = ["邱维东"]
  spec.email = ["568385476@qq.com"]

  spec.summary = "ruby runtime for antlr4. antlr4 的 ruby 运行时。"
  spec.description = "ruby runtime for antlr4. antlr4 的 ruby 运行时。"
  spec.homepage = "https://github.com/Qiu-Weidong/antlr4-ruby-runtime.git"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "不要"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Qiu-Weidong/antlr4-ruby-runtime.git"
  # spec.metadata["changelog_uri"] = "不要"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
