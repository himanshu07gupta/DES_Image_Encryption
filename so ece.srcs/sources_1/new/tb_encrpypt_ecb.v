`timescale 1ns / 1ps
 
//////////////////////////////////////////////////////////////////////////////////
 
module tb_ecb_enc;
reg [64:1] key;
//tb_ecb_enc/a
integer i;
integer f;
reg [64:1] msg[1:131072];
reg [64:1] message;
wire [64:1] ciphertext;
encrpyt_ecb a(ciphertext, message, key);
initial 
begin		
#10 $readmemb("binary.txt",msg);	
f=$fopen("encrypt_code.txt","w");
#10
for(i=1;i<=131072;i=i+1)
begin
#1 message=msg[i];
key = 64'b00010011_00110100_01010111_01111001_10011011_10111100_11011111_11110001;
$display("%b",ciphertext);  
$fwrite(f,"%b\n",ciphertext);

end 
#10 $fclose(f);

	end
	endmodule

