module ApplicationHelper
  def user_has_no_branch
    current_user.present? &&
    current_user.branch.nil?
  end
  
  def user_is_principal
    current_user.present? &&
    current_user.branch == 'General'
  end

  def user_is_admin
    current_user.present? &&
    (current_user.branch == 'Sampaguita' ||
     current_user.branch == 'Muntingpulo')
  end

  def user_is_dev
    current_user.present? &&
    current_user.branch == 'General' &&
    current_user.username == 'inso'
  end
  
  def branch_name
    if !user_signed_in? || user_has_no_branch || user_is_principal || user_is_dev
      ''
    else
      current_user.branch.prepend(' - ')
    end
  end

  def link_to_add_row(name, f, association, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize, f: builder)
    end
    link_to(name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
  end

  def ommit_zero_decimal(num)
    num == num.to_i ? num.to_i : num
  end

  def humanize(date)
    if Date.today.strftime('%a, %b. %d') == date
      'Today'
    elsif Date.yesterday.strftime('%a, %b. %d') == date
      'Yesterday'
    else
      date
    end
  end

  def is_invalid(update)
    update.confirmed == false || update.action != 'de-stock'
  end

  def smart_coerce(amount, unit)
    unit = amount < 2 ? unit.singularize : unit
    
    ommit_zero_decimal(amount).to_s + ' ' + unit
  end
end
