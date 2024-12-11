@EndUserText.label: 'Items Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_ITEMS_1563
  as projection on ZI_ITEMS_1563
{
  key Id,
  key OrderId,
      Name,
      Description,
      @EndUserText.label: 'Release'
      ReleaseDate,
      @EndUserText.label: 'Discontinued'
      DiscontinuedDate,
      Price,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      Height,
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      Width,
      Depth,
      Quantity,
      @EndUserText.label: 'Unit'
      UnitOfMeasure,
      //      /* Associations */
      _Orders : redirected to parent ZC_ORDERS_1563
}
