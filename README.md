[![Gem Version](https://badge.fury.io/rb/ruport-wiki-table-formatter.svg)](https://badge.fury.io/rb/ruport-wiki-table-formatter)
[![Build Status](https://travis-ci.com/taichi-ishitani/ruport-wiki-table-formatter.svg?branch=master)](https://travis-ci.com/taichi-ishitani/ruport-wiki-table-formatter)
[![Maintainability](https://api.codeclimate.com/v1/badges/f3b59dc0ae2f3d912ffc/maintainability)](https://codeclimate.com/github/taichi-ishitani/ruport-wiki-table-formatter/maintainability)
[![codecov](https://codecov.io/gh/taichi-ishitani/ruport-wiki-table-formatter/branch/master/graph/badge.svg)](https://codecov.io/gh/taichi-ishitani/ruport-wiki-table-formatter)

# Ruport::WikiTableFormatter

Ruport::WikiTableFormatter is an extention for [Ruport](https://github.com/ruport/ruport) to format `Ruport::Table` data into wiki table format.

Currently, Ruport::WikiTableFormatter supports following wiki formats:

* Markdown

## Installation

To install Ruport::WikiTableFormatter, hit command below:

```
$ gem install ruport-wiki-table-formatter
```

Or add this line to your Gemfile:

```ruby
gem 'ruport-wiki-table-formatter'
```

## Usage

To format `Ruport::Table` data into wiki table format, you only have to call following methods:

* Markdown: #to_markdown

Here is an sample code:

```ruby
require 'ruport'
require 'ruport/wiki_table_formatter'

table = Ruport.Table('Airport', 'IATA code', 'Opend')
table << ['Kansai'     , 'KIX', 1994]
table << ['Haneda'     , 'HND', 1931]
table << ['Narita'     , 'NRT', 1978]
table << ['New Chitose', 'CTS', 1988]

md = table.to_markdown
File.binwrite('sample.md', md)
```

Execute above sample code, Markdown table format below will be output:

|Airport|IATA code|Opend|
|:--|:--|:--|
|Kansai|KIX|1994|
|Haneda|HND|1931|
|Narita|NRT|1978|
|New Chitose|CTS|1988|

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/taichi-ishitani/ruport-wiki-table-formatter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Copyright & License

Copyrigh (c) 2019 Taichi Ishitani.

Licensed under the [MIT License](https://opensource.org/licenses/MIT), see [LICENSE.txt](LICENSE.txt) for further details.
