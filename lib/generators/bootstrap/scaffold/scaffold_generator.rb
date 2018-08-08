require 'rails/generators/erb/scaffold/scaffold_generator'
module Bootstrap
  module Generators
    class ScaffoldGenerator < ::Erb::Generators::ScaffoldGenerator

      private
        def snippet_show_attribute(variable, attribute)
          var = variable + '.' + attribute.name

          if attribute.type == :datetime
            return 'I18n.localize ' + var +', format: :short'
          end

          var
        end
    end
  end
end
