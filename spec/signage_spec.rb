require_relative '../signage'

RSpec.describe Signage do
  it 'outputs different day and time information for store open hours sign' do
    list = []
    list << Day.new('Monday', '2:00', '5:00')
    list << Day.new('Tuesday', '3:00', '4:00')
    list << Day.new('Thursday', '2:00', '4:00')
    r = Signage.new(list)

    expect(r.pretty_list).to eq(['Monday: 2:00 - 5:00', 'Tuesday: 3:00 - 4:00', 'Thursday: 2:00 - 4:00'])
  end
end
