module ApplicationHelper
  def people_form_method(person)
      if person.new_record?
        @method = "post"
      else
        @method = "put"
      end
      @method
  end
end

def people_form_action(person)
    if person.new_record?
        @action = "/people/new"
    else 
        @action = "/people/person.id"
    end 
    @action
end 
