require 'rails/generators'

module Bootstrap
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc 'Copy BootstrapGenerators default files'
      source_root ::File.expand_path('../templates', __FILE__)

      class_option :template_engine
      class_option :stylesheet_engine
      class_option :skip_turbolinks, type: :boolean, default: false, desc: "Skip Turbolinks on assets"



      def copy_lib
        directory "lib/templates/#{options[:template_engine]}"
      end

      def copy_form_builder
        copy_file "form_builders/form_builder/_form.html.#{options[:template_engine]}", "lib/templates/#{options[:template_engine]}/scaffold/_form.html.#{options[:template_engine]}"
      end

      def copy_kaminari_layout
        directory "kaminari", "app/views/kaminari"
      end

      def copy_controller_builder
        copy_file "lib/templates/rails/scaffold_controller/controller.rb.tt", "lib/templates/rails/scaffold_controller/controller.rb.tt"
      end

      def create_layout
        template "common/_menu.html.#{options[:template_engine]}", "app/views/common/_menu.html.#{options[:template_engine]}"
        template "common/_flashes.html.#{options[:template_engine]}", "app/views/common/_flashes.html.#{options[:template_engine]}"
        template "layouts/starter.html.#{options[:template_engine]}", "app/views/layouts/application.html.#{options[:template_engine]}"
      end

      def create_js

        copy_file "assets/javascripts/starter.js", "app/assets/javascripts/application.js"
      end

      def create_stylesheets
        stylesheet_extension = options[:stylesheet_engine] || 'css'
        copy_file "assets/stylesheets/starter.#{stylesheet_extension}", "app/assets/stylesheets/application.#{stylesheet_extension}"
      end

      # def inject_backbone
      #   application_js_path = 'app/assets/javascripts/application.js'
      #
      #   if ::File.exists?(::File.join(destination_root, application_js_path))
      #     inject_into_file application_js_path, before: '//= require_tree' do
      #       "//= require bootstrap\n"
      #     end
      #   end
      # end
    end
  end
end
