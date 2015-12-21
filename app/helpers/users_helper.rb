module UsersHelper

  def gravatar_for(user)
    email = user.email
    hash = Digest::MD5.hexdigest(email)
    image_src = "http://www.gravatar.com/avatar/#{hash}"
    image_tag(image_src, alt: user.name, class: "gravatar")
  end
end
