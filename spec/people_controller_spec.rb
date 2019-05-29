require 'spec_helper'

describe "Our Person Controller" do
  include SpecHelper

  before (:all) do
    @first_name = "Miss"
    @last_name = "Piggy"
    @birthdate = '1972-05-01'
    @person = Person.create(first_name: @first_name, last_name: @last_name, birthdate: @birthdate)
  end
  
  after (:all) do
    if !@person.destroyed?
      @person.delete
    end
  end
  
  it "displays a link to a person's show page on the index view" do
    get("/people")
    expect(last_response.body.include?("/people/#{@person.id}")).to be(true)
  end
    
  it 'responds with a view titled "People" when we visit /people' do
    get('/people')
    expect(last_response.body.include?("People")).to be(true)
  end
  
  it "displays a page with the person's name when we visit /people/:id" do
    get("/people/#{@person.id}")
    expect(last_response.body.include?("#{@person.first_name} #{@person.last_name}")).to be(true)
  end  
  
  it 'creates a person when we post to /people' do
    people_count = Person.all.count
    post("/people", { first_name: "Kermit", last_name: "TheFrog", birthdate: (DateTime.now - 45.years) })
    expect(Person.all.count == people_count + 1).to eq(true)
  end
  
  it 'edits a person when we put to /people/:id' do
    new_first_name = "Mister"
    put("/people/#{@person.id}", { first_name: new_first_name, last_name: @last_name, birthdate: @birthdate })
    expect(@person.reload.first_name == new_first_name).to eq(true)
  end
  
  it 'deletes a person when we post to /people/:id' do
    people_count = Person.all.count
    delete("/people/#{@person.id}")
    expect(Person.all.count == people_count - 1).to eq(true)
  end  
  
end