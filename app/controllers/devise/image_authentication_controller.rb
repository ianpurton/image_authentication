class Devise::ImageAuthenticationController < DeviseController

  prepend_before_action :authenticate_scope!
  before_action :prepare_and_validate, :handle_image_authentication
  before_action :setup_auth_categories, :only => [ :confirm, :show ]

  def enable
    @auth_categories = resource.all_auth_categories

    if request.get?
      session["user_return_to"] = request.referer
    else
      if params[:image_auth_categories] && params[:image_auth_categories].size == resource.class.maximum_categories
        resource.auth_categories = params[:image_auth_categories]
        resource.save
        
        setup_auth_categories

        render :action => 'confirm'
      else
        render :action => 'enable'
      end
    end
  end

  def confirm
    if resource.valid_images?(params[:image_auth_categories])
      resource.image_authentication_enabled = true
      resource.save

      redirect_to session["user_return_to"]
    else
      render :action => 'confirm'
    end
  end

  def disable
    resource.auth_categories_mask         = nil
    resource.image_authentication_enabled = false
    resource.save

    redirect_to :back
  end

  def show
    return redirect_to :back if !resource.image_authentication_enabled?
  end

  def update
    if resource.valid_images?(params[:image_auth_categories])
      warden.session(resource_name)[:requires_image_authentication] = false
      sign_in resource_name, resource, :bypass => true

      redirect_to session["user_return_to"]
    else
      resource.failed_attempts += 1
      resource.save

      if resource.max_login_attempts?
        sign_out(resource)
        resource.lock_access!

        render :action => 'locked'
      else
        setup_auth_categories

        render :action => 'show'
      end
    end
  end

  private

    def authenticate_scope!
      self.resource = send("current_#{resource_name}")
    end

    def prepare_and_validate
      redirect_to :root and return if resource.nil?

      if resource.max_login_attempts?
        sign_out(resource)
        resource.lock_access!
        render :action => 'locked'
      end
    end

    def setup_auth_categories
      @auth_categories = resource.all_auth_categories
    end

end
