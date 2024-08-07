public class ContractRepository  extends AbstractRepository {
   
    public List<AggregateResult> findTotalOfPendingContracts (List<String> accountIds ) {
        return [ SELECT COUNT (Id) total, AccountId
            FROM Contract
            WHERE AccountId IN :accountIds
            AND Status NOT IN ('Assinado', 'Inativado')
            GROUP BY AccountId];
    }
    
    
    public List<Contract> findByIds(List<String> ids){

        return [SELECT Id, Status
                FROM Contract
                WHERE Id IN: ids ];
    }

    public List<Contract> findByAccountAndStatus(String accountId, String status){

        return [SELECT Id, Status
                FROM Contract
                WHERE AccountId =: accountId
                AND Status =: status];
    }
}