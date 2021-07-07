<!-- Variables -->
[changelog]: /CHANGELOG.md
[coc]: /CODE_OF_CONDUCT.md
[contributing]: /CONTRIBUTING.md
[license]: /LICENSE.md

# Bundler Audit Action

![Version Number](https://img.shields.io/static/v1?label=Version&message=v0.1.0&color=blue)
![Linters](https://github.com/andrewmcodes/bundler-audit-action/workflows/Linters/badge.svg)
[![Changelog](https://github.com/andrewmcodes/rubocop-linter-action/workflows/Changelog/badge.svg)][changelog]

This GitHub Action runs [bundler-audit](https://github.com/rubysec/bundler-audit) on your project.

## Examples

### Basic Usage
Equivalent to running `gem install bundle-audit && bundle-audit check` on your local machine:

```yaml
name: Bundler Audit

on: [push]

jobs:
  audit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: 'Bundler Audit'
        uses: andrewmcodes/bundler-audit-action@main
        with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
```

### Advanced Usage
The `options` argument exists to allow you to pass options to the audit command, just like you would locally:

```yaml
name: Bundler Audit

on: [push]

jobs:
  audit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: 'Bundler Audit'
        uses: andrewmcodes/bundler-audit-action@main
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          options: '--ignore CVE-2015-9284 --format json'
```

View [rubysec/bundler-audit](https://github.com/rubysec/bundler-audit#synopsis) for documentation on what options are available.

> Note: bundler-audit also supports a per-project configuration file: `.bundle-audit.yml` which is NOT supported by this action. This action is as simple as it can be to help you get started quickly and is not meant for long term use. In order to dissuade long term use, config file support will not be implemented, or accepted via PR, without a persuading argument as to why. Thanks for understanding!

## Inputs

### `github_token`

**Required**. Must be in form of `github_token: ${{ secrets.github_token }}`.

### `options`

Optional. bundle-audit options. (`bundle-audit --ignore CVE-2015-9284 --format json`)

## Community

### Changelog

[View our Changelog][changelog]

### Contributing

[Contributing Guide][contributing]

### Code of Conduct

[Code of Conduct][coc]

### License

[MIT][license]
