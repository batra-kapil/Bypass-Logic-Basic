trigger AccountTrigger on Account (before insert, before update) {
    if (BypassUtils.isGlobalBypassEnabled('Bypass_Triggers__c') || 
        BypassUtils.isSpecificAutomationBypassed('AccountTrigger')) {
            System.debug('Bypassed');
        return; // Exit if bypass is enabled
    }

    // Your trigger logic here
    AccountTriggerHandler handler = new AccountTriggerHandler();
    if(handler.isFirstTime)
    {
        handler.isFirstTime = false;
        switch on Trigger.operationType {
            when BEFORE_INSERT {
                handler.beforeInsert(Trigger.New);
            }
            when BEFORE_UPDATE {
                handler.beforeUpdate(Trigger.New,Trigger.Old, Trigger.newMap, Trigger.oldMap);
            }
        }
    }
}
