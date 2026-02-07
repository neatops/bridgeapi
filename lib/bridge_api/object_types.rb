# frozen_string_literal: true

module BridgeApi
  #
  # Supported resources types
  #
  module ObjectTypes
    #
    # Matches API resources with corresponding gem classes
    #
    # @return [Account, Bank, Category, Item, Stock, Transaction, Transfer, User, nil] the matched resource or nil
    #
    def self.resource_types_to_classes
      {
        Account::RESOURCE_TYPE => Account,
        Bank::RESOURCE_TYPE => Bank,
        Provider::RESOURCE_TYPE => Provider,
        Category::RESOURCE_TYPE => Category,
        Item::RESOURCE_TYPE => Item,
        Stock::RESOURCE_TYPE => Stock,
        Transaction::RESOURCE_TYPE => Transaction,
        Transfer::RESOURCE_TYPE => Transfer,
        Payment::RESOURCE_TYPE => Payment,
        User::RESOURCE_TYPE => User
      }
    end
  end
end
