module tb_BK256_ver1;



  reg [255:0] A, B;

  reg Ci;

  reg clk;

  reg rst_n;

  wire Co;

  wire [255:0] S;

  

  BK256_ver1 bk256 (
	.A(A),
        .B(B),
	.Ci(Ci),
	.clk(clk),
	.rst_n(rst_n),
 	.Co(Co),
	.S(S)
);	

  initial begin
	$fsdbDumpfile("tb_BK256_ver1.fsdb");
	$fsdbDumpvars(0,tb_BK256_ver1);

  end
  initial begin
  	forever #5 clk=~clk;
  end
  initial begin
	// $shm_open("wave.shm");

	A=0;
	B=0;
	Ci=0;
        clk=0;
        rst_n=0;
	#200;
  end
 

  initial begin
	rst_n=1;
	#100;
	
	A=256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	B=256'h1;
	Ci=0;
	#200;
	rst_n=0;
	#200;
	rst_n=1;
	A=256'hBBBB;
	B=256'h7A;
	#200
	rst_n=0;
	#50;
	$finish;
  end



endmodule

