@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Orders'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_ORDERS_1563
  as select from zorders_1563 as Orders
  composition [0..*] of ZI_ITEMS_1563 as _Items
{
  key    id           as Id,
         email        as Email,
         firstname    as FirstName,
         lastname     as LastName,
         country      as Country,
         createon    as Createon,
         deliverydate as DeliveryDate,
         orderstatus  as OrderStatus,
         case orderstatus
           when 3 then 'Open'
           when 2 then 'Accepted'
           when 1 then 'Canceled'
           else 'Open'
         end          as StatusCriticality,
         imageurl     as ImageUrl,
         _Items
}
