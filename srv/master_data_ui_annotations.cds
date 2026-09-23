using ERPService from './schema_srv';

annotate ERPService.Warehouses with @(

    // =========================================================
    // 1. FILTER BAR
    // =========================================================
    UI.SelectionFields      : [
        name,
        warehouseCode,
        state,
        country
    ],


    // =========================================================
    // 2. LIST REPORT TABLE
    // =========================================================
    UI.LineItem             : [
        {
            $Type: 'UI.DataField',
            Value: ID,
            Label: 'WareHouse ID'
        },
        {
            $Type: 'UI.DataField',
            Value: name,
            Label: 'WareHouse Location'
        },
        {
            $Type: 'UI.DataField',
            Value: warehouseCode,
            Label: 'WareHouse Code'
        }

    ],

    UI.HeaderInfo           : {
        TypeName      : 'WareHouse  Overview',
        TypeNamePlural: 'WareHouses',
        Title         : {
            $Type: 'UI.DataField',
            Value: name
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: warehouseCode
        }
    },


    UI.Facets               : [
                               // Employee Information
                              {
        $Type : 'UI.ReferenceFacet',
        Label : 'WareHouse Information',
        Target: '@UI.FieldGroup#WareHouse'
    }],


    UI.FieldGroup #WareHouse: {Data: [

        {
            $Type: 'UI.DataField',
            Label: 'WareHouse ID',
            Value: ID
        },
        {
            $Type: 'UI.DataField',
            Label: 'WareHouse Name',
            Value: name
        },
        {
            $Type: 'UI.DataField',
            Label: 'WareHouse Code',
            Value: warehouseCode
        },
        {
            $Type: 'UI.DataField',
            Label: 'Address',
            Value: address
        },
        {
            $Type: 'UI.DataField',
            Label: 'City',
            Value: city
        },
        {
            $Type: 'UI.DataField',
            Label: 'State',
            Value: state
        },
        {
            $Type: 'UI.DataField',
            Label: 'Country',
            Value: country
        }
    ]}

);

annotate ERPService.Customers with @(
    UI.SelectionFields    : [customerNo],


    // =========================================================
    // 2. LIST REPORT TABLE
    // =========================================================
    UI.LineItem           : [
        {
            $Type: 'UI.DataField',
            Value: ID,
            Label: 'Customer ID'
        },
        {
            $Type: 'UI.DataField',
            Value: name,
            Label: 'Customer Name'
        },
        {
            $Type: 'UI.DataField',
            Value: customerNo,
            Label: 'Customer Number'
        },
        {
            $Type: 'UI.DataField',
            Value: status,
            Label: 'Status'
        }
    ],

    UI.HeaderInfo         : {
        TypeName      : 'Customer Overview',
        TypeNamePlural: 'Customers',
        Title         : {
            $Type: 'UI.DataField',
            Value: name
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: customerNo
        }
    },


    UI.Facets             : [
                             // Employee Information
                            {
        $Type : 'UI.ReferenceFacet',
        Label : 'Customer Detail',
        Target: '@UI.FieldGroup#CustDet'
    }],


    UI.FieldGroup #CustDet: {Data: [

        {
            $Type: 'UI.DataField',
            Label: ' Email ',
            Value: email
        },
        {
            $Type: 'UI.DataField',
            Label: 'Contact Number',
            Value: phone
        },
        {
            $Type: 'UI.DataField',
            Label: 'Address',
            Value: address
        },
        {
            $Type: 'UI.DataField',
            Label: 'City',
            Value: city
        },
        {
            $Type: 'UI.DataField',
            Label: 'State',
            Value: state
        },
        {
            $Type: 'UI.DataField',
            Label: 'Country',
            Value: country
        },
        {
            $Type: 'UI.DataField',
            Label: 'Postal Code',
            Value: postalCode
        }
    ]}


);

annotate ERPService.Products with @(
    UI.SelectionFields    : [name],

    UI.LineItem           : [
        {
            $Type: 'UI.DataField',
            Value: ID,
            Label: 'Product ID'
        },
        {
            $Type: 'UI.DataField',
            Value: name,
            Label: 'Product Name'
        },
        {
            $Type: 'UI.DataField',
            Value: productCode,
            Label: 'Product Code'
        },
        {
            $Type: 'UI.DataField',
            Value: isActive,
            Label: 'Status'
        },
    ],


    UI.HeaderInfo         : {
        TypeName      : 'Product Overview',
        TypeNamePlural: 'Products',
        Title         : {
            $Type: 'UI.DataField',
            Value: name
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: ID
        }
    },

    UI.Facets             : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Product Detail',
            Target: '@UI.FieldGroup#ProdDet'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Inventory',
            Target: 'inventory/@UI.LineItem'
        }

    ],

    UI.FieldGroup #ProdDet: {Data: [

        {
            $Type: 'UI.DataField',
            Label: ' Product Code ',
            Value: productCode
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: description
        },
        {
            $Type: 'UI.DataField',
            Label: 'Unit',
            Value: unit
        },
        {
            $Type: 'UI.DataField',
            Label: 'Cost Price',
            Value: costPrice
        },
        {
            $Type: 'UI.DataField',
            Label: 'Selling Price',
            Value: sellingPrice
        },
        {
            $Type: 'UI.DataField',
            Label: 'Level',
            Value: reorderLevel
        },
        {
            $Type: 'UI.DataField',
            Label: 'Active',
            Value: isActive
        }
    ]}

);


annotate ERPService.Inventory with @(
    UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: ID,
        Label: 'Inventory ID'
    },
    {
        $Type: 'UI.DataField',
        Value: quantity,
        Label: 'Quantity'
    },
    {
        $Type: 'UI.DataField',
        Value: availableQty,
        Label: 'Available Quantity'
    },
    {
        $Type: 'UI.DataField',
        Value: reservedQty,
        Label: 'Reserved Quantity'
    }
    
],
UI.HeaderInfo         : {
        TypeName      : 'Inventory Overview',
        TypeNamePlural: 'Inventory',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID
        }
    }


);


