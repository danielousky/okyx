module ApplicationHelper
	def btn_tooltip_link_to(title_tooltip, title, icon_name, btn_type, path)
		link_to path, 'data-bs-toggle': 'tooltip', title: title_tooltip, class: "btn rounded-0 #{btn_type}" do
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
