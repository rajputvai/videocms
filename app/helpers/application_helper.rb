module ApplicationHelper

	def error_messages form
    return "" if form.errors.empty?
	
	  messages = form.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
	  sentence = I18n.t("errors.messages.not_saved",
        :count => form.errors.count,
        :resource => form.class.model_name.human.downcase)

    html = <<-HTML
		<div id="error_explanation">
		  <h2>#{sentence}</h2>
		  <ul>#{messages}</ul>
		</div>
	  HTML

      html.html_safe
  end

  def habtm_checkboxes(obj, column, assignment_objects, assignment_object_display_column)
    obj_to_s = obj.class.to_s.split("::").last.underscore
    field_name = "#{obj_to_s}[#{column}][]"
    
    html = hidden_field_tag(field_name, "")
    assignment_objects.each do |assignment_obj|
      cbx_id = "#{obj_to_s}_#{column}_#{assignment_obj.id}"
      html += check_box_tag field_name, assignment_obj.id, obj.send(column).include?(assignment_obj.id), :id => cbx_id
      html += label_tag cbx_id, h(assignment_obj.send(assignment_object_display_column))
      html += content_tag(:br)
    end
    html
  end
end
