module ApplicationHelper
	def btn_tooltip_link_to title_tooltip, title, icon_name, btn_type, path

		link_to path, 'data-bs-toggle': 'tooltip', title: title_tooltip, class: "btn rounded-0 #{btn_type}" do
			capture_haml{"<i class='#{icon_name}'></i> #{title}".html_safe}
		end

	end    
end
