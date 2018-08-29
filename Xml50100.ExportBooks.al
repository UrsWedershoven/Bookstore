xmlport 50100 "ExportBooks"
{
    Caption = 'Export Books';
    Format = Xml;
    UseRequestPage = false;
    Direction = Export;

    schema
    {
        textelement(Books)
        {
            tableelement(Book; Book)
            {
                fieldattribute(Number; Book."No.") { }
                fieldelement(Title; Book.Title) {}
                fieldelement(Author; Book.Autor) {}
                fieldelement(Pagecount; Book.PageCount){}
                fieldelement(Hardcover; Book.Hardcover) {}
            }
        }
    }
}