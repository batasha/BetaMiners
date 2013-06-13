module ApplicationHelper
  CATEGORIES = [ "Books", "Business", "Finance", "Games", "Health & Fitness",
                 "Lifestyle", "Music", "Navigation", "News", "Photography",
                 "Productivity", "Reference", "Social", "Sports", "Travel",
                 "Utilities", "Weather" ]

  OS_PLATFORMS = [ "iOS", "Android", "OS X", "Windows XP", "Windows 7",
                   "Windows 8", "Linux" ]

  BROWSERS = [ "Firefox", "Internet Explorer", "Chrome", "Opera", "Safari" ]

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "removeFields(this)")
  end

  def link_to_add_fields(name, f, association)
    obj = f.object.class.reflect_on_association(association).klass.new

    fields = f.simple_fields_for(association, obj,
              child_index: "new_#{association}") do |builder|
      render(association.to_s, f: builder)
    end

    link_to_function(name, "addFields(this, \"#{association}\",
                     \"#{escape_javascript(fields)}\")")
  end
end
