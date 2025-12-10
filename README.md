# Jekyll Skeleton Theme — GitHub Pages compatible

This repository is a minimal, well-documented **Jekyll theme skeleton** that is intentionally compatible with GitHub Pages (i.e., ready to be used as a foundation for themes you will later publish / extend). It includes a gem-based theme scaffold, recommended files, examples, and guidance for plugins and deployment.

---

## What you'll find here

* `jekyll-skeleton.gemspec` — theme gemspec
* `Gemfile` — uses `github-pages` for GitHub Pages compatibility
* `_config.yml` — example site config (remote_theme ready)
* `README.md` — usage & development instructions
* `LICENSE` — MIT by default
* `assets/` — CSS/JS/image starter files (SCSS partials)
* `/_layouts/` — `default.html`, `home.html`, `post.html`, `page.html`
* `/_includes/` — header, footer, head, meta partials
* `/_sass/` — partials for styles
* `/jekyll-skeleton.gemspec` and `/lib/jekyll-skeleton.rb` — gem entrypoint
* `example-site/` — a minimal example site showing how to use the theme

---

## Quick setup (for theme developers)

1. Clone the skeleton and rename the gemspec/name fields.
2. Run `bundle install`.
3. Run `bundle exec jekyll serve --livereload` inside the `example-site` folder for local preview.
4. Publish the theme repository on GitHub and use `remote_theme: youruser/your-theme` in `_config.yml` to test on pages, or push an example site using the theme.

---

## Files (examples inside this skeleton)

### `Gemfile`

```ruby
source 'https://rubygems.org'

gem 'github-pages', group: :jekyll_plugins

group :jekyll_plugins do
  gem 'jekyll-feed'
  gem 'jekyll-seo-tag'
  gem 'jekyll-sitemap'
end
```

> **Notes:** Using `github-pages` gem keeps your local environment aligned with the GitHub Pages build environment. If you need plugins *not* included in the `github-pages` dependencies, build using GitHub Actions (or another CI) to run a custom `bundle exec jekyll build` and then deploy the static output — this lets you use any plugin.

### `_config.yml` (example for a site using the theme)

```yaml
title: "Site Title"
email: "you@example.com"
description: "A short description for search engines"

remote_theme: yourusername/jekyll-skeleton-theme
plugins:
  - jekyll-feed
  - jekyll-seo-tag
  - jekyll-sitemap

paginate: 5
paginate_path: "/page:num/"

exclude:
  - Gemfile
  - Gemfile.lock
  - node_modules
```

### `jekyll-skeleton.gemspec` (minimal)

```ruby
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
```

### `/_layouts/default.html` (simplified)

```html
<!doctype html>
<html lang="en">
  {% include head.html %}
  <body>
    {% include header.html %}
    <main>
      {{ content }}
    </main>
    {% include footer.html %}
  </body>
</html>
```

### `/_includes/head.html`

```html
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>{{ page.title | default: site.title }}</title>
  {% seo %}
  <link rel="stylesheet" href="{{ '/assets/main.css' | relative_url }}">
</head>
```

### SCSS starter (`/assets/main.scss`)

```scss
---
---
@import "../_sass/variables";
@import "../_sass/base";
```

### Example `example-site/_posts/2025-12-10-welcome.md`

```markdown
---
layout: post
title: "Welcome"
---

This is a demo post for the example site.
```

---

## Best practices & recommendations

* **Keep the theme compatible with GitHub Pages:** use only plugins available in the `github-pages` gem dependency set when you expect users to build directly via GitHub Pages. If you want to use arbitrary plugins, recommend using GitHub Actions to build and deploy the `/_site` output.

* **Provide `example-site/`** that demonstrates `remote_theme:` usage and a working `_config.yml` so users can fork and test quickly.

* **Semantic versioning:** tag releases (v0.1.0, v0.1.1, ...). Provide CHANGELOG.

* **Accessibility:** keep semantic HTML and visible focus states. Add skip-links in header.

* **Documentation:** include clear instructions for both `remote_theme` usage (theme hosted as repo) and gem-based usage (published on rubygems).

---

## Deployment options

1. **Direct GitHub Pages build:** (simplest) — if your theme and site use only `github-pages` compatible plugins.
2. **GitHub Actions / CI build:** build site with `bundle exec jekyll build` (any Jekyll version / plugin) and deploy the static `_site` output to `gh-pages` branch or to `github-pages` via `actions/configure-pages`.

---

## Example LICENSE (MIT)

```
MIT License

Copyright (c) YEAR Your Name

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
... (standard MIT text)
```

---

## Notes for maintainers

* Replace placeholders (yourusername, Your Name, email, homepage) before publishing.
* Consider adding an automated test that builds the example site on each PR.
* Keep `Gemfile.lock` updated and test with `bundle exec jekyll build` locally.

---
