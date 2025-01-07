class zcl_data_gen_1563 definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.
  protected section.
  private section.
ENDCLASS.



CLASS ZCL_DATA_GEN_1563 IMPLEMENTATION.


  method if_oo_adt_classrun~main.

    DELETE FROM zorders_1563.

    DATA: it_tab TYPE STANDARD TABLE OF zorders_1563.
    it_tab = VALUE #(
    ( id = '1' email = 'camilo1@gmail.com' firstname = 'Camilo1' lastname = 'Mejia1' country = 'CO' createon = '20250102' deliverydate = '20250110' orderstatus = '1' imageurl = 'https://cdn.pixabay.com/photo/2016/03/31/20/37/client-1295901_1280.png' )
    ( id = '2' email = 'camilo2@gmail.com' firstname = 'Camilo2' lastname = 'Mejia2' country = 'BR' createon = '20250102' deliverydate = '20250111' orderstatus = '2' imageurl = 'https://cdn.pixabay.com/photo/2016/03/31/20/37/client-1295901_1280.png' )
    ( id = '3' email = 'camilo3@gmail.com' firstname = 'Camilo3' lastname = 'Mejia3' country = 'AR' createon = '20250102' deliverydate = '20250112' orderstatus = '1' imageurl = 'https://cdn.pixabay.com/photo/2016/03/31/20/37/client-1295901_1280.png' )
    ( id = '4' email = 'camilo4@gmail.com' firstname = 'Camilo4' lastname = 'Mejia4' country = 'CO' createon = '20250102' deliverydate = '20250113' orderstatus = '3' imageurl = 'https://cdn.pixabay.com/photo/2016/03/31/20/37/client-1295901_1280.png' )
    ( id = '5' email = 'camilo5@gmail.com' firstname = 'Camilo5' lastname = 'Mejia5' country = 'AR' createon = '20250102' deliverydate = '20250114' orderstatus = '2' imageurl = 'https://cdn.pixabay.com/photo/2016/03/31/20/37/client-1295901_1280.png' )
    ).


    INSERT zorders_1563 FROM TABLE @it_tab.
    out->write( |{ sy-dbcnt }  entries inserted successfully!| ).


    DELETE FROM zitems_1563.

    DATA: it_tab2 TYPE STANDARD TABLE OF zitems_1563.
    it_tab2 = VALUE #(
    ( id = '1' orderid = '1' name = 'Pedal Overdrive' description = 'Overdrive for Guitar' releasedate = '20010417' discontinueddate = '20020417' price = '2.5' height = '5'
    width = '10' depth = '8' quantity = '20' unitofmeasure = '' )
    ( id = '2' orderid = '1' name = 'Pedal Punk Distortion' description = 'Punk Distortion for Guitar' releasedate = '20010417' discontinueddate = '20300417' price = '3.5' height = '5'
    width = '10' depth = '8' quantity = '15' unitofmeasure = '' )
    ( id = '1' orderid = '2' name = 'Pedal Fuzz' description = 'Fuzz Distortion for Guitar' releasedate = '20010417' discontinueddate = '20300417' price = '20.9' height = '5'
     width = '10' depth = '8' quantity = '8' unitofmeasure = '' )
    ( id = '2' orderid = '2' name = 'Pedal delay' description = 'Delay for Guitar' releasedate = '20010417' discontinueddate = '20300417' price = '19.9' height = '5'
    width = '10' depth = '8' quantity = '10' unitofmeasure = '' )
    ( id = '1' orderid = '3' name = 'Pedal Reverb' description = 'Reverb for Guitar' releasedate = '20010417' discontinueddate = '20300417' price = '22.99' height = '5'
    width = '10' depth = '8' quantity = '5' unitofmeasure = '' )
    ( id = '2' orderid = '3' name = 'Pedal Chorus' description = 'Chorus for guitar' releasedate = '20010417' discontinueddate = '20300417' price = '22.8' height = '5'
    width = '10' depth = '8' quantity = '12' unitofmeasure = '' )
    ( id = '3' orderid = '3' name = 'Pedal noise Gate' description = 'Noise Gate for Guitar' releasedate = '20010417' discontinueddate = '20300417' price = '18.8' height = '5'
    width = '10' depth = '8' quantity = '6' unitofmeasure = '' )
    ( id = '1' orderid = '4' name = 'Pedal Metal Distortion' description = 'Metal Distortion for Guitar' releasedate = '20010417' discontinueddate = '20300417' price = '35.88' height = '5'
    width = '10' depth = '8' quantity = '0' unitofmeasure = '' )
    ( id = '2' orderid = '4' name = 'Pedal Dual Delay' description = 'Dual delay for Guitar' releasedate = '20010417' discontinueddate = '20300417' price = '1088.8' height = '5'
    width = '10' depth = '8' quantity = '0' unitofmeasure = '' )
    ( id = '3' orderid = '4' name = 'Pedal dual Switch' description = 'Dual Switch for Guitar' releasedate = '20010417' discontinueddate = '20300417' price = '1.01' height = '5'
    width = '10' depth = '8' quantity = '7' unitofmeasure = '' )
    ( id = '1' orderid = '5' name = 'Pedal Boost' description = 'Boost for Guitar' releasedate = '20010417' discontinueddate = '20300417' price = '6.99' height = '5'
    width = '10' depth = '8' quantity = '16' unitofmeasure = '' )
    ).


    INSERT zitems_1563 FROM TABLE @it_tab2.
    out->write( |{ sy-dbcnt }  entries inserted successfully!| ).

  endmethod.
ENDCLASS.
