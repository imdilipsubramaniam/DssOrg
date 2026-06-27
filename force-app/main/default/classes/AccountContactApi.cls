@RestResource(urlMapping='/AccountContactAPI')
global class AccountContactApi {
    @HttpPost
    global static void getAccountContact(){
      RestRequest req = RestContext.request;
      RestResponse res = RestContext.response;
      
        string body = req.requestBody.toString();
        JsonCls myObj = (JsonCls) Json.deserialize(body,JsonCls.class);
        
        if(myObj.isTrue){
            Account acc = new Account(Name = myObj.incomingName);
            insert acc;
        }else{
            Contact con = new Contact(LastName = myObj.incomingName);
            insert con;
        }
        
    }
   
}