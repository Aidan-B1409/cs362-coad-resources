require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TIcketsHelper. For example:
#
# describe TIcketsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TicketsHelper, type: :helper do
  describe '#format_phone_number' do
    it 'normalizes a hyphenated phone number and adds a country code' do
      expect(helper.format_phone_number("541-867-5309")).to eq("+15418675309")
    end   
  end
end
