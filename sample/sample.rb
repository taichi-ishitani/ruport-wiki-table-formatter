# frozen_string_literal: true

require 'ruport'
require 'ruport/wiki_table_formatter'

table = Ruport.Table('Airport', 'IATA code', 'Opend')
table << ['Kansai'     , 'KIX', 1994]
table << ['Haneda'     , 'HND', 1931]
table << ['Narita'     , 'NRT', 1978]
table << ['New Chitose', 'CTS', 1988]

md = table.to_markdown
File.binwrite('sample.md', md)
