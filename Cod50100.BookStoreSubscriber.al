codeunit 50100 "BookStoreSubscriber"
{
    [EventSubscriber(ObjectType::Table,Database::Customer,'OnAfterInsertEvent','',true,true)]
    procedure CheckFavBookNewCust(var Rec: Record Customer)
    var
        MissingFavBookHint: Label 'Do not forget to provide the %1';
    begin
        if Rec.FavouriteBookNo = '' then
            Message(MissingFavBookHint,Rec.FieldCaption(FavouriteBookNo));
    end;
}