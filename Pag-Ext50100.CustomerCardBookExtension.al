pageextension 50100 "CustomerCardBookExtension" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field(FavouriteBookNo;FavouriteBookNo)
            {
                ApplicationArea = All;
            }
            
        }
        addfirst(FactBoxes)
        {
            part(BookDetails;BookDetailsFactBox)
            {
                Caption = 'Book Details';
                ApplicationArea = All;
                SubPageLink = "No." = field(FavouriteBookNo);
            }
        }
    }

}