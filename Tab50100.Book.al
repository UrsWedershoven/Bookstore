table 50100 "Book"
{
    Caption = 'Book';
    DataCaptionFields = "No.", Title;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
        }
        field(2; "Title"; Text[50])
        {
            Caption = 'Title';
        }

        field(3; Autor; Text[50])
        {
            Caption = 'Autor';
        }
        field(4; Hardcover; Boolean)
        {
            Caption = 'Hardcover';
        }
        field(5; PageCount; BigInteger)
        {
            Caption = 'Page Count';
        }
        field(10;"NoOfCustomers";Integer)
        {
            Caption = 'No. of Customers';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count(Customer where(FavouriteBookNo = field("No.")));
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "No.", Title, Hardcover) { }
    }
}