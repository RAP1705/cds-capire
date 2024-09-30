using{ myfent}  from '../db/MyFirstEntity';


service Employee1 {

Entity Employee as projection on myfent.Employee
entity parameter (f1: Integer) as select from Employee where emp_id=:f1;

}

service Myservice {

entity Myservice1 as projection on myfent.Authors {
                    *, authors_id as ID

                        }



}

//> Expose entity with parameters
service order {

@readonly entity order_detailsP(Parameter1: Integer) as select from myfent.Orders where order_id = :Parameter1

}

//> Custom Actions and Functions 

service myorders{
entity orders {
    order_id;

}
    type cancelorderret {
        acknowledge : String enum {succeeded; failed;  }; //> indicates if the actions was good or not
        message: String ;
    }

    action cancelorder (order_id: Integer, reason: String) returns cancelorderret;
    function countOrders() returns Integer;
    function getopenorders() returns array of orders;
    
}
//> Customed defined event
service events {

entity Orders {
oder_ID 
                }
    event OrderCanceled {
            Order_ID: Integer;
            reason: String;

    }

}

//> Namespace

service service_mat_hdr {
     entity Mat_hdrSET as projection on  myfent.Mat_hdr 


  
}




