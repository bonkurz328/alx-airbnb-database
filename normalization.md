# Normalization of Data: 

## 1. What is Data Normalization: 
Data normalization is the process of organizing data (in a database) to remove unnecessary values. The data is stored categorically, the values are put in the right place and everything is connected accordingly without room for error or confusion. The entities (in this scenario: user, property, bookings, payments, reviews and message) are organized to show the relationship between them. 

## 2. Normalization Diagram: 
![ERD drawing](Normalization.drawio.png) 

## 3. Relationships: 
- One **User** can own many **Properties.** 
- One **User** can make many **Bookings.** 
- One **Property** can have many **Users.** 
- One **Property** can have many **Bookings.** 
- One **Property** can have many **Payments.** 
- One **Property** can have many **Reviews.** 
- One **Booking** has one **Payment.** 
- One **Booking** has one **Review.** 
- One **Review** has one **Message.** 


