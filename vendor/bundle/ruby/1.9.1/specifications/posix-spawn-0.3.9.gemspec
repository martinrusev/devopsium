# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "posix-spawn"
  s.version = "0.3.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Tomayko", "Aman Gupta"]
  s.date = "2014-08-01"
  s.description = "posix-spawn uses posix_spawnp(2) for faster process spawning"
  s.email = ["r@tomayko.com", "aman@tmm1.net"]
  s.executables = ["posix-spawn-benchmark"]
  s.extensions = ["ext/extconf.rb"]
  s.extra_rdoc_files = ["COPYING", "HACKING"]
  s.files = ["bin/posix-spawn-benchmark", "COPYING", "HACKING", "ext/extconf.rb"]
  s.homepage = "http://github.com/rtomayko/posix-spawn"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23.2"
  s.summary = "posix_spawnp(2) for ruby"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake-compiler>, ["= 0.7.6"])
    else
      s.add_dependency(%q<rake-compiler>, ["= 0.7.6"])
    end
  else
    s.add_dependency(%q<rake-compiler>, ["= 0.7.6"])
  end
end
