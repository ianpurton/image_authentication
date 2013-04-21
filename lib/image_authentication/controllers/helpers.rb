module ImageAuthentication
  module Controllers
    module Helpers
      extend ActiveSupport::Concern

      included do
        before_filter :handle_image_auth
      end

      private

      def handle_image_auth
        unless devise_controller?
          Devise.mappings.keys.flatten.any? do |scope|
            if signed_in?(scope) and warden.session(scope)[:requires_image_auth]
              handle_failed_image_auth(scope)
            end
          end
        end
      end

      def handle_failed_image_auth(scope)
        if request.format.present? and request.format.html?
          session["#{scope}_return_to"] = request.path if request.get?

          scope = Devise::Mapping.find_scope!(scope)
          path  = send("#{scope}_image_auth_path")
          redirect_to path
        else
          render :nothing => true, :status => :unauthorized
        end
      end

    end
  end
end