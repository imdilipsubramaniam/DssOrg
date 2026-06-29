public with sharing class TotalValueOfAccount {
    public TotalValueOfAccount() {

    }

    public static void opportunityValue(List<Id> oppIdList){
        Set<Id> accIds = new Set<Id>();
        for(Opportunity opp : [SELECT AccountId FROM Opportunity WHERE Id IN : oppIdList AND AccountId != NUll]){
            accIds.add(opp.AccountId);
        }

        //query related acc value using agg and populate a map and return it
        Map<Id,Decimal> accountValueMap = new Map<Id,Decimal>();
        for(AggregateResult ar : [
            SELECT AccountId, Sum(Amount) totalValue
            FROM Opportunity WHERE AccountId IN : accIds 
            GROUP BY AccountId ORDER BY Sum(Amount) desc]){
                                        
                Id accountId = (Id) ar.get('AccountId');
                Decimal totalValue = (Decimal) ar.get('totalValue');
                accountValueMap.put(accountId,totalValue);
            }
        
        for(Id i : accountValueMap.keySet()){
            System.debug('AccountId :' +i+ ' Total Value : ' +accountValueMap.get(i));
        }
    }
}