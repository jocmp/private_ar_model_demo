module Accounts
  # --- Public APIs
  def self.fetch(id:)
    db_object = Model.find(id)
    Account.new(
      id: db_object.id,
      name: db_object.name,
    )
  end

  def self.create(name:)
    db_object = Model.create!(name: name)
    Account.new(
      id: db_object.id,
      name: db_object.name,
    )
  end

  # --- Private ActiveRecord model
  # ---- No validations should exist at this level!
  class Model < ApplicationRecord
    self.table_name = 'accounts'
  end
  private_constant :Model

  # --- Value Object for the outside world
  # ---- This can live anywhere, even outside of the codebase
  class Account
    attr_reader :id, :name

    def initialize(id:, name:)
      @id = id
      @name = name
    end
  end
end
