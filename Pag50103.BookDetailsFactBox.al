page 50103 "BookDetailsFactBox"
{
    PageType = CardPart;
    SourceTable = Book;
    Caption = 'Book Details';
    Editable = false; //muss nicht, FactBox ist automsatisch schreibgeschützt

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    begin
                        ShowDetails();
                    end;
                    
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

    local procedure ShowDetails()
    begin
        Page.Run(Page::BookCard,Rec);
    end;
}