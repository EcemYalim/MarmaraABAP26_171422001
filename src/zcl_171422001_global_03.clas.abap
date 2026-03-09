CLASS zcl_171422001_global_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_171422001_global_03 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA connection  TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

    DATA: carrier_id    TYPE /dmo/carrier_id,
          connection_id TYPE /dmo/connection_id,
          status        TYPE int4,
          flight_date   TYPE dats.

    TRY.
        " 1. Kayıt
        connection = NEW #( i_carrier_id    = 'IH'
                            i_connection_id = '0400'
                            i_status        = 1
                            i_flight_date   = sy-datum ). " sy-datum bugünün tarihini atar

        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( 'Method call failed' ).
    ENDTRY.

    " 2. Kayıt (Boş yaratıp set_attributes ile doldurma)
    connection = NEW #(  ).
    connection->set_attributes(
      EXPORTING
        i_carrier_id    = 'IH'
        i_connection_id = '0401'
        i_status        = 2
        i_flight_date   = '20260310'
    ).
    APPEND connection TO connections.

    TRY.
        " 3. Kayıt (Yazım hatası 'i_connection_şd' düzeltildi)
        connection = NEW #( i_carrier_id    = 'AA'
                            i_connection_id = '0017'
                            i_status        = 3
                            i_flight_date   = '20260315' ).

        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( 'Method call failed' ).
    ENDTRY.

    " 4. Kayıt (Aynı obje referansı üzerinden SQ ekleme)
    connection = NEW #( ). " <-- DİKKAT: Her yeni satır için yeni bir obje referansı yaratmalısın!
    connection->set_attributes(
      EXPORTING
        i_carrier_id    = 'SQ'
        i_connection_id = '0001'
        i_status        = 4
        i_flight_date   = '20260401'
    ).
    APPEND connection TO connections.


    " Ekrana Yazdırma İşlemi
    LOOP AT connections INTO connection.
      connection->get_attributes(
          IMPORTING
              e_carrier_id    = carrier_id
              e_connection_id = connection_id
              e_status        = status
              e_flight_date   = flight_date
      ).
      out->write( |Flight connection { carrier_id } { connection_id } | &
                  |- Status: { status } - Date: { flight_date DATE = ISO }| ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
