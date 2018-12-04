# ZimRideMobile
A Rideshare app for Cornell Students\
Use Iphone 8 plus
Screenshots:

To connect drivers and passengers going places
# iOS
* Has two UICollectionViews. One is used to display notifications while the other displays rides available.
* Uses a UINavigationController to pop and push between view controllers
* Integrates a MapKit API in order to display the current location and location of the destination
* Unfortunately integrating with our backend to display and post new rides in a database is still a work in progress. This is why we had to hardcode the date in our UICollectionViews. We were also hoping to create individual profiles based on logins but did not have enough time. These would have individual notifications and users could interact with each other. 

# Backend
* We implemented a database to store details about rides
* GET requests for obtaining specific rides and "buying the ride", and also requesting to see all rides
* DELETE request which deletes all rides departing before current date
* POST requests to search for specific rides (specific to also round and single trips) and creating new rides by the dirver
* Deployed to Google Cloud

Pls be gentle I am soft
