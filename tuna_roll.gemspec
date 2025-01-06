# frozen_string_literal: true

require_relative "lib/tuna_roll/version"

Gem::Specification.new do |spec|
  spec.name = "tuna_roll"
  spec.version = TunaRoll::VERSION
  spec.authors = ["Danielle Smith"]
  spec.email = ["danielle.smith@platform45.com"]

  spec.summary = "Find all the HTML classes used in your templates."
  spec.description = "Find all the HTML classes used in your templates. Super-duper experimental, only works on Slim and ERB (although any Temple engine can be adapted), and only find classes statically in the templates themselves."
  spec.homepage = "https://github.com/danini-the-panini/tuna_roll"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.4.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/danini-the-panini/tuna_roll"
  spec.metadata["changelog_uri"] = "https://github.com/danini-the-panini/tuna_roll/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.11"
  spec.add_dependency "temple", "~> 0.10.3"
  spec.add_dependency "slim", "~> 5.2"
  spec.add_dependency "progress", "~> 3.6"
end
