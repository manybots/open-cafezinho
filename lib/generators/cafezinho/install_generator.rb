require 'rails/generators'
require 'rails/generators/base'


module Cafezinho
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      
      source_root File.expand_path("../../templates", __FILE__)
            
      desc "Create initializers with dynamic Tokens (Devise and Session pepper)"
      def copy_initializer
        template "secret_token.rb.tt", "config/initializers/secret_token.rb"
      end
      
    end
  end
end
