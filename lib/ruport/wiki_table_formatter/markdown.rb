# frozen_string_literal: true

module Ruport
  module WikiTableFormatter
    class Markdown < Ruport::Formatter
      renders :markdown, for: [Controller::Table]

      def apply_template
        apply_table_format_template(template.table)
      end

      def prepare_table
        if data.column_names.empty?
          message = 'Can\'t output table without column names.'
          raise Ruport::FormatterError.new(message)
        end
      end

      def build_table_header
        build_md_row(output, data.column_names)
        build_md_row(output, alignment_strings(data.column_names))
      end

      def build_table_body
        data.each { |row| build_md_row(output, row) }
      end

      private

      def build_md_row(output, row)
        output << '|'
        output << row.to_a.map { |cell| escape(+cell.to_s) }.join('|')
        output << "|\n"
      end

      def escape(cell)
        cell.gsub!('|', '&#124;')
        cell.gsub!("\n", '<br>')
        cell
      end

      def alignment_strings(column_names)
        column_names.map(&method(:alignment_string))
      end

      def alignment_string(column_name)
        case column_alignment(column_name)
        when :right
          '--:'
        when :center
          ':-:'
        else
          ':--'
        end
      end

      def column_alignment(column_name)
        if options.column_alignments&.key?(column_name)
          options.column_alignments[column_name]
        elsif options.alignment
          options.alignment
        else
          :left
        end
      end

      def apply_table_format_template(template)
        template = (template || {}).merge(options.table_format || {})
        options.alignment ||= template[:alignment]
        options.column_alignments =
          merget_column_alignments(options, template)
      end

      def merget_column_alignments(options, template)
        (template[:column_alignments] || {})
          .merge(options.column_alignments || {})
      end
    end
  end
end
