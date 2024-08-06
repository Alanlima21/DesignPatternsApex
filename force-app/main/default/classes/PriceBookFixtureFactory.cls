@isTest
public class PriceBookFixtureFactory {
    
    public static PriceBook2 getStandardPricebook() {
        return new PriceBook2 (
            Id = Test.getStandardPriceBookId(),
            IsActive = true 
        );
    }
}