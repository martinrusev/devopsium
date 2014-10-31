# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "guard-sass"
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joshua Hawxwell"]
  s.date = "2014-09-12"
  s.description = "Guard::Sass automatically rebuilds sass (like sass --watch)"
  s.email = ["m@hawx.me"]
  s.homepage = "http://rubygems.org/gems/guard-sass"
  s.require_paths = ["lib"]
  s.rubyforge_project = "guard-sass"
  s.rubygems_version = "1.8.23.2"
  s.summary = "Guard gem for Sass"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<guard>, [">= 1.1.0"])
      s.add_runtime_dependency(%q<sass>, [">= 3.1"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<rspec>, ["> 2.0.0.rc"])
    else
      s.add_dependency(%q<guard>, [">= 1.1.0"])
      s.add_dependency(%q<sass>, [">= 3.1"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<rspec>, ["> 2.0.0.rc"])
    end
  else
    s.add_dependency(%q<guard>, [">= 1.1.0"])
    s.add_dependency(%q<sass>, [">= 3.1"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<rspec>, ["> 2.0.0.rc"])
  end
end
