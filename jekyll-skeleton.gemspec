Gem::Specification.new do |s|
  s.name        = 'jekyll-skeleton'
  s.version     = '0.1.0'
  s.summary     = 'A minimal Jekyll theme skeleton compatible with GitHub Pages.'
  s.files       = Dir['**/*'] - ['example-site/**', 'pkg/**']
  s.homepage    = 'https://github.com/yourusername/jekyll-skeleton'
  s.authors     = ['Your Name']
  s.email       = 'you@example.com'
  s.license     = 'MIT'
  s.add_runtime_dependency 'jekyll'
end
