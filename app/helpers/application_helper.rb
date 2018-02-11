module ApplicationHelper
  def flash_msgs
    hash = { 'notice' => 'success', 'alert' => 'warning', 'error' => 'danger' }

    string = ''
    flash.each do |name, msg|
      string += content_tag(:div, class: "alert alert-#{hash[name]}") do
        '<a class="close" data-dismiss="alert">x</a>'.html_safe +
        msg
      end
    end
    string.html_safe
  end

end
