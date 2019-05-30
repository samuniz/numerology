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
        @action = "/people"
    else 
        @action = "/people/#{@person.id}"
    end 
    @action
end 

def people_form_class(person)
  if person.new_record?
    @class = "/people/new"
  else 
    @class = "people/#{@person.id}"
  end 
  @class 
end 

def people_form_id(person)
  if person.new_record?
    @id = "new-person"
  else 
    @id = "#{@person.id}"
  end 
  @id
end 
