tableextension 51665 TlyNTNInventoryAvailability extends "NTN Inventory Availability"
{
    fields
    {
        //     field(50001; "WebInventoryBucket1"; Decimal)
        // {
        //     DataClassification = CustomerContent;
        //     Description = 'This was the field created by DVP. But we have since changed to the v2 buckets.';
        // }

        // field(50002; "WebInventoryBucket2"; Decimal)
        // {
        //     DataClassification = CustomerContent;
        //     Description = 'This was the field created by DVP. But we have since changed to the v2 buckets.';
        // }

        // field(50003; "WebInventoryBucket3"; Decimal)
        // {
        //     DataClassification = CustomerContent;
        //     Description = 'This was the field created by DVP. But we have since changed to the v2 buckets.';
        // }

        // field(50004; "WebInventoryBucket4"; Decimal)
        // {
        //     DataClassification = CustomerContent;
        //     Description = 'This was the field created by DVP. But we have since changed to the v2 buckets.';
        // }

        // field(50005; "WebInventoryBucket5"; Decimal)
        // {
        //     DataClassification = CustomerContent;
        //     Description = 'This was the field created by DVP. But we have since changed to the v2 buckets.';
        // }

        field(50006; "Bucket1v2Qty"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'New inventory grid fields.';
            Caption = 'Bucket 1 Qty';
        }

        field(50007; "Bucket1v2Date"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'New inventory grid fields.';
            ObsoleteState = Removed;
            ObsoleteReason = 'wrong data type, should have been date';
        }

        field(50008; "Bucket2v2Qty"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'New inventory grid fields.';
            Caption = 'Bucket 2 Qty';
        }

        field(50009; "Bucket2v2Date"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'New inventory grid fields.';
            ObsoleteState = Removed;
            ObsoleteReason = 'wrong data type, should have been date';
        }

        field(50010; "Bucket3v2Qty"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'New inventory grid fields.';
            Caption = 'Bucket 3 Qty';
        }

        field(50011; "Bucket3v2Date"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'New inventory grid fields.';
            ObsoleteState = Removed;
            ObsoleteReason = 'wrong data type, should have been date';
        }

        field(50012; "Bucket4v2Qty"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'New inventory grid fields.';
            Caption = 'Bucket 4 Qty';
        }

        field(50013; "Bucket4v2Date"; Decimal)
        {
            DataClassification = CustomerContent;
            Description = 'New inventory grid fields.';
            ObsoleteState = Removed;
            ObsoleteReason = 'wrong data type, should have been date';
        }

        field(50014; "Bucket1v2Date1"; Date)
        {
            DataClassification = CustomerContent;
            Description = 'New inventory grid fields.';
            Caption = 'Bucket 1 Date';
        }

        field(50015; "Bucket2v2Date1"; Date)
        {
            DataClassification = CustomerContent;
            Description = 'New inventory grid fields.';
            Caption = 'Bucket 2 Date';
        }

        field(50016; "Bucket3v2Date1"; Date)
        {
            DataClassification = CustomerContent;
            Description = 'New inventory grid fields.';
            Caption = 'Bucket 3 Date';
        }

        field(50017; "Bucket4v2Date1"; Date)
        {
            DataClassification = CustomerContent;
            Description = 'New inventory grid fields.';
            Caption = 'Bucket 4 Date';
        }
    }
}