codeunit 50101 "SassificationSubscription"
{
    [EventSubscriber(ObjectType::Table, Database::"Aggregated Assisted Setup", 'OnRegisterAssistedSetup', '', false, false)]
    local procedure AddExtensionAssistedSetup_OnRegisterAssistedSetup(var TempAggregatedAssistedSetup: Record "Aggregated Assisted Setup" TEMPORARY);
    var
        AssistedSetupRecord: Record "Company Information";
    begin
        TempAggregatedAssistedSetup.AddExtensionAssistedSetup(Page::CompanyInfWizard,
                                                            'Company Setup Wizard',
                                                            True,
                                                            AssistedSetupRecord.RecordId(),
                                                            GetAssistedSetupStatus(TempAggregatedAssistedSetup),
                                                            'Setup');
    end;
    [EventSubscriber(ObjectType::Table, Database::"Aggregated Assisted Setup", 'OnUpdateAssistedSetupStatus', '', true, true)]
    local procedure AggregatedAssistedSetup_OnUpdateAssistedSetupStatus(var TempAggregatedAssistedSetup: Record "Aggregated Assisted Setup" TEMPORARY);
    begin
        TempAggregatedAssistedSetup.SetStatus(
            TempAggregatedAssistedSetup, PAGE::CompanyInfWizard, 
            GetAssistedSetupStatus(TempAggregatedAssistedSetup));
    end;
    local procedure GetAssistedSetupStatus(AggregatedAssistedSetup: Record "Aggregated Assisted Setup"): Integer;
    var
        AssistedSetupRecord: Record "Company Information";
    begin
        WITH AggregatedAssistedSetup DO BEGIN
            AssistedSetupRecord.Get();
            IF IsCompleted(AssistedSetupRecord) THEN
                Status := Status::Completed
            ELSE
                Status := Status::"Not Completed";
            EXIT(Status);
        END;
    end;

    procedure IsCompleted(Company : Record "Company Information") : Boolean
    begin
        if (Company.Name <> '') AND (Company."E-Mail" <> '') then
            exit(true);
        Exit(false);
    end;

}