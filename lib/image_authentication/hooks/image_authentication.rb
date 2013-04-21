Warden::Manager.after_authentication do |user, auth, options|
  if user.respond_to?(:image_authentication_enabled?)
    auth.session(options[:scope])[:requires_image_authentication] = user.requires_image_authentication?(auth.request)
  end
end