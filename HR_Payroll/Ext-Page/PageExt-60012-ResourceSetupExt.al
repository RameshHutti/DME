pageextension 60012 ResourceSetupExt extends "Resources Setup"
{
    layout
    {
        // Add changes to page layout here
        addlast(Content)
        {
            field("HR Email ID"; Rec."HR Email ID")
            {
                ApplicationArea = All;
            }
        }
    }



}
