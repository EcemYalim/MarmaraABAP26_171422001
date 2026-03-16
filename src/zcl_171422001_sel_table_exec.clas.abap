
CLASS zcl_171422001_sel_table_exec DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_171422001_sel_table_exec IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  DATA: name TYPE /dmo/carrier_name.
  SELECT SINGLE FROM /dmo/carrier
    FIELDS name
    WHERE carrier_id = 'SQ'
    INTO @name.
    out->write( |Carrier Name is: { name }| ).
  ENDMETHOD.
ENDCLASS.
