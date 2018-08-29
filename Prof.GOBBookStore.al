profile "GOBBookStore" 
{
    Description = 'Book Store';
    RoleCenter = "Order Processor Role Center";
    Customizations = CustomerCardCustomization, CustomerListCustomization;
}

pagecustomization CustomerCardCustomization customizes "Customer Card"
{
    layout
    {
        modify("Location Code")
        {
            Visible = false;
        }
    }
    actions
    {
        movebefore(NewSalesInvoice; NewSalesOrder)
    }
}

pagecustomization CustomerListCustomization customizes "Customer List"
{
    layout
    {
        modify("Location Code")
        {
            Visible = false;
        }
    }
    actions
    {
        movebefore(NewSalesInvoice; NewSalesOrder)
    }
}