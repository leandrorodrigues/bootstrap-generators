require "rails/generators/erb"
require "rails/generators/resource_helpers"

module RoosterErb
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator

      private
      def snippet_show_attribute(variable, attribute)
        var = variable + '.' + attribute.name

        if attribute.type == :datetime
          return 'I18n.localize ' + var +', format: :short'
        end

        if attribute.reference?
          first_column = ActiveRecord::Base.connection.columns(attribute.name.pluralize).find { |c| c.type == :string }
          return 'link_to ' + var + '.' + first_column.name + ', ' + var
        end

        var
      end
    end
  end
end
