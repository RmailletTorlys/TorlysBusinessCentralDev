enum 50007 TlyCustCreditWarnings
{
    Caption = 'Customer Credit Warnings';

    value(0; "Cr Limit+Open Ord / Terms")
    {
        Caption = 'Cr Limit+Open Ord / Terms';
    }

    value(1; "Cr Limit+Open Ord Only")
    {
        Caption = 'Cr Limit+Open Ord Only';
    }

    value(2; "Terms Only")
    {
        Caption = 'Terms Only';
    }

    value(3; "Cr Limit / Terms")
    {
        Caption = 'Credit Limit / Terms';
    }

    value(4; "Cr Limit Only")
    {
        Caption = 'Cr Limit Only';
    }

    value(5; "No Hold")
    {
        Caption = 'No Hold';
    }
    value(6; "Hold All")
    {
        Caption = 'Hold All';
    }
}