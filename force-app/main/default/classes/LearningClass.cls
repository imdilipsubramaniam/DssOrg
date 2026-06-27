public class LearningClass {
    public static Schema.SObjectType checkObjectType(SObject detail){
        return detail.getSObjectType();
    }
}