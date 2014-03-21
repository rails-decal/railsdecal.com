module ApplicationHelper

  def active_li_link(name=nil, options={}, html_options={}, link_html_options={}, &block)
    html_options[:class] = "#{html_options[:class]} active" if current_page?(options)
    content_tag :li, html_options do
      link_to(name, options, link_html_options)
    end
  end

end
