@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Items'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_ITEMS_1563
  as select from zitems_1563 as Items
  association to parent ZI_ORDERS_1563 as _Orders on $projection.OrderId = _Orders.Id
{
  key id                                         as Id,
  key cast(orderid as zorderid preserving type ) as OrderId,
      name                                       as Name,
      description                                as Description,
      releasedate                                as ReleaseDate,
      discontinueddate                           as DiscontinuedDate,
      price                                      as Price,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      height                                     as Height,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      width                                      as Width,
      depth                                      as Depth,
      quantity                                   as Quantity,
      unitofmeasure                              as UnitOfMeasure,
      _Orders
}
