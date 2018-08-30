page 50110 "CompanyInfWizard"
{
    Caption = 'Company Information';
    PageType = NavigatePage;
    SourceTable = "Company Information";


    layout
    {
        area(Content)
        {
            group(StandardBanner)
            {
                Caption = '';
                Editable = false;
                Visible = TopBannerVisible AND NOT (CurrentStep = 3);
                field(MediaResourcesStandard; MediaResourcesStandard."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }
            group(FinishedBanner)
            {
                Caption = '';
                Editable = false;
                Visible = TopBannerVisible AND (CurrentStep = 3);
                field(MediaResourcesDone; MediaResourcesDone."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }


            group(Step1)
            {
                Visible = CurrentStep = 1;
                group(sup1)
                {
                    Caption = 'Welcome to Company Info Setup';
                    InstructionalText = 'Please insert all the neccessary information to setup your company data.';
                }
            }

            group(Step2)
            {
                Visible = CurrentStep = 2;
                group(sup2)
                {
                    Caption = '';
                    InstructionalText = 'Please insert the company name and your primary e-mail address';

                    //You might want to add fields here
                    field(CompanyName; Name)
                    {
                        ApplicationArea = All;
                    }
                    field(EMailAddress; "E-Mail")
                    {
                        ApplicationArea = All;
                    }
                }
            }


            group(Step3)
            {
                Caption = 'That''s it!';
                InstructionalText = 'To save this setup, choose Finish.';
                Visible = CurrentStep = 3;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionBack)
            {
                ApplicationArea = All;
                Caption = 'Back';
                Enabled = BackActionEnabled;
                Image = PreviousRecord;
                InFooterBar = true;
                trigger OnAction();
                begin
                    GoStep(-1);
                end;
            }
            action(ActionNext)
            {
                ApplicationArea = All;
                Caption = 'Next';
                Enabled = NextActionEnabled;
                Image = NextRecord;
                InFooterBar = true;
                trigger OnAction();
                begin
                    GoStep(1);
                end;
            }
            action(ActionFinish)
            {
                ApplicationArea = All;
                Caption = 'Finish';
                Enabled = FinishActionEnabled;
                Image = Approve;
                InFooterBar = true;
                trigger OnAction();
                begin
                    CurrPage.Close();;
                end;
            }
        }
    }
    var
        MediaRepositoryStandard: Record "Media Repository";
        MediaRepositoryDone: Record "Media Repository";
        MediaResourcesStandard: Record "Media Resources";
        MediaResourcesDone: Record "Media Resources";
        CurrentStep: Integer;
        TopBannerVisible: Boolean;
        BackActionEnabled: Boolean;
        NextActionEnabled: Boolean;
        FinishActionEnabled: Boolean;

    //Procedures
    procedure GoStep(Step: Integer)
    begin
        CurrentStep += Step;
        SetControls();
    end;

    procedure SetControls()
    begin
        BackActionEnabled := CurrentStep > 1;
        NextActionEnabled := CurrentStep < 3;
        FinishActionEnabled := CurrentStep = 3;
    end;

    local procedure LoadTopBanners();
    begin
        IF MediaRepositoryStandard.GET('AssistedSetup-NoText-400px.png', FORMAT(CURRENTCLIENTTYPE)) AND
           MediaRepositoryDone.GET('AssistedSetupDone-NoText-400px.png', FORMAT(CURRENTCLIENTTYPE))
        THEN
            IF MediaResourcesStandard.GET(MediaRepositoryStandard."Media Resources Ref") AND
               MediaResourcesDone.GET(MediaRepositoryDone."Media Resources Ref")
            THEN
                TopBannerVisible := MediaResourcesDone."Media Reference".HASVALUE AND
                                    MediaResourcesStandard."Media Reference".HasValue;
    end;

    //Triggers
    trigger OnOpenPage()
    begin
        CurrentStep := 1;
        SetControls();
    end;

    trigger OnInit()
    begin
        LoadTopBanners();
    end;
}