require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/king_pong'
require_relative '../apps/web/application'

Hanami.configure do
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/king_pong_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/king_pong_development'
    #    adapter :sql, 'mysql://localhost/king_pong_development'
    #
    adapter :sql, ENV.fetch('DATABASE_URL')

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []
  end
end
