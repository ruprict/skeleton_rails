Gem::Specification.new do |s|
  s.name        = "skeleton_rails"
  s.version     = "0.1.1"
  s.author      = "Glenn Goodrich"
  s.email       = "glenn.goodrich@gmail.com"
  s.homepage    = "http://github.com/ruprict/skeleton_rails"
  s.summary     = "Generates a layout based on http://getskeleton.com"
  s.description = "Generates a layout based on http://getskeleton.com"
  s.files       = Dir["{lib}/**/*", "[A-Z]*"]
  s.require_path = "lib"

  s.add_development_dependency 'rails', '~> 3.0.0'

end
