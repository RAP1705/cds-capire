namespace myfent;

using {
  managed,
  Currency
} from '@sap/cds/common';


type amount {
  value    : Decimal;
  currency : Currency;

}

// >   address: Association to Address on address.add_id=add_id; //> unmanaged association

// entity Employee : managed {

//   key emp_id    : Integer;
//             add_id; //>foreign keys
//       emp_name  : String;
//          emp_phone : String;
//       address : Association to many Emp2add on address.emp = $self;
// }

entity Address {
key add_id : Integer;
  add_line1: String;
  add_line2: type of add_line1;
  xyz: association to Emp_salDet;
  newasso : Association to Cust_det; //> the backlink 

}

entity Emp2add {

key emp: Association to Employee;
    adr: Association to Address;
}
//> Expose entity with parameters
entity Orders {
  key order_id: Int16;
  items : Composition of many Orderitems on items.parent = $self; //> this is strict join
}

entity Orderitems {
  key product_id;
  key parent: Association  to Orders ; 
  
}

entity Emp_salDet {
  emp_Id   : Integer;
  Sal      : amount;
  Sal_Date : Date;
  add: Association to Address; //> managed (to one) Association

}

entity Cust_det{
  cust_id: Integer;
  Cust_name: String;
  add : Association to many Address on add.newasso = $self ; //> one to many

}

entity e2(

f1 : Integer,
f2 : String,
F3 : Boolean,
)

as select * from Employee where emp_id =:f1;

//> 15/8/2024 
//> Unmanaged composition 1:m
entity Order_hdr  {
  key order_id ;
  Items : Composition of many Order_Items on Items.Order_id = $self;
}

entity Order_Items {

key Item_id : Integer;
Key Order_id: Association to Order_hdr;

}

//> Managed Composition in line targets
entity Mat_hdr  {
  key order_id ;

  Mat:  Composition of many {
    Key Mat_No: Int16;
          add : Association to Mat_hdr;

  }
}
//> 16/8/2024
entity Orders1 {
  Key Order_ID;
  Items1 : Composition of many OrderItems1 //> Managed composition with name target
}

aspect OrderItems1 {
key Item_ID;
add1 : Association to Address;

}

entity Teams {

key TID: Int16;
members : Composition of many {
  key user: Association to users
}

}
entity users {
UID: Int16 ;
teams: Association to many Teams.members on teams.user = $self

}

//>19/8/2024


entity Org_det {
 key Org_ID: Int16 ;
 venders: Composition of many {
  key vendtoorg : Association to Vend_det;

 }
}

 entity  Vend_det {
  vend_ID: Int16;
  
 }

//> 20/8/2024
// >   address: Association to Address on address.add_id=add_id; //> unmanaged association

entity Employee : managed {

  key emp_id    : Integer;
            add_id; //>foreign keys
      emp_name  : String;
         emp_phone : String;
      address : Association to many Emp2add on address.emp = $self;
}

entity Employee1 {
key emp_id;
emp_name;
address;

} //> publish association in projection

entity Authors  {
      key authors_id: Int16;
        authors_name: String;
      ava_books : Association  to Books;
}

entity Books   {
 key book_id: Int16;
      book_name: String ; 
       stock: Int16

}; //> Published Association with filter 

entity Authors1 as projection on Authors {
    *,
    ava_books[stock > 0] as availablebooks

}



