# README

1. Create the app: 
	+ rails new -d postgresql(heroku database)

2. Create the app in shopify partner dashboard
	+ Uri: https://example.herokuapp.com
		* remember the https or http or it will have he redirect_uri error
 	+ Click create app

3. Go to the app info
	+ Change the redirect uri to: https://example.herokuapp.com/auth/shopify/callback

4. Go to Extensions
	+ Enable "Embed in Shopify admin" if you want your app to run in Shopify web page

5. In the Gemfile 
	+ Insert the shopify app gem 
		* gem 'shopify_app' or 
		* gem 'shopify_app', '7.2.9'
	+ bundle install

6. Generate shopify app
	+ rails generate shopify_app --api_key <your_api_key> --secret <your_app_secret>
		ex: rails generate shopify_app --api_key asdv --secret xyz

7. Delete favicon.ico
	+ In app/views/home/index => delete the line  Icon:....'favicon.ico'(Don't know why heroku can not redirect if you have this line) 
	+ If you want your app not to run in embedded app on shopify go to: app/views/layouts/embedded_app.html.erb change forceRedirect: true => forceRedirect: false

8. Change version of the database 
	+ In db/migrate/...._create_shops.rb => change this line CreateShops < ActiveRecord::Migration into CreateShops < ActiveRecord::Migration[5.0] 
		* this line will let you migrate the database in heroku

9. Push to Heroku(you can push to github first)
	+ git init
	+ git add .
	+ git commit -m "......"
	+ heroku create (then rename)
	+ git push heroku master
	+ heroku rake db:migrate(Important)

10. go to your heroku app and test

