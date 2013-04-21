module ImageAuthentication
  class Engine < ::Rails::Engine
    ActiveSupport.on_load(:action_controller) do
      include ImageAuthentication::Controllers::Helpers
    end
  end
end