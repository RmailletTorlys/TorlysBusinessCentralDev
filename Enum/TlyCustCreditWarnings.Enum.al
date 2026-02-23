enum 50007 TlyCustCreditWarnings
{
    Caption = 'Customer Credit Warnings';

    value(0; "Credit Limit + Open Orders or Terms")
    {
        Caption = 'Credit Limit + Open Orders or Terms';
    }

    value(1; "Credit Limit + Open Orders")
    {
        Caption = 'Credit Limit + Open Orders';
    }

    value(2; "Terms")
    {
        Caption = 'Terms';
    }

    value(3; "Credit Limit or Terms")
    {
        Caption = 'Credit Limit or Terms';
    }

    value(4; "Credit Limit")
    {
        Caption = 'Credit Limit';
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