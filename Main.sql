/* do not change the following two lines! */
.header on
.mode column
/* do not change the above two lines! */

/*2b(i)  John Smith, Customer ID - GR01932, has asked for a copy of the tax he has paid on flight QH182. The tax for a booking is calculated as follows:

adults pay £5.50
children pay £2.00
concessions pay £1.50 */

SELECT forename, surname, (adultTicket*5.5+childTicket*2+concessionTicket*1.5) AS [Tax (£)]
FROM Customer, Booking
WHERE Customer.customerID='GR01932'
AND Customer.customerID=Booking.customerID
AND flightID='QH182';

/* 2b(ii)  The airline wishes to identify the customer(s) who made a booking with the greatest number of children.
Implement two SQL statements that will find the forename and surname of the customer(s) who made a booking with the greatest number of children. */

SELECT forename, surname 
FROM Customer, Booking, (SELECT MAX(childTicket) AS mostChildTickets
FROM Booking)
WHERE Customer.customerID=Booking.customerID
AND childTicket=mostChildTickets;
