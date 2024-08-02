trigger Account on Account (before insert, before update) {
    
    List<Account> newAccounts = Trigger.new;
    AccountValidator validator = new AccountValidator ();
    
    switch on Trigger.operationType {
        when BEFORE_INSERT, BEFORE_UPDATE {
            validator.validate (newAccounts);
        }
    }
}