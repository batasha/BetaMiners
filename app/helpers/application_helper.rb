module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) +
    link_to_function(name, "removeFields(this)", class: "remove")
  end

  def link_to_add_fields(name, f, association)
    obj = f.object.class.reflect_on_association(association).klass.new

    fields = f.simple_fields_for(association, obj,
              child_index: "new_#{association}") do |builder|
      render(association.to_s, f: builder)
    end

    link_to_function(name, "addFields(this, \"#{association}\",
                     \"#{escape_javascript(fields)}\")", class: "add")
  end

  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end

  def date_format(date)
    date.strftime('%B %-d, %Y')
  end
end
