#spec/account_spec.rb
require_relative '../lib/account'

describe Account, '#initialize' do
    before do
        name = 'Mozzie'
        address = 'RV001A'
        @account = Account.new(name, address)
    end

    it "has the owner's name" do
        expect(@account.name).to eql('Mozzie')
    end

    it "has an account number" do
        expect(@account.account_number).to eql(@account.object_id.to_s)
    end

    context "creating another account" do
        it "has an unique account_number" do
            account_2 = Account.new('Smith', 'RV001B')
            expect(account_2.account_number).to_not eql(@account.object_id.to_s)
        end
    end
end
