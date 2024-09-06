tableextension 50117 TorlysCustomer extends Customer
{
    fields
    {
        field(50118; "Collector ID"; code[20])
        {
            Caption = 'Collector ID';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = ToBeClassified;

        }
    }

}