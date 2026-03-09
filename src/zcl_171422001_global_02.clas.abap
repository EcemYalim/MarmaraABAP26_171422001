CLASS zcl_171422001_global_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_171422001_global_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.
    DATA: carrier_id TYPE /dmo/carrier_id,
          connection_id TYPE /dmo/connection_id.

    connection = NEW #(  ).
    connection->set_attributes(

    EXPORTING
        i_carrier_id = 'IH'
        i_connection_id = '0400'

    ).


    APPEND connection TO connections.


   connection->set_attributes(

    EXPORTING
        i_carrier_id = 'AA'
        i_connection_id = '0017'

    ).

    APPEND connection TO connections.

    LOOP AT connections INTO connection.
        connection->get_attributes(
            IMPORTING
                e_carrier_id = carrier_id
                e_connection_id = connection_id

        ).
       out->write( |Flight connection { carrier_id } { connection_id }| ).
    ENDLOOP.





    connection->set_attributes(

    EXPORTING
        i_carrier_id = 'SQ'
        i_connection_id = '0001'

    ).

    APPEND connection TO connections.




  ENDMETHOD.
ENDCLASS.
