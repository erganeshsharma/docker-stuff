import java.io.*;
public class App {
	public static void main(String args[]) throws Exception{
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);		
		System.out.print("Enter the number of rows : ");
		int rows = Integer.parseInt(br.readLine());

		System.out.println("Printing pyramid of stars!\n");
		int i,j,k;
		for (i=1; i<=rows; i++){
			for (j=rows; j>=i; j--)
				System.out.print(" ");
			for (k=1; k<=i; k++)
				System.out.print("* ");
			System.out.println("");
		}
		System.out.println("\n...... Done ......");
	}
}
