page 50100 "BookCard"
{
    PageType = Card;
    SourceTable = Book;
    
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("Title"; Title)
                {
                    ApplicationArea = All;
                }
            }
            group(Details)
            {
                field(Autor;Autor)
                {
                    ApplicationArea = All;
                }
                field(Hardcover;Hardcover)
                {
                    ApplicationArea = All;
                }
                field(PageCount;PageCount)
                {
                    ApplicationArea = All;
                }
                
            }
        }
    }
}