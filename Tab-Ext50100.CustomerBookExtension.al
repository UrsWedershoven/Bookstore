tableextension 50100 "Customer Book Extension" extends Customer
{
    fields
    {
        field(50100; FavouriteBookNo; Code[20])
        {
            TableRelation = Book;
            Caption = 'Favourite Book No.';
        }
    }
}