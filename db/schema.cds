using { cuid, managed } from '@sap/cds/common';

context schema {

    // ============================================================
    // MASTER DATA
    // ============================================================

    entity Customers : cuid, managed {

        customerNo      : String(20) @assert.unique;
        name            : String(100) not null;
        email           : String(255);
        phone           : String(20);

        address         : String(255);
        city            : String(100);
        state           : String(100);
        country         : String(100);
        postalCode      : String(20);

        status          : String(20) default 'ACTIVE';

        salesOrders     : Association to many SalesOrders
                            on salesOrders.customer = $self;
    }

    entity Departments {
        key ID        : Integer;
            name      : String;

            employees : Association to many Employees1 on employees.department = $self;
    }

    entity Employees1 {
        key ID         : Integer;
            name       : String;
            department : Association to  Departments;
    }


    entity Suppliers : cuid, managed {

        supplierNo      : String(20) @assert.unique;
        name            : String(100) not null;

        email           : String(255);
        phone           : String(20);

        address         : String(255);
        city            : String(100);
        state           : String(100);
        country         : String(100);
        postalCode      : String(20);

        status          : String(20) default 'ACTIVE';

        purchaseOrders  : Association to many PurchaseOrders
                            on purchaseOrders.supplier = $self;
    }


    entity Categories : cuid, managed {

        categoryCode    : String(20) @assert.unique;
        name            : String(100) not null;
        description     : String(255);

        products        : Association to many Products
                            on products.category = $self;
    }


    entity Products : cuid, managed {

        productCode     : String(30) @assert.unique;
        name            : String(100) not null;
        description     : String(500);

        category        : Association to Categories;

        unit            : String(20);
        costPrice       : Decimal(15,2);
        sellingPrice    : Decimal(15,2);

        reorderLevel    : Decimal(15,2) default 0;
        isActive        : Boolean default true;

        inventory       : Association to many Inventory
                            on inventory.product = $self;
    }


    // ============================================================
    // WAREHOUSE / INVENTORY
    // ============================================================

    entity Warehouses : cuid, managed {

        warehouseCode   : String(20) @assert.unique;
        name            : String(100) not null;

        address         : String(255);
        city            : String(100);
        state           : String(100);
        country         : String(100);

        inventory       : Association to many Inventory
                            on inventory.warehouse = $self;
    }


    entity Inventory : cuid, managed {

        product         : Association to Products not null;
        warehouse       : Association to Warehouses not null;

        quantity        : Decimal(15,2) default 0;
        reservedQty     : Decimal(15,2) default 0;

        availableQty    : Decimal(15,2);

        lastUpdated     : Timestamp;
    }


    // ============================================================
    // SALES
    // ============================================================

    entity SalesOrders : cuid, managed {

        orderNo         : String(30) @assert.unique;

        customer        : Association to Customers not null;

        orderDate       : Date not null;

        status          : String(30) default 'DRAFT';

        currency        : String(3) default 'INR';

        totalAmount     : Decimal(15,2) default 0;

        items           : Composition of many SalesOrderItems
                            on items.order = $self;
    }


    entity SalesOrderItems : cuid {

        order           : Association to SalesOrders not null;

        product         : Association to Products not null;

        quantity        : Decimal(15,2) not null;

        unitPrice       : Decimal(15,2) not null;

        discount        : Decimal(15,2) default 0;

        totalAmount     : Decimal(15,2);
    }


    // ============================================================
    // PURCHASE
    // ============================================================

    entity PurchaseOrders : cuid, managed {

        purchaseNo      : String(30) @assert.unique;

        supplier        : Association to Suppliers not null;

        orderDate       : Date not null;

        status          : String(30) default 'DRAFT';

        currency        : String(3) default 'INR';

        totalAmount     : Decimal(15,2) default 0;

        items           : Composition of many PurchaseOrderItems
                            on items.order = $self;
    }


    entity PurchaseOrderItems : cuid {

        order           : Association to PurchaseOrders not null;

        product         : Association to Products not null;

        quantity        : Decimal(15,2) not null;

        unitPrice       : Decimal(15,2) not null;

        discount        : Decimal(15,2) default 0;

        totalAmount     : Decimal(15,2);
    }


    // ============================================================
    // INVENTORY MOVEMENT
    // ============================================================

    entity StockMovements : cuid, managed {

        product         : Association to Products not null;

        warehouse       : Association to Warehouses not null;

        movementType    : String(30) not null;
        // RECEIPT
        // ISSUE
        // TRANSFER
        // ADJUSTMENT
        // RESERVATION
        // RELEASE

        quantity        : Decimal(15,2) not null;

        referenceType   : String(50);
        referenceId     : UUID;

        movementDate    : Timestamp;

        remarks         : String(255);
    }
}