page 50103 BookDetailsFactBox
{
    PageType = CardPart;
    SourceTable = Book;
    Caption = 'Book Details';
    

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    LookupPageId = BookCard;
                    
                }
                field(Title; Title)
                {
                    ApplicationArea = All;
                }
                field(Author; Autor)
                {
                    ApplicationArea = All;
                }
                field(NoOfCustomers;NoOfCustomers)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Customer List";
                }
            }
        }
    }
}