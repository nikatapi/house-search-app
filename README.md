README
======

This is a Ruby On Rails app for searching and registering houses for rent.
It uses the following components for its functionality:

* Bootstrap
* Devise & OmniAuth for authentication
* Mailboxer for private messaging
* ActiveAdmin backend
* Geocoder & Gmaps4rails 
* Carrierwave for file upload

To get this app running on your machine:

1.Clone git repository: 

<tt>git clone https://github.com/nikatapi/house-search-app </tt>

2.Install all dependencies (use sudo for activeadmin) 

<tt>bundle install</tt>

3.Create the database 

<tt>rake db:schema:load</tt>

4.Now run your application 

<tt>rails s</tt> 


