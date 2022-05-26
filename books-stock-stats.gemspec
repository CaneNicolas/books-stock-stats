# frozen_string_literal: true

require_relative "lib/books_stock_stats/version"

Gem::Specification.new do |spec|
  spec.name = "books-stock-stats"
  spec.version = BooksStockStats::VERSION
  spec.authors = ["CaneNicolas"]
  spec.email = ["cane.nicolas@hotmail.com"]

  spec.summary = "This is a gem to manage a stock of books."
  spec.description = ""
  spec.homepage = "https://github.com/CaneNicolas/books-stock-stats"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/CaneNicolas/books-stock-stats"
  spec.metadata["changelog_uri"] = "https://github.com/CaneNicolas/books-stock-stats"

  spec.files = Dir.glob("lib/**/*")
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
