public class TravelManager {
	//method to store travel journey
	//method for wishlist [to travel]
	//method to tell which countires visited in part. year
	//how many times visited a particular country
	//year - key, country list of string, -  
	public static Map<integer,List<String>> countriesVisitedInYear = new Map<integer,List<String>>();
    
    public static Map<integer,List<String>> travelJourneyHandler(integer yearOfTravel, string country){
        List<string> countryList = new List<String>();
        if(countriesVisitedInYear.containsKey(yearOfTravel)){
            countryList = countriesVisitedInYear.get(yearOfTravel);
            countryList.add(country);
            countriesVisitedInYear.put(yearOfTravel,countryList);
        }else{
            countriesVisitedInYear.put(yearOfTravel,new List<string>{country});
        }
   		return countriesVisitedInYear;
    }
    
    //method to tell which countires visited in part. year 
    public static List<String> yearwiseVisits (integer yearOfTravel){
        List<String> visitedCountires = countriesVisitedInYear.get(yearOfTravel);
        return visitedCountires;
    }
    
    public static Integer countOfCountriesVisit (string countryToCheck){
        integer countOnVisit = 0;
        List<List<string>> countriesOnlyList = countriesVisitedInYear.values();
        for(List<string> countries : countriesOnlyList){
            for(string country : countries){
                if(country == countryToCheck){
                    countOnVisit++;
                }
                 //system.debug(country);
            }
           
        }
        
        return countOnVisit;
    }
}