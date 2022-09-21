tarea:
	yosys mdio.ys
	yosys mdio16.ys

	iverilog -o contador.out modoContador_tb.v
	vvp contador.out
	gtkwave resultados.vcd

	iverilog -o contador16bits.out modo16bits_tb.v
	vvp contador16bits.out
	gtkwave resultados16.vcd