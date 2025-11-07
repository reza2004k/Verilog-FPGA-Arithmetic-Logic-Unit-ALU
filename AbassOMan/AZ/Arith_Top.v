`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		VRU	
// Engineer: 	
// 
// Create Date:    11:39:22 10/10/2017 
// Design Name: 
// Module Name:    Top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Top(
    input i_CLK,
    output o_PSCLK,
    output o_LEDData,
    output o_LEDLatch,
    output o_DIPLatch,
    input i_DIPData,
    output o_SEGData,
    output o_SEGLatch,
    output o_LCDData,
    output o_LCDLatch,
    output o_Eth_RST,
    input i_Eth_INT,
    output o_Eth_CS,
    output o_Eth_RD,
    output o_Eth_WR,
    output o_USB_SLOE,
    inout io_USB_IFCLK,
    output o_USB_SLRD,
    output o_USB_SLWR,
    inout [7:0] io_Data,
    inout [9:0] io_MuxEthUSB,
    output o_VGA_blue0,
    output o_VGA_blue1,
    output o_VGA_green0,
    output o_VGA_green1,
    output o_VGA_red0,
    output o_VGA_red1,
    output o_VGA_vsync,
    output o_VGA_hsync,
    input i_SW1,
    input i_SW2,
    input i_SW3,
    input i_SW4,
    output o_TXD1,
    input i_RXD1,
    output o_TXD2,
    input i_RXD2,
    output o_MMC_SCK,
    input i_MMC_DO,
    output o_MMC_DI,
    output o_MMC_CS,
    input i_SYS_RESET
    );


//////////////////////////////////////

//assign o_PSCLK = 1'bz;
//assign o_LEDData = 1'bz;
//assign o_LEDLatch = 1'bz;
//assign o_DIPLatch = 1'bz;

//assign o_SEGData = 1'bz;
//assign o_SEGLatch = 1'bz;
//assign o_LCDData = 1'bz;
//assign o_LCDLatch = 1'bz;

assign o_MMC_SCK	= 1'bz;

assign o_MMC_DI = 1'bz;
assign o_MMC_CS = 1'bz;

assign o_VGA_blue0 = 1'bz;
assign o_VGA_blue1 = 1'bz;
assign o_VGA_green0 = 1'bz;
assign o_VGA_green1 = 1'bz;
assign o_VGA_red0 = 1'bz;
assign o_VGA_red1 = 1'bz;
assign o_VGA_vsync = 1'bz;
assign o_VGA_hsync = 1'bz;

assign o_Eth_RST = 1'bz;

assign o_Eth_CS = 1'bz;
assign o_Eth_RD = 1'bz;
assign o_Eth_WR = 1'bz;
assign o_USB_SLOE = 1'bz;
assign io_USB_IFCLK = 1'bz;
assign o_USB_SLRD = 1'bz;
assign o_USB_SLWR = 1'bz;
assign io_Data = 8'bz;
assign io_MuxEthUSB = 10'bz;
assign o_TXD1 = 1'bz;
assign o_TXD2 = 1'bz;
assign o_SEGData = 1'bz;
assign o_SEGLatch = 1'bz;
assign o_LCDData = 1'bz;
assign o_LCDLatch = 1'bz;



//clock
wire CLK_OUT5,CLK_OUT20,CLK_OUT50,CLK_OUT100;

 
assign o_PSCLK = ~CLK_OUT5;
assign o_LEDData = o_data;
assign o_LEDLatch = latch;
assign o_DIPLatch = latch_DIP;


//LED_Drive
reg [15:0] i_data=16'b1110001110001100;
wire o_data;
wire latch;



//DIP_Drive
wire [15:0] o_data_DIP;
wire latch_DIP;
wire [4:0] pb;


//Debounce
wire out;
reg [15:0] R=16'd0;


//Seven_segment
reg [15:0] s=16'b0111111100000000;
assign o_SEGData = o_data_seg;
assign o_SEGLatch = latch_seg;

//LCD
assign o_LCDData = o_data_seg;
assign o_LCDLatch = latch_seg;


//transition carry FA_8
reg [7:0] m=8'b10110011;
reg [7:0] n=8'b01101101;
reg ci=1'b1;
wire [7:0] sumt;
wire couto;

//pridection carry FA_8
reg [7:0] A=8'b00000000;
reg [7:0] B=8'b00000000;
reg Cin=1'b1;
wire [7:0] Sum;
wire Cout;


//Seven_segment_abass_saz
wire [3:0] s1,s2,s3,s4;
reg [3:0] sd;
wire [6:0] sw;
reg [1:0] cf=2'b00; 
reg [10:0]cfw = 11'd0;


//RAM_20KB
reg [19:0] in=20'b0000_0000_0000_0000_0000;
reg [9:0] add=10'd0;
reg rd=1'b0;
reg wr=1'b0;
reg rst=1'b1;
wire [19:0] out_ram;



//MUL_shift
reg [7:0] b=8'b00000010;
reg [7:0] q=8'b00000101;
wire [15:0] final;



//MUL_array
reg [7:0] x;
reg [7:0] y;
wire [15:0] f;


//MUL_booth
wire [15:0] final_booth;


//Divide_8_4
reg [7:0] maghsoom;
reg [3:0] maghsoom_elaih;
wire [7:0] rem;
wire [7:0] quo;


//sender_receiver
wire [15:0] data_out;
wire accept;
wire valid;
wire [15:0] o_send;


//counter_ram_alu
wire [9:0] o_counter;


//alu_counter_ram
wire [7:0] o_alu;


//CPU_Pip
wire [19:0] ans_cpu;


//reg_10
reg [9:0] oo_reg10=10'd0;
wire [9:0] out_reg10;

//reg_20
wire [19:0] out_reg20;


clock clk(
    .CLK_IN(i_CLK),     
    .CLK_OUT5(CLK_OUT5),     
    .CLK_OUT20(CLK_OUT20),     
    .CLK_OUT50(CLK_OUT50),     
    .CLK_OUT100(CLK_OUT100)); 


LED_Drive LED_Drive (
    .i_data({out_ram[19:16],4'd0,o_alu}), 
    .clk(CLK_OUT5), 
    .o_data(o_data), 
    .latch(latch)
    );



DIP_Drive DIP_Drive (
    .i_data(i_DIPData), 
    .clk(CLK_OUT5), 
    .o_data(o_data_DIP), 
    .latch(latch_DIP),
	 .push_b(pb)
    );



Debounce Debounce (
    .pb(pb[0]), 
    .clk(CLK_OUT5), 
    .out(out)
    );


reg rrrr=1'b1;
always @(posedge out)
begin
	if (rrrr==1'b1)begin
		rst=1'b0;
		rd=1'b1;
		rrrr=1'b0;
	end
	else begin
		R=R+1;
		add=add+1;
	end
end



LED_Drive seven_segment (
    .i_data(s), 
    .clk(CLK_OUT5), 
    .o_data(o_data_seg), 
    .latch(latch_seg));



Decoder_BCD_Sevenseg Decoder_BCD_Sevenseg (
    .i_seg(sd), 
    .o_seg(sw)
    );
	 
	 
//seven segment abass
BtoD bcd (
    .bin(o_counter), 
    .s1(s1), 
    .s2(s2), 
    .s3(s3), 
    .s4(s4)
    );
	 

always @(sw)begin
s[14:8]=sw;
end


always @(posedge CLK_OUT5)begin

	if (cf==2'b00)begin
		sd = s1;
		s[5]=1'b0;
		s[4]=1'b0;
		s[1]=1'b1;
		s[2]=1'b0;
	end 

	else if (cf==2'b01)
	begin
	sd = s2;
	s[5]=1'b0;
	s[4]=1'b0;
	s[1]=1'b0;
	s[2]=1'b1;
	end

	else if (cf==2'b10)begin
		sd = s3;
		s[5]=1'b0;
		s[4]=1'b1;
		s[1]=1'b0;
		s[2]=1'b0;
	end

	else if (cf==2'b11)begin
		sd = s4;
		s[5]=1'b1;
		s[4]=1'b0;
		s[1]=1'b0;
		s[2]=1'b0;
	end

	if (Cout == 1'b1)begin
		s[3] = 1'b1;
	end


	if (cfw == 11'b11111111111)begin
		cf = cf+1'b1;
	end
	
	cfw = cfw + 1'b1;

end



FA_16bit FA_16bit (
    .m(m), 
    .n(n), 
    .ci(ci), 
    .sumt(sumt), 
    .couto(couto)
    );
	 
/*
CLA_8bit cla_8bit (
    .A(A), 
    .B(B), 
    .Cin(Cin), 
    .Sum(Sum), 
    .Cout(Cout)
    );*/



MULT_shift mult_shift (
    .b(b), 
    .q(q), 
    .clk(CLK_OUT5), 
    .final(final)
    );


MULT_array mult_array(
    .x(x), 
    .y(y), 
    .f(f)
    );


always @(o_data_DIP)begin
	x=o_data_DIP[7:0];
	y=o_data_DIP[15:8];
end



MULT_Booth mult_booth(
    .b(b), 
    .q(q), 
    .clk(CLK_OUT5), 
    .final_booth(final_booth)
    );



Divide8_4 divide8_4(
    .q(maghsoom), 
    .b(maghsoom_elaih), 
    .clk(CLK_OUT5), 
    .rem(rem), 
    .quo(quo)
    );
	 


sender send(
    .data_in(o_data_DIP), 
    .accept(accept), 
    .data_out(o_send), 
    .valid(valid)
    );
	 
	 
reciver reciver(
	 .data_in(o_send), 
	 .valid(valid), 
	 .data_out(data_out), 
	 .accept(accept)
	 );



Counter counter(
    .i_counter(out_reg10), 
    .o_counter(o_counter)
    );
	 

regester_10bit reg10 (
    .in(o_counter), 
    .clk(o_data_DIP[0]), 
    .out(out_reg10)
    );	 

RAM_20K ram20k (
    .in(20'd0), 
    .add(out_reg10), 
    .rd(1'b1), 
    .wr(1'b0), 
    .rst(1'b0), 
    .out(out_ram)
    );


regester_20bit reg20(
    .in(out_ram), 
    .clk(o_data_DIP[0]), 
    .out(out_reg20)
    );
	 
	 
ALU alu (
    .i_alu(out_reg20), 
    .o_alu(o_alu)
    );




endmodule
