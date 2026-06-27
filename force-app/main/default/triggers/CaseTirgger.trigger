trigger CaseTirgger on Case (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        List<Case> caseRecs = new List<Case>();
        for(Case c : Trigger.new){
            if(c.Status == 'Escalated' && Trigger.oldMap.get(c.Id).Status != 'Escalated'){
                caseRecs.add(c);
            }
         }
        if(!caseRecs.isEmpty()){
            system.enqueueJob(new CaseQueueableContext(caseRecs));
		}
    }
}