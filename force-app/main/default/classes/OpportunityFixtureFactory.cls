@isTest
public class OpportunityFixtureFactory {

    public static Opportunity newOpportunity(Account account,PriceBook2 priceBook ) {

        return new Opportunity(
            AccountId = account.Id,
            Name = 'Test Opportunity',
            PriceBook2Id = priceBook.Id,
            CloseDate = Date.today().addDays(1),
            StageName = 'Prospecting'
        );
    }

    public static Opportunity create( Account account, PriceBook2 priceBook ) {
        return create ( newOpportunity( account, priceBook));
    }

    public static Opportunity create ( Opportunity opportunity ){
        insert opportunity;
        return opportunity;
    }

    public static Map<String,SObject> createIntegratedScenario(){
        //Aqui é o pulo do gato!
        Map<String,SObject> records = PricebookEntryFixtureFactory.createIntegratedScenario();

        Account account = AccountFixtureFactory.create ('Test Account', '111.444.777-35');
        records.put('account', account);

        PriceBook2 priceBook = (PriceBook2) records.get('priceBook');

        Opportunity opportunity = create(account, priceBook);
        records.put('opportunity', opportunity);

        Product2 product = (Product2) records.get('product');

        OpportunityLineItem opportunityLineItem = OpportunityLineItemFixtureFactory.create ( opportunity, product );
        records.put('opportunityLineItem', opportunityLineItem);
        
        return records;
    }
}