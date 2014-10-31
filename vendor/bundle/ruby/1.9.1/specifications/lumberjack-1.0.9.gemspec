# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "lumberjack"
  s.version = "1.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian Durand"]
  s.date = "2014-06-25"
  s.description = "A simple, powerful, and very fast logging utility that can be a drop in replacement for Logger or ActiveSupport::BufferedLogger. Provides support for automatically rolling log files even with multiple processes writing the same log file."
  s.email = ["bdurand@embellishedvisions.com"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://github.com/bdurand/lumberjack"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23.2"
  s.summary = "A simple, powerful, and very fast logging utility that can be a drop in replacement for Logger or ActiveSupport::BufferedLogger."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
