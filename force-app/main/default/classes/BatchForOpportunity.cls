public class BatchForOpportunity implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        string query = 'select id, stageName,AccountId,Account.ownerId from opportunity where stageName = \'Closed Won\' and LastModifiedDate = LAST_N_DAYS:7';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<Opportunity> scope){
        List<Task> taskList = new List<Task>();
        for(Opportunity opp : scope){
            Task t = new Task();
            t.OwnerId = opp.Account.ownerId;
            t.Subject='Send Congrats Message to user';
            t.ActivityDate = system.today()+7;
            t.Priority='Normal';
            t.WhatId= opp.Id;
            t.Status='In Progress';
            taskList.add(t);
        }
        if(!taskList.isEmpty()){
            insert taskList;
        }
    }
    
    public void finish(Database.BatchableContext bc){
        system.debug('Task Creation complete');
    }
}