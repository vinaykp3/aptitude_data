module ApplicationHelper
  # show_link Employee, "Show",employee_path(@employee)
  #           OR
  # show_link Employee, "Show", employee
  def show_link(object, *link_to_args)
    link_to(*link_to_args) if can?(:read, object)
  end

  # create_link Employee, "new", employee_path(@employee)
  #           OR
  # create_link Employee, "new", employee

  def create_link(object, *link_to_args)
    link_to(*link_to_args) if can?(:create, object)
  end

  # edit_link Employee, "Edit", edit_employee_path(@employee)
  #           OR
  # edit_link Employee, "Edit", employee
  #           OR
  # edit_link Employee, "Edit", employee, :remote => true
  #        *for popups*
  # = edit_link Employee(object), "custom link name"(eg: "Edit Employee"), "#"(href), :onclick=>"popup();"(javascript function), :style => "width:100%;"
  def edit_link(object, *link_to_args)
    link_to(*link_to_args) if can?(:update, object)
  end

  # destroy_link Employee, "Delete", employee_path(@employee)
  #           OR
  # destroy_link Employee, "Delete", employee
  #           OR
  # destroy_link Employee, "Delete", employee, :remote => true
  #           OR
  # destroy_link Employee, image_tag(""), employee, :remote => true
  def destroy_link(object, *link_to_args)
    link_to(*link_to_args) if can?(:destroy, object)
  end

  def index_link (object,*link_to_args)
    link_to(*link_to_args) if can?(:index,object)
  end

  # egs:
  # All the other non restfull links go here
  # = non_restfull_link Employee, :edit, "Edit Employee", edit_employee_path(@employee)
  # *for popups*
  # = non_restfull_link Employee(object), :edit(permission), "custom link name"(eg: "Edit Employee"), "#"(href), :onclick=>"popup();"(javascript function)
  def non_restfull_link(object, permission, *link_to_args)
    link_to(*link_to_args) if can?(permission, object)
  end

end
