require 'rails_helper'

RSpec.describe Reserved, type: :model do
  my_user = User.new(name: 'Ahmed')
  my_item = Item.new(name: 'new_car', photo: 'my_photo', description: 'bla bla bla bla bla bla',
                     specs: 'bla bla bla bla bla bla', price: 7000, user: my_user)
  reservation = Reserved.new(name: 'new_car', city: 'cairo', started_at: '2022-04-30', ended_at: '2022-05-29',
                             user: my_user, item: my_item)

  before { reservation.save }

  it 'should be valid' do
    expect(reservation).to be_valid
  end

  it 'should belongs to item' do
    item = Reserved.reflect_on_association(:item)
    expect(item.macro).to eq(:belongs_to)
  end

  it 'should belongs to user' do
    user = Reserved.reflect_on_association(:user)
    expect(user.macro).to eq(:belongs_to)
  end

  it 'isn\'t valid without name' do
    reservation.name = ''
    expect(reservation).to_not be_valid
  end

  it 'isn\'t valid with name less than 3 characters' do
    reservation.name = 'ha'
    expect(reservation).to_not be_valid
  end

  it 'isn\'t valid with no photo' do
    reservation.city = ''
    expect(reservation).to_not be_valid
  end
end
