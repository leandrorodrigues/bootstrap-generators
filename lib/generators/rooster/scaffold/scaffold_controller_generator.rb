require 'rails/generators'
require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'
require "rails/generators/resource_helpers"

module Rooster
  module Generators
    class ScaffoldControllerGenerator < ::Rails::Generators::ScaffoldControllerGenerator
      hook_for :template_engine, as: :scaffold do |template_engine|
        load('generators/rooster/scaffold/erb_scaffold_generator')
        invoke  RoosterErb::Generators::ScaffoldGenerator  unless options.api?
      end
    end
  end
end
