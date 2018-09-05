require "rails/generators/erb"
require "rails/generators/resource_helpers"

module RoosterErb
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator

      private
      def snippet_show_attribute(variable, attribute)
        var = variable + '.' + attribute.name

        if attribute.type == :datetime || attribute.type == :date
          return 'l ' + var +', format: :short if ' + var + '.present?'
        end

        if attribute.type == :decimal
          return 'number_with_precision ' + var + ', precision: 2'
        end

        if attribute.type == :boolean
          return 't ' + var
        end

        if attribute.reference?
          first_column = ActiveRecord::Base.connection.columns(attribute.name.pluralize).find { |c| c.type == :string }
          return 'link_to_if ' + var + ', ' + var + '.try(:' + first_column.name + '), ' + var
        end

        var
      end
    end
  end
end
