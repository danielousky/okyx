module ApplicationHelper
	
	def link_to_add_fields(name, f, association, **args)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
			render(association.to_s.singularize + "_fields", f: builder)
		end
		link_to(name, 'javascript:void(0)', class: "add_fields #{args[:class]}", data: {id: id, fields: fields.gsub("\n", "")})
	end


	def btn_tooltip_link_to(title_tooltip, title, icon_name, btn_type, path)
		link_to path, 'data-bs-toggle': 'tooltip', title: title_tooltip, class: "btn #{btn_type}" do
			capture_haml { "<i class='#{icon_name}'></i> #{title}".html_safe }
		end
	end

	def title(title)
		capture_haml { "<h3 class='my-3 p-1 bg-primary text-light text-center'>#{title}</h3>".html_safe }
	end

	def haml_helper(haml_block)
		Haml::Engine.new(haml_block).render
	end
end
