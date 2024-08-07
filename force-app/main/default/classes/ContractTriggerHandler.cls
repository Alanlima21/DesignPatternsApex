public with sharing class ContractTriggerHandler extends TriggerHandler {

    AccountContractEnricher accountEnricher;

    List<Contract> newContracts;
    
    Map<Id, Contract> oldContracts;

    ContractRepository contractRepository;

    ContractFilter filter;

    InactivateOriginalContractEnricher inactivateOriginalContract;

    AccountContractEnricher accountEnricher;

    public ContractTriggerHandler() {
        this ((List<Contract> ) Trigger.new, (Map<Id, Contract>) Trigger.oldMap );
    }

    public void afterInsert () {
        chWithOpenContracts();
    }

    public void afterUpdate () {
        enrichWithOpenContracts();
    }

    private void enrichWithPendingContracts () {
        accountEnricher.enrichWithTotalPendingContracts(newContracts);
    }
}