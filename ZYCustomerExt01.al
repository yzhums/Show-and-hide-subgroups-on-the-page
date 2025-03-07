tableextension 50111 ZYCustomerExt extends Customer
{
    fields
    {
        field(50100; "Vehicle Visible"; Boolean)
        {
            Caption = 'Vehicle Visible';
            InitValue = false;
            DataClassification = CustomerContent;
        }
        field(50101; "Car Code"; Code[20])
        {
            Caption = 'Car Code';
            DataClassification = CustomerContent;
        }
        field(50102; "Car Name"; Text[50])
        {
            Caption = 'Car Name';
            DataClassification = CustomerContent;
        }
        field(50103; "Motorcycle Code"; Code[20])
        {
            Caption = 'Motorcycle Code';
            DataClassification = CustomerContent;
        }
        field(50104; "Motorcycle Name"; Text[50])
        {
            Caption = 'Motorcycle Name';
            DataClassification = CustomerContent;
        }
        field(50105; "Bicycle Code"; Text[50])
        {
            Caption = 'Bicycle Code';
            DataClassification = CustomerContent;
        }
        field(50106; "Bicycle Name"; Text[50])
        {
            Caption = 'Bicycle Name';
            DataClassification = CustomerContent;
        }
    }
}
pageextension 50111 ZYCustomerCardExt extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field(VehicleText; Vehicle)
            {
                ApplicationArea = All;
                Caption = 'Vehicle';
                Editable = false;
                trigger OnDrillDown()
                begin
                    if Rec."Vehicle Visible" = true then
                        exit;
                    Rec."Vehicle Visible" := true;
                    Rec.Modify(true);
                end;
            }
            group(VehicleGroup)
            {
                Visible = Rec."Vehicle Visible";
                Caption = 'Vehicle Group';
                field("Car Code"; Rec."Car Code")
                {
                    ApplicationArea = All;
                }
                field("Car Name"; Rec."Car Name")
                {
                    ApplicationArea = All;
                }
                field("Motorcycle Code"; Rec."Motorcycle Code")
                {
                    ApplicationArea = All;
                }
                field("Motorcycle Name"; Rec."Motorcycle Name")
                {
                    ApplicationArea = All;
                }
                field("Bicycle Code"; Rec."Bicycle Code")
                {
                    ApplicationArea = All;
                }
                field("Bicycle Name"; Rec."Bicycle Name")
                {
                    ApplicationArea = All;
                }
                field(HideVehicleLbl; HideVehicleLbl)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                    trigger OnDrillDown()
                    begin
                        if Rec."Vehicle Visible" = false then
                            exit;
                        Rec."Vehicle Visible" := false;
                        Rec.Modify(true);
                    end;
                }
            }
        }
    }
    var
        Vehicle: Text;
        HideVehicleLbl: Label 'Show less';
    trigger OnOpenPage();
    begin
        Vehicle := 'Show More';
    end;
}
