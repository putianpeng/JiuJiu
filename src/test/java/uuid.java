import java.util.Date;
import java.util.UUID;

public class uuid {
	public static void main(String[] args) {
		for(int i=0;i<10;i++) {
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString().replaceAll("-",""));
			System.out.println(uuid.toString().replaceAll("-","").length());
		}
		
	}
}
