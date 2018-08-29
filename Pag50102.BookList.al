page 50102 "BookList"
{
    PageType = List;
    SourceTable = Book;
    Caption  = 'Books';
    CardPageId = BookCard;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;

    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field(Title; Title)
                {
                    ApplicationArea = All;
                }
                field(Author; Autor)
                {
                    ApplicationArea = All;
                }
                field(Hardcover; Hardcover)
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