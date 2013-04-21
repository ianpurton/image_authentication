module ImageAuthentication
  module Generators
    class ImageAuthenticationGenerator < Rails::Generators::NamedBase
      namespace "image_authentication"

      desc "Adds :image_authenticable directive in the given model. It also generates an active record migration."

      def inject_image_authentication_content
        path = File.join("app", "models", "#{file_path}.rb")
        inject_into_file(path, "image_authenticatable, :", :after => "devise :") if File.exists?(path)
      end

      hook_for :orm

    end
  end
end