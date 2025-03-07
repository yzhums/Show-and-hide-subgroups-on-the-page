tableextension 50111 ZYCustomerExt extends Customer
{
    fields
    {
        field(50100; "Shipment Method Visible"; Boolean)
        {
            Caption = 'Shipment Method Visible';
            InitValue = false;
            DataClassification = CustomerContent;
        }
    }
}
pageextension 50111 ZYCustomerCardExt extends "Customer Card"
{
    layout
    {
        modify("Shipment Method")
        {
            Visible = Rec."Shipment Method Visible";
        }
        addbefore("Shipment Method")
        {
            field(ShowShipmentMethod; ShipmentMethodVisible)
            {
                ApplicationArea = All;
                Caption = 'Show Shipment Method';
                Editable = false;
                trigger OnDrillDown()
                begin
                    if Rec."Shipment Method Visible" = true then
                        exit;
                    Rec."Shipment Method Visible" := true;
                    Rec.Modify(true);
                end;
            }
        }
        addafter("Shipping Agent Service Code")
        {
            field(HideShipmentMethodLbl; HideShipmentMethodLbl)
            {
                ApplicationArea = All;
                Editable = false;
                ShowCaption = false;
                Style = StrongAccent;
                StyleExpr = true;
                trigger OnDrillDown()
                begin
                    if Rec."Shipment Method Visible" = false then
                        exit;
                    Rec."Shipment Method Visible" := false;
                    Rec.Modify(true);
                end;
            }
        }
    }
    var
        ShipmentMethodVisible: Text;
        HideShipmentMethodLbl: Label 'Show less';
    trigger OnOpenPage();
    begin
        ShipmentMethodVisible := 'Show More';
    end;
}
