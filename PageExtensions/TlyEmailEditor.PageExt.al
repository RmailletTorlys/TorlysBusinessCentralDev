pageextension 50013 TlyEmailEditor extends "Email Editor"
{
    layout
    {
        modify(CcField)
        {
            Importance = Standard;
        }
        modify(BccField)
        {
            Importance = Standard;
        }
    }
}
