public without sharing class AccountTriggerHandler{
    public AccountTriggerHelper helper;
    public Boolean isFirstTime=true;
    public AccountTriggerHandler() {
        this.helper = new AccountTriggerHelper();
    }

    public void beforeInsert(List<Account> newAccounts) {
        System.debug('beforeInsert');
        helper.method1();
    }
    public void beforeUpdate(List<Account> newAccounts, List<Account> oldAccounts, Map<Id,Account> newAccountsMap, Map<Id,Account> oldAccountsMap) {
        System.debug('beforeUpdate');
        helper.method2();
    }
}