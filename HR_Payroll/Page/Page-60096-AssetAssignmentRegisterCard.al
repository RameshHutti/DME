page 60096 "Asset Assignment Register card"
{
    // DelayedInsert = false;
    // DeleteAllowed = false;
    // InsertAllowed = false;
    // ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Asset Assignment Register";
    SourceTableView = WHERE(Posted = FILTER(true));
    UsageCategory = Documents;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("General")
            {

                field("FA No"; Rec."FA No")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("FA Description"; Rec."FA Description")
                {
                    ApplicationArea = All;
                }
                field("Asset Custody Type"; Rec."Asset Custody Type")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Employee Name / Department Name';
                }
                field("Sub Department"; Rec."Sub Department")
                {
                    ApplicationArea = All;
                }
                field("Issue Document No."; Rec."Issue Document No.")
                {
                    ApplicationArea = All;
                }
                field("Posted Issue Document No"; Rec."Posted Issue Document No")
                {
                    ApplicationArea = All;
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = All;
                }
                field("Return Document No."; Rec."Return Document No.")
                {
                    ApplicationArea = All;
                }
                field("Posted Return Document No"; Rec."Posted Return Document No")
                {
                    ApplicationArea = All;
                }
                field("Asset Owner"; Rec."Asset Owner")
                {
                    ApplicationArea = All;
                    Caption = 'Asset Owner No.';
                }
                field("Issue to/Return by"; Rec."Issue to/Return by")
                {
                    ApplicationArea = All;
                    Caption = 'Employee No / Department ID';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }

        }

    }
}

