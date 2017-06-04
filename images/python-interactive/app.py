def pyramid(rows):
	print("Printing pyramid of stars!\n")
	for i in range(1, rows+1):
		for j in range(rows+1, i, -1):
			print(" ",end="")			
		for k in range (1, i+1):
			print("* ",end="")
		print("")
	print("\n...... Done ......")

rows = int(input("Enter the number of rows : "))
pyramid(rows)

