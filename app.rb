# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'


get "/" do
  erb :home
end


class Loyalty_Point__c < ActiveRecord::Base
  self.table_name = 'salesforce.Loyalty_Point__c'
end

get "/Loyalty" do
 @Loyalty = Loyalty_Point__c.all
  erb :index
end

get "/create" do
  dashboard_url = 'https://dashboard.heroku.com/'
  match = /(.*?)\.herokuapp\.com/.match(request.host)
  dashboard_url << "apps/#{match[1]}/resources" if match && match[1]
  redirect to(dashboard_url)
end
