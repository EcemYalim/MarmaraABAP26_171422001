CLASS zlc_171422001_230226 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zlc_171422001_230226 IMPLEMENTATION.
    METHOD if_oo_adt_classrun~main.

    "Print Hello Marmara!
    out->write( 'Hello Marmara!' ).
    DATA: lv_integer TYPE i, "i: Integer
    lv_string TYPE string, "string: String
    lv_character TYPE c LENGTH 7, "c: Character
    lv_date TYPE d, "d: Date
    lv_packed TYPE p LENGTH 3 DECIMALS 3. "p: Packed Number LENGTH: Length of Digits Before Decimal Point and Decimal Point


    lv_integer = 6.
    out->write( |lv_integer = { lv_integer }| ).
    lv_integer = 6 + 3.
    out->write( |lv_integer = { lv_integer }| ).

    "Addition
    lv_integer = 6.
    lv_integer = lv_integer + 3.
    out->write( |lv_integer + 3 = { lv_integer }| ).

    lv_integer = 6.
    lv_integer += 3.
    out->write( |lv_integer + 3 = { lv_integer }| ).

    "Subtraction
    lv_integer = 6.
    lv_integer = lv_integer - 3.
    out->write( |lv_integer - 3 = { lv_integer }| ).

    lv_integer = 6.
    lv_integer -= 3.
    out->write( |lv_integer - 3 = { lv_integer }| ).

    "Multiplication
    lv_integer = 6.
    lv_integer = lv_integer * 2.
    out->write( |lv_integer x 2 = { lv_integer }| ).

    lv_integer = 6.
    lv_integer *= 2.
    out->write( |lv_integer x 2 = { lv_integer }| ).

    "Division
    lv_integer = 6.
    lv_integer = lv_integer / 2.
    out->write( |lv_integer / 2 = { lv_integer }| ).

    lv_integer = 6.
    lv_integer /= 2.
    out->write( |lv_integer / 2 = { lv_integer }| ).

    lv_integer = 1234567891.
    out->write( lv_integer ).

    lv_date = cl_abap_context_info=>get_system_date( ).
    out->write( |lv_date = { lv_date }| ).
    "SAP stores date values in format YYYYMMDD.
    out->write( |lv_date arranged in DD.MM.YYYY format= { lv_date+6(2) }.{ lv_date+4(2) }.{ lv_date(4) }| ).
    out->write( |lv_date arranged in DD.MM.YYYY format= { substring( val = lv_date off = 6 len = 2 ) }.{ substring( val = lv_date off = 4 len = 2 ) }.{ substring( val = lv_date off = 0 len = 4 ) }| ).
*    *********************************************************************
    "Packed Number Assignments
    lv_packed = 12.
    out->write( |lv_packed = { lv_packed }| ).
    lv_packed = 9 / 8.
    out->write( |lv_packed = { lv_packed }| ).

    lv_integer = 9.
    lv_packed = lv_integer / 8.
    out->write( |lv_packed = { lv_packed }| ).




    ENDMETHOD.

ENDCLASS.
