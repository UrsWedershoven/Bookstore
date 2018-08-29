pageextension 50101 "CustomerListExtension" extends "Customer List"
{
  layout
  {
    addafter("Balance Due (LCY)")
    {
      field(FavouriteBookNo;FavouriteBookNo)
      {
        ApplicationArea = All;
      }
    }
  }
}
