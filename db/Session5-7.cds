namespace myfent;

using {
  
  Currency
} from '@sap/cds/common';

type salary {
    value : Decimal;
     currency : Currency;
    
}

entity Employee {
key Emp_ID: Integer;
Emp_name: String;
emp_add: String;
Emp_phone: String;

}

entity Emp_salDet{
    Emp_Id: Integer not null;
    Sal : salary;
    Sal_Date: Date;

}
entity xy {

f1: String default 'abc';
f2: Integer default 1 ;
f3: type of f2;

}

entity e1 {
Emp_ID : Integer;
Emp_name : String;
Emp_role: String;
}

entity Emp_ProDet {
key Emp_Id: Integer;
key pro_id : type of Emp_Id;
emp_Name ;
Pro_name : String;

}

//Views and Projections
//Creating new entity based on a join - let join
entity abc as select from Employee left join Emp_salDet on Employee.Emp_ID = Emp_salDet.Emp_Id {
Sal ,
Sal_Date,
Emp_name,

}


@(before) entity xyz @(inner) {

  @(before) simpleelement @(inner) : String @(after);
}





