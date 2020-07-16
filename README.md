# MimosPay REST Documentation

![Build](https://github.com/MimosPay/Rest-API/workflows/Build/badge.svg)
![Deploy](https://github.com/MimosPay/Rest-API/workflows/Deploy/badge.svg)

MimosPay's API documentation is created with [Slate](https://github.com/slatedocs/slate).

Check it out at https://mimospay.github.io/Rest-API

## Changes

- Using `Includes` to break `index.html.md` into multiple files
- Using `{#custom-id}` to custom heading IDs
- Using Middlemans' [Internationalization features](https://middlemanapp.com/advanced/localization/)
  * I18n.t(:title), equivalent: I18n.t('title'), keys which can be both Symbols or Strings
  * I18n.t('guide.title'), nested keys
  * ~~I18n.t('guide.text_html'), keys with a '_html' suffix and keys named 'html' are marked as HTML safe~~ I18n.t('guide.text'), HTML safe
  * I18n.t('guide.request_limit', count: '100'), perform interpolation
- Update `Dockerfile` with APT/RubyGems mirrors

## [Updating Slate](https://github.com/slatedocs/slate/wiki/Updating-Slate)

> git remote add upstream https://github.com/slatedocs/slate.git

> git fetch upstream

> git merge upstream/main
