enum 50007 "Torlys Cust. Cr.Warnings"
{
    Caption = 'TORLYS Customer Credit Warnings';

    value(0; "Cr Limit + Open Orders / Terms")
    {
        Caption = 'Credit Limit and Open Orders or Terms';
    }

    value(1; "Cr Limit + Open Orders")
    {
        Caption = 'Credit Limit and Open Orders Only';
    }

    value(2; "Terms")
    {
        Caption = 'Terms Only';
    }

    value(3; "Cr Limit / Terms")
    {
        Caption = 'Credit Limit or Terms';
    }

    value(4; "Cr Limit")
    {
        Caption = 'Credit Limit Only';
    }
}