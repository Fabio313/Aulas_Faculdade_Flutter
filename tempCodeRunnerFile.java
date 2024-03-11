public class Singleton {
    
	private static Singleton instance;
    public String teste;

    private Singleton(String teste) {
    	this.teste = teste;
    }
      						  

    public synchronized static Singleton getInstance(String teste) {
        if (instance == null) {
            instance = new Singleton(teste);
        }
        return instance;
    }

}

public class Ex1 {

	public static void main(String[] args) {
        
        Singleton Singleton1 = Singleton.getInstance("CACHORRO LATE");
        Singleton Singleton2 = Singleton.getInstance("GATO MIA");
        System.out.println(Singleton1.teste);
        System.out.println(Singleton2.teste);

	}

}
