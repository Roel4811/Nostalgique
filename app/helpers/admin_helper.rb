module AdminHelper
  def toggle_show_or_hide_deleted_button
    if show_or_hide_deleted == 'only_deleted'
      show_klass = 'btn-default-blue active'
      both_klass = 'btn-default-blue'
      hide_klass = 'btn-default-blue'
    elsif show_or_hide_deleted == 'without_deleted'
      show_klass = 'btn-default-blue'
      both_klass = 'btn-default-blue'
      hide_klass = 'btn-default-blue active'
    else
      show_klass = 'btn-default-blue'
      both_klass = 'btn-default-blue active'
      hide_klass = 'btn-default-blue'
    end
    content_tag(:div, class: 'btn-group') do
      link_to("Yes", admin_songs_path(show_or_hide_deleted: 'yes'),
              class: show_klass) +
      link_to("Both", admin_songs_path,
              class: both_klass) +
      link_to("No", admin_songs_path(show_or_hide_deleted: 'no'),
              class: hide_klass)
    end
  end

  def sort_link(column_name)
    klass = sort_direction == "asc" ? "fa fa-angle-down" : "fa fa-angle-up"
    new_direction = sort_direction == "asc" ? "desc" : "asc"

    link_to(column_name, params.merge(sort: column_name, direction: new_direction), class: klass)
  end
end
