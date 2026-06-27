public class CaseQueueableContext implements Queueable {
    private List<Case> caseRecs ;
    
    public CaseQueueableContext(List<Case> caseRec){
        this.caseRecs = caseRec;
    }
    
    public void execute(QueueableContext context){
      
        List<Task> newTasks = new List<Task>();
        if(!caseRecs.isEmpty()){
            for(Case c : caseRecs){
                Task t = new Task();
                t.OwnerId = c.OwnerId;
                t.Status = 'Not Started';
                t.Subject = 'Case escalated';
                t.Priority ='High';
                t.WhatId = c.Id;
                t.ActivityDate= system.today()+30;
                newTasks.add(t);
            }
        }
        if(!newTasks.isEmpty()){
            insert newTasks;
        }
    }
}