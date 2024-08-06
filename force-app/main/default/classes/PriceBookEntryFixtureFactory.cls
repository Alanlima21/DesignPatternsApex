@isTest
public class PriceBookEntryFixtureFactory {

    public static PriceBookEntry create (PriceBook2 priceBook, Product2 product ) {
        return create ( newPricebookEntry (priceBook , product));
    }

    public static PriceBookEntry create (PriceBookEntry priceBookEntry) {
        insert priceBookEntry;
        return priceBookEntry;
    }

    public static PriceBookEntry newPricebookEntry(PriceBook2 priceBook, Product2 product) {
        return new PriceBookEntry(
            PriceBook2Id = priceBook.Id,
            Product2Id = product.Id,
            UnitPrice = 1.0,
            IsActive = true
        );
    }

    public static Map<String,SObject> createIntegratedScenario() {
        Map<String,SObject> records = new Map<String,SObject>();

        Product2 product = ProductFixtureFactory.create('Test Product');
        records.put('product', product);

        PriceBook2 priceBook = PriceBookFixtureFactory.getStandardPricebook();
        records.put('priceBook', priceBook);

        PriceBookEntry priceBookEntry = create (priceBook, product);
        records.put('priceBookEntry', priceBookEntry);

        return records;
    }
}