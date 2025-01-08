CLASS lhc_orders DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR orders RESULT result.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE orders.

    METHODS earlynumbering_cba_Items FOR NUMBERING
      IMPORTING entities FOR CREATE orders\_Items.

ENDCLASS.

CLASS lhc_orders IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.

    SELECT MAX( id ) FROM zorders_1563 INTO @DATA(lv_header_id).

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<ls_entity>).
      INSERT VALUE #( %cid            = <ls_entity>-%cid
                      id  = lv_header_id + 1 ) INTO TABLE mapped-orders.
    ENDLOOP.

    LOOP AT mapped-orders ASSIGNING FIELD-SYMBOL(<ls_order>).

        CONDENSE <ls_order>-Id NO-GAPS.

    ENDLOOP.

  ENDMETHOD.

  METHOD earlynumbering_cba_Items.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<ls_entity>).

    SELECT MAX( id ) FROM zitems_1563 where orderid = @<ls_entity>-Id INTO @DATA(lv_items_id).

      LOOP AT <ls_entity>-%target ASSIGNING FIELD-SYMBOL(<ls_item_create>).

        INSERT VALUE #( %cid    = <ls_item_create>-%cid
                        orderid = <ls_entity>-Id
                        id      = lv_items_id + 1 ) INTO TABLE mapped-items.

      ENDLOOP.
    ENDLOOP.

    LOOP AT mapped-items ASSIGNING FIELD-SYMBOL(<ls_item>).

        CONDENSE <ls_item>-Id NO-GAPS.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
