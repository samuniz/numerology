#Display all people resources 
get '/people' do 
    @people = Person.all
    erb :"/people/index"
end

#Display de people new form
get '/people/new' do 
    @person = Person.new
    erb :"/people/new"
end 

#Display a specific resource 
get '/people/:id' do 
    @person = Person.find(params[:id])
    birthdate_string = @person.birthdate.strftime("%m%d%Y")
    birth_path_num = Person.get_birth_path_num(birthdate_string)
    @message = Person.get_message(birth_path_num)  
    
    erb :"/people/show"
end 

#Create a new person
post '/people' do 
    if params[ :birthdate].include?("-")
        birthdate = params[:birthdate]
    else 
        birthdate = Date.strptime(params[:birthdate], "%m%d%Y")
    end 
    person = Person.create(first_name: params[:first_name], last_name: params[:last_name], birthdate: params[:birthdate])
    redirect "/people/#{person.id}"
end

#edit a person
get '/people/:id/edit' do 
    @person = Person.find(params[:id])
    erb :"/people/edit"
end 

#submit an update person
put '/people/:id' do 
    person = Person.find(params[:id])
    person.first_name = params[:first_name]
    person.last_name = params[:last_name]
    person.birthdate = params[:birthdate]
    person.save
    redirect "/people/#{person.id}"
end 

#delete a person
delete '/people/:id' do 
    person = Person.find(params[:id])
    person.delete
    redirect "/people"
end 

#show de the results 
get '/people/:id' do
    @person = Person.find(params[:id])
    birth_path_num = Person.get_birth_path_num(@person.birthdate.strftime("%m%d%Y"))
    @message = Person.get_message(birth_path_num)  
    erb :"/people/show"
  end


  

