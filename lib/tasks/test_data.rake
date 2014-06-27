# namespace :app do
#   desc <<-DESC
#     Load testing data.
#     Run using the command 'rake app:load_demo_data'
#   DESC
#   task :load_demo_data => [:environment] do

#   # Only data not required in production should be here.
#   # If it needs to be there in production, it belongs in seeds.rb.

#   User.delete_all
#   Category.delete_all

#   User.create(:login => "test_user", :password => "testpass")
#   Category.create(:category => 'Category #1')

#   # Other test data should be added here...

#   end
# end