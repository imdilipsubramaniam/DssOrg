trigger AccountTrigger on Account (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        AccountTriggerHandler.accountTriggerContactUpdate(Trigger.new,Trigger.oldMap);
    }
}