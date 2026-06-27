public class LibraryManagement {
//method to store book repositry
//method to check books available
//method track user borrowing and which book
	Public static Map<String,String> booksList = new Map<String,String>();
    Public static Map<String,String> userList = new Map<String,String>();
    public static Map<String,String> bookRepository(Map<String,String> addNewBook,List<String> removeBooks){
        //store new book,remove book, 
        if(addNewBook != NULL && !addNewBook.isEmpty()){
           for(String newBook : addNewBook.keySet()){
            booksList.put(newBook,addNewBook.get(newBook));
        	} 
        }
        if(removeBooks !=Null && !removeBooks.isEmpty() && !booksList.isEmpty()){
            for(String removeBook : removeBooks){
                booksList.remove(removeBook);
            }
        } 
        return booksList;
    }
    
    public static Map<String,String> userBookHandler(Map<String,String> newBookEntry){
        //user should be map <user, bookname> check booklist - contains bookname before create record
        if(newBookEntry != NULL && !newBookEntry.isEmpty()){
            for(String user : newBookEntry.keySet()){
                string currentBook = newBookEntry.get(user);
                if(booksList.containsKey(currentBook)){
                    userList.put(user,currentBook);
                    //assign and remove the book from booklist
                    booksList.remove(currentBook);
                }else{
                    system.debug('book is not available right now');
                }
            }
        }
        return userList;
    }
}