//Found on google.....kidding. Created by Ben Ortt

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab1
{
    public class Customer
    {
        //private member variables
        private int customerID;
        private String customerFirstName;
        private String customerLastName;
        private String customerPhone;
        private String customerAdress;

        //default constructor
        public Customer()
        {
            customerID = 1;
            customerFirstName = "Joe";
            customerLastName = "Deer";
            customerPhone = "8675309";
            customerAdress = "1142 Devon Lane, Harrisonburg VA";
        }
        //overloaded constructor
        public Customer (int cID, String cFN, String cLN, String cP, String cA)
        {
            customerID = cID;
            customerFirstName = cFN;
            customerLastName = cLN;
            customerPhone = cP;
            customerAdress = cA;
        }

        //getters and setters
        public int CustomerID
        {
            get { return customerID; }
            set { customerID = value; }
        }

        public String customerFirstNameString
        {
            get { return customerFirstName; }
            set { customerFirstName = value; }
        }

        public String customerLastNameString
        {
            get { return customerLastNameString; }
            set { customerLastNameString = value; }
        }

        public String customerPhoneString
        {
            get { return customerPhoneString; }
            set { customerPhoneString = value; }
        }

        public String customerAdressString
        {
            get { return customerAdressString; }
            set { customerAdressString = value; }
        }
    }
}