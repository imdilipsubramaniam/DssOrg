public class CountOnVowels {
	//method taking list of strings, each string vowel count returned as a list itself
    static List<String> vowels = new List<String>{'a','e','i','o','u'};
    string var1 = 'abc';
	static string var2 = 'def';    
    public static List<integer> countVowels(List<String> checkVowels){
        List<integer> vowelCountList = new List<Integer>();
        for(String checkVowel : checkVowels){
            Integer vowelCount = checkVowel.toLowerCase().countMatches(vowels[0])+
            checkVowel.toLowerCase().countMatches(vowels[1])+
            checkVowel.toLowerCase().countMatches(vowels[2])+
            checkVowel.toLowerCase().countMatches(vowels[3])+
            checkVowel.toLowerCase().countMatches(vowels[4]);
            //system.debug(vowelCount);
            vowelCountList.add(vowelCount);
            
        }
        return vowelCountList;
    }
    
    public static void simpleCheck(){
        system.debug(new CountOnVowels().var1);
        system.debug(var2);
    }
    
}