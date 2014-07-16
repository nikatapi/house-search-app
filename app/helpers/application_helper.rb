module ApplicationHelper
	# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "SSK Application"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  def resource_name
	:user
  end

  def resource
	@resource ||= User.new
  end

  def resource_class
  devise_mapping.to
end

def devise_mapping

@devise_mapping ||= Devise.mappings[:user]

end
end
