namespace myfent;

using {
  managed,
  Currency
} from '@sap/cds/common';

entity Authors  {
      key authors_id: Int16;
        authors_name: String;
        Authh_dob : Date;
        Authh_DateofDeath : Date;
      ava_books : Association  to Books;
}

// entity Books   {
//  key book_id: Int16;
//       book_name: String ; 
//        stock: Int16

// }; //> Published Association with filter 

// entity P_Books as projection on Books{
//     *,
//             ava_books [ Authh_DateofDeath > 0 ] as DeadAuthor


// }


entity Authors1 as projection on Authors {
    *,
    ava_books[stock > 0] as availablebooks
}

entity Employee : managed {

  key emp_id    : Integer;
            add_id; //>foreign keys
      emp_name  : String;
         emp_phone : String;
      address : Association to many Address;
}



entity Address {
key add_id : Integer;
  add_line1: String;
  add_line2: type of add_line1;
  xyz: association to Emp_salDet;
  newasso : Association to Cust_det; //> the backlink 

}


 entity  Vend_det {
  vend_ID: Int16;
  
 }


 //> Annotation targets

//> context and Services
// @before define (context |service) Ebs @inner {}
@before define (context |service) Ebs @inner {}


//> Definitions and elementswith simple types
@before define  type Foo @inner : String @after;


//> add fields without destruying it. Extend directive:
entity Books   {
 key book_id: Int16;
      book_name: String ; 
      DateofDeath: Date;
       stock: Int16

}; //> Extend the entity with another name 

extend Books @(title: 'Books20') {
        newfield: String;
        newfield2: String;

}

Entity Doc_Header {
      Doc_ID: Int16;
      Doc_Name: String;
      Cust_ID: Int16


}

Extend Doc_Header {
        ManagedObject; 
 
}
  aspect ManagedObject {
    created { at: Timestamp ;
              byDate; Date;
            }

  }








