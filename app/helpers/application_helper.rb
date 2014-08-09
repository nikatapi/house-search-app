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

 # Always use the Twitter Bootstrap pagination renderer
  def will_paginate(collection_or_options = nil, options = {})
    if collection_or_options.is_a? Hash
      options, collection_or_options = collection_or_options, nil
    end
    unless options[:renderer]
      options = options.merge :renderer => BootstrapPagination::Rails
    end
    super *[collection_or_options, options].compact
  end
end
