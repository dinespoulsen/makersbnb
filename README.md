
Makers BnB/Mars Bnb
==================

Introduction
-------
The Mars BnB application is the first project group challenge at the Makers Academy in London. The challenge was to build an application that could handle space bookings via user requests. The project integrated all the technologies from the first 5 weeks at the academy. We built the application via the Sinatra framework and we used DataMapper and Postgres as the adapter to set up the database. I have added client and database validation to the application and conditional routing to the controller in order to enhance user security.

You can check out the application via https://secret-earth-94385.herokuapp.com/

Features that needed to be implemented:
-------

*** Headline specifications

```
As a user  
so that I can enlist a space  
I would like to be able to signup  


As a user  
so that I can enlist a space  
I would like to be able to sign in  


As a user
so that I can enlist a space
I would like to be able to add a space

As a user
so that I can manage my listings
I would like to be able to view my spaces


As a user
so that I can find my space
I would like to name my space


As a user
so that that other others can get a description of the space
I would like to be able to add a description to the space


As a user
so that that others can check how much the space costs
I would like to add a price to a space


As a user
so that that customers can know when to book
I would like to add dates of availability to my space


As a user
so that I can book a space
I would like to request to hire any space for one night


As a user
so that my space can't be double booked
I would like to approve a request for booking


As a user
so that I know when a space is not available
I would like to only view available spaces


As a user
so that my space gets full exposure
the space should still be available until a booking has been confirmed
```

Installation
-----
* Run the command 'bundle install' in the project directory to ensure you have all the gems.


How to use the applicaton
-----

To run the program start a local server by writing ruby app/app.rb in the terminal and the app.rb file from the project directory will be executed.

Technologies used
-----
* PostgreSQL database
* DataMapper
* Sinatra framework
* Database Cleaner
* RSpec & Capybara testing
* Heroku for web hosting

Areas to improve
-----

* Improving user profile validations
* Booking validation
* Enhanced date validation
* Image uploader
* Improving the design features
* Offering tickets to Mars
