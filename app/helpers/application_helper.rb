module ApplicationHelper
  def carus_image(img, options = {})
    if Rails.env.production?
      cl_image_tag(img.key, options)
    else
      image_tag(img, options)
    end
  end
end
