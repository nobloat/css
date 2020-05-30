**THIS IS WORK IN PROGRESS**

# nobloat/css

Minimalistic modular pure CSS3 components - definitely no framework

> Don't grab the whole thing, just pick what you actually need. It is not a framework, rather a collection of manuals how to implement popular components with pure CSS3.

## Goals

- Components that I can use for my own projects
- **No requirement for node, npm, less, sass, webpack, rollup, ...**
- Use CSS3 features in favor of JavaScript
- Use flexbox instead of the typical break-point based grid-system
- Small footprint (~10kb uncompressed unminified)
- **Modular: only grab what you need**
- Avoid classes and verbosity e.g.
  - `<div class="nav menu">` is just `<nav>`
  - `<div class="container"> is` just `<main>`
  - `<a class="button button-small>` is just `<button>`
- Customizable Colors
- Learn HTML5 and CSS3

## Non-goals

- Being a CSS "framework"
- Stable "API" (class-names, tags)
- Working on all browser out there (especially IE < 11)

## Dependencies

- A text-editor and a web-browser
- "Bundled builds" builds require `make`, `sed` and `tr` which should be available in most distributions by default
- **No node, npm, sass, less, webpack, rollup, ...**

## Usage

- For development: just include [](style.css) using `<link rel="stylesheet" href="style.css">`
- For production:
  - include only the required components in [](style.css)
  - Run `make` to generate `nobloat.min.css`
  - include it using `<link rel="stylesheet" href="nobloat.min.css">`

## Customize
Per default, all available components are includeded in [](style.css)

### Colors

- Modify `--c-1` and `--c-2` in [color.css](src/color.css) and [dark.css](src/dark.css)

### Include/Exclude Components

Just copy/paste the css parts you actually want to your stylesheet, or

- Add/remove `@import` statements in [style.css](src/style.css)
- Run `make`
- Grab the resulting `nobloat.min.css` file

## Inspirations

- https://github.com/franciscop/picnic
- https://github.com/milligram/milligram
- https://github.com/pure-css/pure-css.github.io/
- https://github.com/picturepan2/spectre
- http://mincss.com/
- http://getskeleton.com/
- https://github.com/davidhartsough/you-dont-need-bootstrap
- https://hospodarets.com/you-might-not-need-a-css-preprocessor/#/
- https://philipwalton.github.io/solved-by-flexbox/
- https://heydonworks.com/article/the-flexbox-holy-albatross/
- https://css-components.felipefialho.com/index.html
- https://motherfuckingwebsite.com/

## TODO
- Avatar (circular image)
- Add multiple themes

## Known Issues
- Modal not optimized for mobile
- Closed alerts consume space, on Edge they leave a very small line
- Forms do not work in the grid, they are bigger -> Horizontal Scrollbar
