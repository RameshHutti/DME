page 70005 "Benefit List"
{
    PageType = List;
    SourceTable = "Emp. Benefits List Table";
    UsageCategory = Lists;
    ApplicationArea = All;
    DeleteAllowed = false;
    ModifyAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field(EBList__Benefitcode; Rec.EBList__Benefitcode)
                {
                    ApplicationArea = All;
                }
                field(EBList__UnitFormulaTxt; EBList__UnitFormulaTxt)
                {
                    ApplicationArea = All;
                }
                field(EBList__ValueFormulaTxt; EBList__ValueFormulaTxt)
                {
                    ApplicationArea = All;
                }
                field(EBList__EncashmentFormulaTxt; EBList__EncashmentFormulaTxt)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        EBList__UnitFormulaTxt: Text;
        EBList__ValueFormulaTxt: text;
        EBList__EncashmentFormulaTxt: Text;


    trigger OnAfterGetRecord()
    begin
        EBList__UnitFormulaTxt := Rec.GET_EBList__UnitFormula();
        EBList__ValueFormulaTxt := Rec.GET_EBList__ValueFormula();
        EBList__EncashmentFormulaTxt := Rec.GET_EBList__EncashmentFormula();

    end;
}

