require 'rails/generators/rails/scaffold/scaffold_generator'
require 'generators/rooster/scaffold/scaffold_controller_generator'

module Rooster
  module Generators
    class ScaffoldGenerator < ::Rails::Generators::ScaffoldGenerator

      include Rails::Generators::ResourceHelpers

      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      hook_for :scaffold_controller, in: :rooster


    end
  end
end
