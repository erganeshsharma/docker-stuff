import java.io.*;
public class Main {
	public static void main(String args[]){

		System.out.println("Printing pyramid of stars!\n");
		int i,j,k;

		for (i=1; i<=10; i++){
			for (j=10; j>=i; j--)
				System.out.print(" ");
			for (k=1; k<=i; k++)
				System.out.print("* ");
			System.out.println("");
		}

		System.out.println("\n....... Done .......");
	}
}