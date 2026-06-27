public class PasswordAttemptCheck1 {
     Static Integer attemptCount = 0;
     Static String profilePassword = 'QWERTY@218';
    

    public static void passwordAttempt(String password){
        if(attemptCount > 3){
            system.debug('Your exceeded the password attempt please try after sometime');
            return;
        }
        if(password == profilePassword){
            system.debug('Successfully logged in');
            attemptCount = 0;
            system.debug(attemptCount);
            
        }else{
            attemptCount++;
            system.debug('Please enter correct password'+attemptCount);
        }
        
       
    }
    
    public static Integer newLearningLogs2(Map<string,boolean> weeklyLogs){
        Integer logCount =0;
        for(string weekLog : weeklyLogs.keySet()){
            if(weeklyLogs.get(weekLog)){
                logCount++;
            }
        }
        return logCount;
    }
    
    Public static Integer countOnWord3(List<String> incomingList){
        Integer totalCount = 0;
        /*for(Integer i=0; i<incomingList.size();i++){
            if(incomingList.get(i)=='MakesSense'){
                totalCount++;
            }
        }*/
        for(String incoming : incomingList){
            if(incoming.contains('MakesSense')){
                totalCount++;
            }
        }
        
        return totalCount;
    }
    
    public static Map<string,integer> marksInformation(Map<string,integer> marksInfo){
        Map<string,integer> highLowMarks = new Map<string,integer>();
        integer highMarks =0;
        integer lowMarks =0;
        string highSubject = '';
        string lowSubject= '';
        for(String subject : marksInfo.keySet()){
            integer currnetMark = marksInfo.get(subject);
            if(lowMarks == 0){
                lowMarks = currnetMark;
            }
            if(currnetMark>highMarks){ //70 
                highMarks = currnetMark;
                system.debug('high Sub'+subject);
                highSubject = subject;
            }
            if(currnetMark<=lowMarks){
                lowMarks = currnetMark;
                system.debug('low Sub'+subject);
                lowSubject = subject;
            }
        }
        system.debug(highSubject);
        system.debug(lowSubject);
        highLowMarks.put(highSubject,marksInfo.get(highSubject));
        highLowMarks.put(lowSubject,marksInfo.get(lowSubject));
        
        return highLowMarks;
    }
    
    //to do list - add and remove what need to do and what are done
    //map? string,bool or List? indexed but cannot mark what is done
    //so map it is-> add new list , remove - pass param- multiple (add,remove,done)
    //add new- put, remove loop and remove, done - bool set 
    public static Map<String,boolean> toDoList(list<string> addToList, list<string> removeFromList,Map<string,boolean> updateList){
        Map<String,boolean> toDoListMap = new Map<String,boolean>();
        if(addToList != null && !addToList.isEmpty()){
            for(string toList : addToList){
                toDoListMap.put(toList, false);
            }
        }
        if(removeFromList != null && !removeFromList.isEmpty()){
            for (string toDelete : removeFromList){
                toDoListMap.remove(toDelete);
            }
        }
        
        if(updateList != null && !updateList.isEmpty()){
            for(String toUpdate : updateList.keySet()){
                toDoListMap.put(toUpdate,updateList.get(toUpdate));
            }
        }
        
        return toDoListMap;
    }
}