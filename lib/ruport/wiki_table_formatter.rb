# frozen_string_literal: true

require 'ruport'
require_relative 'wiki_table_formatter/version'
require_relative 'wiki_table_formatter/markdown'

module Ruport
  # Ruport::WikiTableFormatter is an extention for {Ruport}[https://github.com/ruport/ruport]
  # to format Ruport::Table data into wiki table format.
  #
  # Currently, following formats are supported:
  #
  # * Markdown: Ruport::WikiTableFormatter::Markdown
  #
  # To get wiki table format from Ruport::Table data,
  # you only have to call following methods:
  #
  # * Markdown: #to_markdown
  #
  # Example:
  #
  #   table = Ruport.Table('Airport', 'IATA code', 'Opend')
  #   table << ['Kansai'     , 'KIX', 1994]
  #   table << ['Haneda'     , 'HND', 1931]
  #   table << ['Narita'     , 'NRT', 1978]
  #   table << ['New Chitose', 'CTS', 1988]
  #   md = table.to_markdown
  #
  # Output
  #
  #   |Airport|IATA code|Opend|
  #   |:--|:--|:--|
  #   |Kansai|KIX|1994|
  #   |Haneda|HND|1931|
  #   |Narita|NRT|1978|
  #   |New Chitose|CTS|1988|
  module WikiTableFormatter
  end
end
