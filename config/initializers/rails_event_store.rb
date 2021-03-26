require 'rails_event_store'
require 'arkency/command_bus'

Rails.configuration.to_prepare do
  Rails.configuration.event_store = RailsEventStore::Client.new
  Rails.configuration.command_bus = Arkency::CommandBus.new
  Configuration.new.call(Rails.configuration.event_store, Rails.configuration.command_bus)
end
