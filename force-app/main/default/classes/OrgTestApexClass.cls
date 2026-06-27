public with sharing class OrgTestApexClass {
    public static void testMethodName() {
        System.debug('Org test running hello from feature');
        System.debug('Second commit');
    }

    public static Map<String,List<String>> generateStageNameMap(){
        //create a map containing stagename and list ids only not part of closed won/lost
        List<Opportunity> oppList = [SELECT id, stagename FROM Opportunity];
        Map<String,List<String>> stageIdMap = new Map<String,List<String>>();
        for(Opportunity opp : oppList){
            if(opp.stagename != 'Closed Won' && opp.stagename != 'Closed Lost'){
                if(stageIdMap.containsKey(opp.stagename)){
                    stageIdMap.get(opp.stagename).add(opp.id);
                }else{
                    stageIdMap.put(opp.stagename,new List<String>{opp.id});
                }
            }
        }
        for (String stage : stageIdMap.keySet()) {
        System.debug('Stage: ' + stage + ' → Opportunity Ids: ' + stageIdMap.get(stage));
        }

        return stageIdMap;
        
    }


}