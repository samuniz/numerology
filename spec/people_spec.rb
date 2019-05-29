require 'spec_helper'

describe 'Our Person Class' do
  include SpecHelper

  before (:all) do
    @person = Person.create(first_name: "Miss", last_name: "Piggy", birthdate: DateTime.now - 40.years )
  end
  
  after (:all) do
    @person.delete
  end
  
  it 'creates a Person' do
    person = Person.create(first_name: "Sample", last_name: "Person", birthdate: (DateTime.now - 25.years))
    expect(person.present?).to be(true)
    person.delete
  end
  
end