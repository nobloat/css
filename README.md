# nobloat/css

Minimalistic modular pure CSS3 components

## Goals

- A stylesheet I can use for my own projects
- **No requirement for npm, less, sass, webpack or similar**
- Uses CSS3 features instead
- No JavaScript required
- Small footprint (~10kb uncompressed unminified)
- Modular: only use what you need
- Avoid classes and verbosity where possible e.g.
  - `<div class="nav menu">` is `<nav>`
  - `<div class="container"> is`<main>`
  - `<a class="button button-small>` is `<button>`
- Fun to use
- Use examples over pre-defined CSS classes
- Customizable Colors
- Learn HTML5 and CSS3

## Non-goals

- Stable "API" (class-names, tags)
- Working on all browser out there (especially IE < 11)

## Dependencies

- None for development
- Production builds require `make`, `sed`, `tr` which should be available in most distributions by default
- **No npm, sass, less, webpack**

## Usage

- For development: just include [](style.css) using `<link rel="stylesheet" href="style.css">`
- For production:
  - include only the required components in [](style.css)
  - Run `make` to generate `nobloat.min.css`
  - include it using `<link rel="stylesheet" href="nobloat.min.css">`

## Customize

Per default, all available components are includeded in [](style.css)

### Colors

- Modify `--c-1` and `--c-2` in [](color.css) and [](dark.css)

### Include/Exclude Components

- Simply add/remove `@import` statements in [](style.css)
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

## TODO

- Cooler Burger menu (transitions to X)
- Avatar (circular image)

## Known Issues

- Edge: Closed alerts leave a very small line (probably some border)
- Closed alerts consume space
- Forms do not work in the grid, they are bigger -> Horizontal Scrollbar
- span.button for Modals does not hover -> Probably a wontfix
