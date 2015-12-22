module UsersHelper

  def gravatar_for(user, options = {size: 80})
    size = options[:size]
    email = user.email
    hash = Digest::MD5.hexdigest(email)
    image_src = "http://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(image_src, alt: user.name, class: "gravatar")
  end
end
