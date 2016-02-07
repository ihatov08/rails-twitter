module UsersHelper
  def image_for(user)
  if user.image
    image_tag "user_images/#{user.image}", class: "profile_img"
  else
    image_tag "http://ks.c.yimg.jp/res/chie-0/309/267/i1/img.PNG", class: "profile_img"
  end
end
end
