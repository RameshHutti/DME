page 60205 "Dependent New Card"
{
    PageType = Card;
    SourceTable = "Employee Dependents New";
    UsageCategory = Administration;
    ApplicationArea = All;
    //ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Control20)
            {
                field("Request Type"; Rec."Request Type")
                {
                    Editable = WFBool;
                    ShowMandatory = true;
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if Rec."Request Type" = Rec."Request Type"::New then
                            NewBool := true
                        else
                            NewBool := false;
                        CurrPage.UPDATE;
                    end;
                }
                field("Select Dependent No"; Rec."Select Dependent No")
                {
                    Editable = NOT NewBool;
                    ShowMandatory = true;
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        EmployeeDependentsNew: Record "Employee Dependents New";
                    begin
                        //commented By Avinash   DepMasterRec.GET("Select Dependent No", "Employee ID");

                        //commented By Avinash   Rec.TRANSFERFIELDS(DepMasterRec);
                        //commented By Avinash   Rec.MODIFY;

                        //commented By Avinash  DepAddLineRec.RESET;
                        //commented By Avinash  DepAddLineRec.SETRANGE("Dependent ID", "Select Dependent No");
                        //commented By Avinash  if DepAddLineRec.FINDSET then begin
                        //commented By Avinash   repeat
                        //commented By Avinash  RecAddLIne.INIT;
                        //commented By Avinash   RecAddLIne.TRANSFERFIELDS(DepAddLineRec);
                        //commented By Avinash   RecAddLIne.No2 := No2;
                        //commented By Avinash   RecAddLIne.INSERT;
                        //commented By Avinash  until DepAddLineRec.NEXT = 0;
                        //commented By Avinash   end;

                        //commented By Avinash  DeptConLineRec.RESET;
                        //commented By Avinash    DeptConLineRec.SETRANGE("Dependent ID", "Select Dependent No");
                        //commented By Avinash  if DeptConLineRec.FINDFIRST then begin
                        //commented By Avinash  repeat
                        //commented By Avinash   RecContLine.INIT;
                        //commented By Avinash    RecContLine.TRANSFERFIELDS(DeptConLineRec);
                        //commented By Avinash    RecContLine.No2 := No2;
                        //commented By Avinash     RecContLine.INSERT;
                        //commented By Avinash  until DeptConLineRec.NEXT = 0;
                        //commented By Avinash end;

                        //commented By Avinash   CurrPage.UPDATE;
                    end;
                }
                field(Created; Rec.Created)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Workflow Status"; Rec."Workflow Status")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group(Control2)
            {
                Editable = WFBool;
                field(No2; Rec.No2)
                {
                    Caption = 'Request ID';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Employee ID"; Rec."Employee ID")
                {
                    Editable = HRBoolean;
                    ShowMandatory = true;
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Personal Title"; Rec."Personal Title")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field("Dependent First Name"; Rec."Dependent First Name")
                {
                    Editable = EditField;
                    ShowMandatory = true;
                    ApplicationArea = All;
                }
                field("Dependent Middle Name"; Rec."Dependent Middle Name")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field("Dependent Last Name"; Rec."Dependent Last Name")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field("Dependent Name in Arabic"; Rec."Dependent Name in Arabic")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field("Name in Passport in English"; Rec."Name in Passport in English")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field(Relationship; Rec.Relationship)
                {
                    Editable = EditField;
                    ShowMandatory = true;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        ChildControle;
                        CurrPage.UPDATE;
                    end;
                }
                field(Gender; Rec.Gender)
                {
                    Editable = EditField;
                    ShowMandatory = true;
                    ApplicationArea = All;
                }
                field(Nationality; Rec.Nationality)
                {
                    Editable = EditField;
                    ShowMandatory = true;
                    ApplicationArea = All;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    Editable = EditField;
                    ShowMandatory = true;
                    ApplicationArea = All;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    Editable = EditField;
                    ShowMandatory = true;
                    ApplicationArea = All;
                }
                field("<Marital Status>"; Rec."Child with Special needs")
                {
                    Editable = ChildBool;
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        //Relationship = Relationship::Child
                    end;
                }
                field("Child Educational Level"; Rec."Child Educational Level")
                {
                    Editable = ChildBool;
                    ApplicationArea = All;
                }
                field("Is Emergency Contact"; Rec."Is Emergency Contact")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field("Full Time Student"; Rec."Full Time Student")
                {
                    Editable = ChildBool;
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
            }
            part(Control33; "Dependent Req Address")
            {
                Editable = WFBool;
                SubPageLink = No2 = FIELD(No2);
                ApplicationArea = All;
            }
            part(Control34; "Dependent Request Contact")
            {
                Editable = WFBool;
                SubPageLink = No2 = FIELD(No2);
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RECORDID);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Enabled = OpenApprovalEntriesExistForCurrUser;
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RECORDID);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Enabled = OpenApprovalEntriesExistForCurrUser;
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RECORDID);
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedOnly = true;
                    ToolTip = 'Send an approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TESTFIELD("Request Type");
                        Rec.TESTFIELD("Employee ID");
                        Rec.TESTFIELD("Dependent First Name");
                        Rec.TESTFIELD(Gender);
                        Rec.TESTFIELD(Nationality);
                        Rec.TESTFIELD("Date of Birth");
                        Rec.TESTFIELD("Marital Status");
                        Rec.TESTFIELD(Relationship);
                        if Rec."Request Type" <> Rec."Request Type"::New then
                            Rec.TESTFIELD("Select Dependent No");

                        //commented By Avinash if ApprovalsMgmt.CheckNDRPossible(Rec) then
                        //commented By Avinash     ApprovalsMgmt.OnSendNDRForApproval(Rec);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = Rec."Workflow Status" = Rec."Workflow Status"::"Pending Approval";
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedOnly = true;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //commented By Avinash     ApprovalsMgmt.OnCancelNDRApprovalRequest(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Re&open';
                    Enabled = Rec."WorkFlow Status" <> Rec."WorkFlow Status"::Open;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed.';

                    trigger OnAction()
                    var
                        ReleaseSalesDoc: Codeunit "Release Sales Document";
                    begin
                        if Rec."Workflow Status" = Rec."Workflow Status"::"Pending Approval" then
                            ERROR('WorkFlow status should be Approved for reopen');

                        Rec."Workflow Status" := Rec."Workflow Status"::Open;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlVisibility;
        Edit;
        ChildControle;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlVisibility;
        Edit;
        ChildControle;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        Edit;
        //CurrPage.UPDATE;
    end;

    trigger OnOpenPage()
    begin
        HRBoolean := false;
        SetControlVisibility;
        Edit;
        ChildControle;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        //commented By Avinash 
        /*
                EmployeeDependentsMaster.RESET;
                EmployeeDependentsMaster.SETRANGE("No.", "No.");
                if EmployeeDependentsMaster.FINDFIRST then begin
                    EmployeeDependentsMaster.TESTFIELD("Dependent First Name");
                    EmployeeDependentsMaster.TESTFIELD(Gender);
                    EmployeeDependentsMaster.TESTFIELD(Relationship);
                    EmployeeDependentsMaster.TESTFIELD("Date of Birth");
                end;
        */
        //commented By Avinash 
    end;

    var
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CanCancelApprovalForRecord: Boolean;
        RecEmployee: Record Employee;
        HrSetup: Record "Human Resources Setup";
        NoseriesMgt: Codeunit NoSeriesManagement;
        //commented By Avinash    RecEmpIdent: Record Table50003;
        [InDataSet]
        EditField: Boolean;
        //commented By Avinash  EmployeeDependentsMaster: Record Table50004;
        [InDataSet]
        ChildBool: Boolean;
        [InDataSet]
        NewBool: Boolean;
        UserSetup: Record "User Setup";
        //commented By Avinash  DepMasterRec: Record Table50004;
        RecAddLIne: Record "Dependent New Address Line";
        RecContLine: Record "Dependent New Contacts Line";
        //commented By Avinash   DepAddLineRec: Record Table50029;
        //commented By Avinash  DeptConLineRec: Record Table50030;
        [InDataSet]
        WFBool: Boolean;
        HRBoolean: Boolean;
        UserSetupRecG: Record "User Setup";
        ActiveSessionRecG: Record "Active Session";

    local procedure SetControlVisibility()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RECORDID);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RECORDID);


        ActiveSessionRecG.RESET;
        ActiveSessionRecG.SETRANGE("Session ID", SESSIONID);
        ActiveSessionRecG.SETRANGE("User ID", USERID);
        ActiveSessionRecG.SETRANGE("Client Type", ActiveSessionRecG."Client Type"::"Windows Client"); //Active Session
        if ActiveSessionRecG.FINDFIRST then begin

            UserSetupRecG.RESET;
            UserSetupRecG.SETRANGE("User ID", USERID);
            if UserSetupRecG.FINDFIRST then begin

                //IF UserSetupRecG."HR Manager" THEN BEGIN
                if Rec."Workflow Status" = Rec."Workflow Status"::Open then begin
                    WFBool := true;
                    HRBoolean := true;
                end else begin
                    WFBool := false;
                    HRBoolean := false;
                end;
                // END;

            end;

        end;
    end;

    local procedure Edit()
    begin
        Rec.Status := Rec.Status::Active; // Back end fields
        EditField := true;
        if Rec."Request Type" = Rec."Request Type"::New then
            NewBool := true
        else
            NewBool := false;
    end;

    local procedure ChildControle()
    begin
        ChildBool := false;
        if Rec.Relationship = Rec.Relationship::Child then
            ChildBool := true;
    end;

    local procedure WF_Action()
    begin
        //commented By Avinash 
        /*
        if "Workflow Status" = "Workflow Status"::Released then begin
            if ("Request Type" = "Request Type"::Edit) and (Created = false) then begin
                if DepMasterRec.GET("Select Dependent No", "Employee ID") then
                    DepMasterRec.DELETE;

                DepMasterRec.TRANSFERFIELDS(Rec);

                DepAddLineRec.RESET;
                DepAddLineRec.SETRANGE("Dependent ID", "Select Dependent No");
                if DepAddLineRec.FINDSET then begin
                    repeat
                        DepAddLineRec.DELETE;
                    until DepAddLineRec.NEXT = 0;
                end;

                RecAddLIne.RESET;
                RecAddLIne.SETRANGE(No2, No2);
                if RecAddLIne.FINDSET then begin
                    repeat
                        DepAddLineRec.INIT;
                        DepAddLineRec.TRANSFERFIELDS(RecAddLIne);
                        DepAddLineRec."Dependent ID" := "Select Dependent No";
                        DepAddLineRec.INSERT;
                    until RecAddLIne.NEXT = 0;
                end;

                DeptConLineRec.RESET;
                DeptConLineRec.SETRANGE("Dependent ID", "Select Dependent No");
                if DeptConLineRec.FINDFIRST then begin
                    repeat
                        DeptConLineRec.DELETE;
                    until DeptConLineRec.NEXT = 0;
                end;

                RecContLine.RESET;
                RecContLine.SETRANGE(No2, No2);
                if RecContLine.FINDSET then begin
                    repeat
                        DeptConLineRec.INIT;
                        DeptConLineRec.TRANSFERFIELDS(RecContLine);
                        DeptConLineRec."Dependent ID" := "Select Dependent No";
                        DeptConLineRec.INSERT;
                    until RecContLine.NEXT = 0;
                end;
                Created := true;
                MESSAGE('wORKING')
            end;
            */
        //commented By Avinash 
    end;
    //commented By Avinash   end;
}

