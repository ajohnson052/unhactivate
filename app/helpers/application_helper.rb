module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # technique explained here: http://stackoverflow.com/questions/17481812/dynamically-add-active-class-to-bootstrap-li-in-rails
  # <li class="acttive"><a href="#">Unhactivate <span class="sr-only">(current)</span></a></li>
  # automatically sets class as "active" if the url target is current page
  def nav_li(linked_text, link_path, html_options = {})
    active = "active" if current_page?(link_path)
    content_tag :li, class: active do
      link_to linked_text, link_path, html_options
    end
  end

  def abstract(long_text)
    Nokogiri::HTML.parse(long_text).css('p')[1].text
  end

end
