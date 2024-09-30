namespace newmodel;

entity mat_hdr {

 key Mat_ID; Int16;
     mat_name: String

} //> newmodel.mat_hdr

context material_dev {
   entity  mat_item {
            key   Mat_ID;
            mat_name;
            supplier_name: String;

   } //> newmodel.material_dev.mat_item
   context nested {
//> fields of study
        entity mat_sto {

   } //> newmodel.material_dev.mat_sto
   }
}