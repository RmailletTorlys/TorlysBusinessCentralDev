enum 50007 TlyCustCreditWarnings
{
    Caption = 'Customer Credit Warnings';

    value(0; "Cr Limit+Open Ord / Terms")
    {
        Caption = 'Credit Limit and Open Orders or Terms';
    }

    value(1; "Cr Limit+Open Ord Only")
    {
        Caption = 'Credit Limit and Open Orders Only';
    }

    value(2; "Terms Only")
    {
        Caption = 'Terms Only';
    }

    value(3; "Cr Limit / Terms")
    {
        Caption = 'Credit Limit or Terms';
    }

    value(4; "Cr Limit Only")
    {
        Caption = 'Credit Limit Only';
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