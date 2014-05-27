#lib/account.rb

class Account
    attr_accessor :name, :address, :account_number

    def initialize(name, address)
        @name = name
        @address = address
        @account_number = self.object_id.to_s
    end
end
