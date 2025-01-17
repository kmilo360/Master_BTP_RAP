CLASS lhc_orders DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF Order_status,
        open     TYPE c LENGTH 10 VALUE 'Open', "Open
        accepted TYPE c LENGTH 10 VALUE 'Accepted', "Accepted
        canceled TYPE c LENGTH 10 VALUE 'Canceled', "Canceled
      END OF Order_status.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR orders RESULT result.

    METHODS setstatus1 FOR DETERMINE ON SAVE
      IMPORTING keys FOR orders~setstatus1.

    METHODS setstatus2 FOR MODIFY
      IMPORTING keys FOR ACTION orders~setstatus2.

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

      SELECT MAX( id ) FROM zitems_1563 WHERE orderid = @<ls_entity>-Id INTO @DATA(lv_items_id).

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

  METHOD setStatus1.

    READ ENTITIES OF zi_orders_1563 IN LOCAL MODE
         ENTITY Orders
           FIELDS ( StatusCriticality )
           WITH CORRESPONDING #( keys )
         RESULT DATA(orders1).

    LOOP AT orders1 ASSIGNING FIELD-SYMBOL(<order>).

      CASE <order>-OrderStatus.
        WHEN '3'. "Open
          <order>-StatusCriticality = order_status-open.
        WHEN '1'. "Canceled
          <order>-StatusCriticality = order_status-canceled.
        WHEN '2'. "Accepted
          <order>-StatusCriticality = order_status-accepted.
        WHEN OTHERS.
          <order>-StatusCriticality = order_status-open.
      ENDCASE.

    ENDLOOP.

*    modify entities of zi_orders_1563 in local mode
*      entity Orders
*        update  fields ( StatusCriticality )
*        with corresponding #( orders1 ).

    " Trigger Parent Internal Action
    MODIFY ENTITIES OF zi_orders_1563 IN LOCAL MODE
           ENTITY orders
           EXECUTE setStatus2
           FROM CORRESPONDING  #( orders1 ).

  ENDMETHOD.

  METHOD setStatus2.

    READ ENTITIES OF zi_orders_1563 IN LOCAL MODE
         ENTITY Orders
           FIELDS ( StatusCriticality )
           WITH CORRESPONDING #( keys )
         RESULT DATA(orders1).

    MODIFY ENTITIES OF zi_orders_1563 IN LOCAL MODE
          ENTITY Orders
            UPDATE FROM VALUE #( FOR ls_order IN orders1 (
                                %key-Id = ls_order-Id
                                OrderStatus = ls_order-OrderStatus
                                StatusCriticality = ls_order-StatusCriticality
                                %control-StatusCriticality = if_abap_behv=>mk-on ) ).



  ENDMETHOD.

ENDCLASS.
