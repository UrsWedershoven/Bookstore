/*OnOpenPage des Verkaufsauftrags
balance LCY > Creditlimit LCY
Achtung, das Kreditlimit iszt überschritten
Aktion: Debitorenkarte
*/
codeunit 50102 "Notification"
{
    [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnOpenPageEvent', '', false, false)]
    procedure OpenSalesOrder_OnOpenPageEvent(var Rec: Record "Sales Header")
    var
        customer: Record Customer;
        TheNotification: Notification;
        MyNotif: Record "My Notifications";
    begin
        if (Rec."No.") = '' then begin
            TheNotification.Id := GetCustCreditLimitNotificationID();
            TheNotification.Recall();
            exit;
        end;
        if customer.get(Rec."Sell-to Customer No.") then begin
            customer.CalcFields("Balance (LCY)");
            if (customer."Balance (LCY)" > customer."Credit Limit (LCY)") and (MyNotif.IsEnabledForRecord(GetCustCreditLimitNotificationID(), Rec)) then begin
                TheNotification.Id := GetCustCreditLimitNotificationID();
                TheNotification.Scope(NotificationScope::LocalScope);
                TheNotification.Message('Achtung: Das Kreditlimit ist überschritten!');
                TheNotification.AddAction('Debitor öffnen', Codeunit::Notification, 'OpenNotificationAction');
                TheNotification.SetData('CustomerNo', customer."No.");
                TheNotification.Send();
            end else begin
                TheNotification.Recall();
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"My Notifications", 'OnInitializingNotificationWithDefaultState', '', true, true)]
    procedure AddSmartNotif()
    var
        Notif: Record "My Notifications";
    begin
        Notif.InsertDefaultWithTableNum(GetCustCreditLimitNotificationID(), 'Kreditlimitprüfung', '', Database::"Sales Header");
    end;

    procedure OpenNotificationAction(TheNotification: Notification)
    var
        customer: Record Customer;
        customerNo: code[20];
    begin
        if TheNotification.HasData('CustomerNo') then begin
            customerNo := TheNotification.GetData('CustomerNo');
            if customer.get(customerNo) then
                Page.run(Page::"Customer Card", customer);

        end;
    end;

    procedure GetCustCreditLimitNotificationID(): Guid
    begin
        exit('d4623cb3-3653-4453-b627-7a790d0ac49c');
    end;
}
