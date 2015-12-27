# bookmark_manager [![Build Status](https://travis-ci.org/mariann013/bookmark_manager.svg)](https://travis-ci.org/mariann013/bookmark_manager)

User Stories
-----

```
As a User
So that I can select the page I want 
I want to see a list of links
```
```
As a User
So that I can reach pages I like more quickly 
I want to be able to add new links
```
```
As a User 
So that I can categorise my links
I want to be able to add tags to the links in my bookmark manager
```
```
As a User
So I can find the link I want quickly
I want to be able to filter my links by tags
```
Description
-----

Bookmark manager is a web based application that allows users to sign in and access web links that they have previously saved to access later. These links can also be given tags which will allow users to filter links by tags in order to better access their content. The links are stored in a local database and are mapped from the interface to the database using datamapper. 

The code is written in ruby and tested using capybara and rspec. 

Instalation:
  - Clone git repo
  - Bundle install in the command line
  - To run tests run rspec in the command line
  - Run rackup or ruby app.rb and visit the local host to interact with the application
