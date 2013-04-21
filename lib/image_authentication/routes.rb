module ActionDispatch::Routing
  class Mapper
    protected

      def devise_image_authentication(mapping, controllers)
        resource :image_authentication, 
          :only       => [:show, :update, :enable, :disable, :confirm],
          :path       => mapping.path_names[:image_authentication],
          :controller => controllers[:image_authentication] do
            get :enable, :on => :member
            put :enable, :on => :member
            put :disable, :on => :member

            get :confirm, :on => :member
            put :confirm, :on => :member
          end
      end
  end
end