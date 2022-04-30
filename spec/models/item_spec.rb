require 'rails_helper'

RSpec.describe Item, type: :model do
  my_user = User.new(name: 'Ahmed')
  item = Item.new(name: 'new_car', photo: 'my_photo', description: 'bla bla bla bla bla bla',
                  specs: 'bla bla bla bla bla bla', price: 7000, user: my_user)
  before { item.save }

  it 'should have many reservation' do
    reserveds = Item.reflect_on_association(:reserveds)
    expect(reserveds.macro).to eq(:has_many)
  end

  it 'should belongs to user' do
    user = Item.reflect_on_association(:user)
    expect(user.macro).to eq(:belongs_to)
  end

  it 'isn\'t valid without name' do
    item.name = ''
    expect(item).to_not be_valid
  end

  it 'isn\'t valid with name less than 3 characters' do
    item.name = 'ha'
    expect(item).to_not be_valid
  end

  it 'isn\'t valid with no photo' do
    item.photo = ''
    expect(item).to_not be_valid
  end
end
