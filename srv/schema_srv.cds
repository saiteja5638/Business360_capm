using schema from '../db/schema';

@path: '/erp'
service ERPService {

    // ============================================================
    // MASTER DATA
    // ============================================================

    @odata.draft.enabled
    entity Customers          as projection on schema.Customers;

    @odata.draft.enabled
    entity Suppliers          as projection on schema.Suppliers;

    @odata.draft.enabled
    entity Categories         as projection on schema.Categories;

    @odata.draft.enabled
    entity Products           as projection on schema.Products;

    @odata.draft.enabled
    entity Warehouses         as projection on schema.Warehouses;


    // ============================================================
    // INVENTORY
    // ============================================================

    @readonly
    entity Inventory          as projection on schema.Inventory;

    @readonly
    entity StockMovements     as projection on schema.StockMovements;


    // ============================================================
    // SALES
    // ============================================================

    entity SalesOrders        as projection on schema.SalesOrders;

    entity SalesOrderItems    as projection on schema.SalesOrderItems;


    // ============================================================
    // PURCHASE
    // ============================================================

    entity PurchaseOrders     as projection on schema.PurchaseOrders;

    entity PurchaseOrderItems as projection on schema.PurchaseOrderItems;


    entity Employees1         as projection on schema.Employees1;
    entity Departments        as projection on schema.Departments;
}