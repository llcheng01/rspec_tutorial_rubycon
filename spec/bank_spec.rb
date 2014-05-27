#bank_manager/spec/bank_spec.rb

require_relative '../lib/bank'
require_relative '../lib/account'

describe Bank, '#initialize' do
    it "has a branch name" do
        branch_name = "NYC Branch"
        assets = 1000.0
        bank = Bank.new(branch_name, assets)
        expect(bank.branch_name).to eql("NYC Branch".to_s)
    end
    it "has initial assets" do
        branch_name = 'NYC Branch'
        assets = 1000.0
        bank = Bank.new(branch_name, assets)
        expect(bank.assets).to equal(1000.0)
    end

    it "has no accounts" do
        branch_name = 'NYC Branch'
        assets = 1000.0
        bank = Bank.new(branch_name, assets)

        expect(bank.accounts.count).to equal(0)
    end
    it "does not have a liability" do
        branch_name = 'NYC Branch'
        assets = 1000.0
        bank = Bank.new(branch_name, assets)

        expect(bank.liability).to equal(0.0)
    end
end

describe Bank, '#open_an_account' do
    it "creates an addition account" do
        bank = Bank.new('NYC Branch')
        account = Account.new('Kuzents', 'RV001B')
        bank.open_an_account(account)

        expect(bank.accounts.count).to eql(1)
    end
end

describe Bank, '#deposit' do
    before do
        @bank = Bank.new('NYC Branch')
        @account = Account.new('Peter', 'RV001A')
        @bank.open_an_account(@account)
        @bank.deposit(@account, 100.0)
    end
    it "increases the bank's liability" do
        expect(@bank.liability).to eql(100.0)
    end

    it "credits the account holder" do
        expect(@account.balance).to eql(100.0)
    end
end
