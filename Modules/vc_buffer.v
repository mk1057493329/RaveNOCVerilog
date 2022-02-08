module vc_buffer (clk,arst,vc_id_i,vc_id_o,fdata_i,valid_i,ready_o,fdata_o,valid_o,ready_i);
	input clk;
	input arst;
	input [1:0] vc_id_i;
	output [1:0] vc_id_o;
	input [33:0] fdata_i;
	input valid_i;
	output ready_o;
	output [33:0] fdata_o;
	output valid_o;
	input ready_i;
	wire write_flit_vc_buffer,norres_vc_buffer_vc_buffer,full_vc_buffer,empty_vc_buffer,error_vc_buffer,read_flit_vc_buffer,locked_by_route_ff_vc_buffer,next_locked_vc_buffer,orres_vc_buffer,or1res_vc_buffer,or2res_vc_buffer,finres1_vc_buffer,andres1_vc_buffer,full_vc_buffer_not,locked_by_route_ff_vc_buffer_not,thirdand_vc_buffer,u1temp_fifomodule,u2temp_fifomodule,u4temp_fifomodule,full_vc_buffer_not_fifomodule,u7temp_fifomodule,u9temp_fifomodule,u10carry_fifomodule,u11carry_fifomodule,empty_vc_buffer_not_fifomodule,u13temp_fifomodule,u14temp_fifomodule,u15carry_fifomodule,u16carry_fifomodule,u17res_fifomodule,u18res_fifomodule,write_ptr_ff_fifomodule_0_not,write_ptr_ff_fifomodule_1_not,b0wire_fifomodule,b1wire_fifomodule,u23temp_fifomodule_not_fifomodule,u23temp_fifomodule,boutb_fifomodule,bouta_fifomodule,boutmain_fifomodule,arst_value_fifomodule;
	wire [33:0] flit;
	wire [15:0] fifo_ff_fifomodule;
	wire [1:0] write_ptr_ff_fifomodule,read_ptr_ff_fifomodule,next_write_ptr_fifomodule,next_read_ptr_fifomodule,fifo_ocup_fifomodule;


	BUFX1 U00 ( .A(read_ptr_ff_fifomodule[0]), .Y(next_read_ptr_fifomodule[0]) );
	BUFX1 U01 ( .A(read_ptr_ff_fifomodule[1]), .Y(next_read_ptr_fifomodule[1]) );
	BUFX1 U02 ( .A(write_ptr_ff_fifomodule[0]), .Y(next_write_ptr_fifomodule[0]) );
	BUFX1 U03 ( .A(write_ptr_ff_fifomodule[1]), .Y(next_write_ptr_fifomodule[1]) );

	XNOR2X1 U1 ( .IN1(write_ptr_ff_fifomodule[0]), .IN2(read_ptr_ff_fifomodule[0]), .Q(u1temp_fifomodule) );
	XNOR2X1 U2 ( .IN1(write_ptr_ff_fifomodule[1]), .IN2(read_ptr_ff_fifomodule[1]), .Q(u2temp_fifomodule) );
	AND2X1 U3 ( .A(u1temp_fifomodule), .B(u2temp_fifomodule), .Y(empty_vc_buffer) );
	XOR2X1 U4 ( .A(write_ptr_ff_fifomodule[1]), .B(read_ptr_ff_fifomodule[1]), .Y(u4temp_fifomodule) );
	AND2X1 U5 ( .A(u1temp_fifomodule), .B(u4temp_fifomodule), .Y(full_vc_buffer) );
	MUX21X1 U6 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8]), .IN2(1'b0), .S(empty_vc_buffer), .Q(fdata_o[0]));
	MUX21X1 U61 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+1]), .IN2(1'b0), .S(empty_vc_buffer), .Q(fdata_o[1]));
	MUX21X1 U62 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+2]), .IN2(1'b0), .S(empty_vc_buffer), .Q(fdata_o[2]));
	MUX21X1 U63 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+3]), .IN2(1'b0), .S(empty_vc_buffer), .Q(fdata_o[3]));
	MUX21X1 U64 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+4]), .IN2(1'b0), .S(empty_vc_buffer), .Q(fdata_o[4]));
	MUX21X1 U65 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+5]), .IN2(1'b0), .S(empty_vc_buffer), .Q(fdata_o[5]));
	MUX21X1 U66 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+6]), .IN2(1'b0), .S(empty_vc_buffer), .Q(fdata_o[6]));
	MUX21X1 U67 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+7]), .IN2(1'b0), .S(empty_vc_buffer), .Q(fdata_o[7]));

	INVX1 U7 ( .A(full_vc_buffer), .Y(full_vc_buffer_not_fifomodule) );
	AND2X1 U8 ( .A(write_flit_vc_buffer), .B(full_vc_buffer_not_fifomodule), .Y(u7temp_fifomodule) );
	MUX21X1 U9 (.IN1(1'b0), .IN2(1'b1), .S(u7temp_fifomodule), .Q(u9temp_fifomodule));
	HADDX1 U10 ( .A0(write_ptr_ff_fifomodule[0]), .B0(u9temp_fifomodule), .C1(u10carry_fifomodule), .SO(next_write_ptr_fifomodule[0]) );
	HADDX1 U11 ( .A0(u10carry_fifomodule), .B0(write_ptr_ff_fifomodule[1]), .C1(u11carry_fifomodule), .SO(next_write_ptr_fifomodule[1]) );

	INVX1 U12 ( .A(empty_vc_buffer), .Y(empty_vc_buffer_not_fifomodule) );
	AND2X1 U13 ( .A(read_flit_vc_buffer), .B(empty_vc_buffer_not_fifomodule), .Y(u13temp_fifomodule) );
	MUX21X1 U14 (.IN1(1'b0), .IN2(1'b1), .S(u13temp_fifomodule), .Q(u14temp_fifomodule));
	HADDX1 U15 ( .A0(read_ptr_ff_fifomodule[0]), .B0(u14temp_fifomodule), .C1(u15carry_fifomodule), .SO(next_read_ptr_fifomodule[0]) );
	HADDX1 U16 ( .A0(u15carry_fifomodule), .B0(read_ptr_ff_fifomodule[1]), .C1(u16carry_fifomodule), .SO(next_read_ptr_fifomodule[1]) );

	AND2X1 U17 ( .A(write_flit_vc_buffer), .B(full_vc_buffer), .Y(u17res_fifomodule) );
	AND2X1 U18 ( .A(read_flit_vc_buffer), .B(empty_vc_buffer), .Y(u18res_fifomodule) );
    OR2X1 U19 ( .A(u17res_fifomodule), .B(u18res_fifomodule), .Y(error_vc_buffer) );
	XOR2X1 U20 ( .A(write_ptr_ff_fifomodule[0]), .B(read_ptr_ff_fifomodule[0]), .Y(fifo_ocup_fifomodule[0]) );
	INVX1 U21 ( .A(write_ptr_ff_fifomodule[0]), .Y(write_ptr_ff_fifomodule_0_not) );
	AND2X1 U22 ( .A(write_ptr_ff_fifomodule_0_not), .B(read_ptr_ff_fifomodule[0]), .Y(b0wire_fifomodule) );
	XOR2X1 U23 ( .A(write_ptr_ff_fifomodule[1]), .B(read_ptr_ff_fifomodule[1]), .Y(u23temp_fifomodule) );
	INVX1 U24 ( .A(write_ptr_ff_fifomodule[1]), .Y(write_ptr_ff_fifomodule_1_not) );
	AND2X1 U25 ( .A(read_ptr_ff_fifomodule[1]), .B(write_ptr_ff_fifomodule_1_not), .Y(boutb_fifomodule) );
	XOR2X1 U24 ( .A(u23temp_fifomodule), .B(b0wire_fifomodule), .Y(fifo_ocup_fifomodule[1]) );
	INVX1 U25 ( .A(u23temp_fifomodule), .Y(u23temp_fifomodule_not_fifomodule) );
	AND2X1 U26 ( .A(b0wire_fifomodule), .B(u23temp_fifomodule_not_fifomodule), .Y(bouta_fifomodule) );
	OR2X1 U27 ( .A(bouta_fifomodule), .B(boutb_fifomodule), .Y(boutmain_fifomodule) );
	DFFX2 U28 ( .CLK(clk), .D(fifo_ocup_fifomodule[0]), .Q(ocup_o[0]) );
	DFFX2 U29 ( .CLK(clk), .D(fifo_ocup_fifomodule[1]), .Q(ocup_o[1]) );
	DFFX2 U30 ( .CLK(clk), .D(arst), .Q(arst_value_fifomodule) );
	DFFX2 U31 ( .CLK(arst), .D(arst), .Q(arst_value_fifomodule) );
	DFFX2 U32 ( .CLK(arst_value_fifomodule), .D(1'b0), .Q(write_ptr_ff_fifomodule[0]) );
	DFFX2 U33 ( .CLK(arst_value_fifomodule), .D(1'b0), .Q(read_ptr_ff_fifomodule[0]) );
	DFFX2 U34 ( .CLK(arst_value_fifomodule), .D(1'b0), .Q(fifo_ff_fifomodule[0]) );
	DFFX2 U35 ( .CLK(arst_value_fifomodule), .D(1'b0), .Q(write_ptr_ff_fifomodule[1]) );
	DFFX2 U36 ( .CLK(arst_value_fifomodule), .D(1'b0), .Q(read_ptr_ff_fifomodule[1]) );
	DFFX2 U37 ( .CLK(arst_value_fifomodule), .D(1'b0), .Q(fifo_ff_fifomodule[1]) );

	DFFX2 U38 ( .CLK(clk), .D(next_write_ptr_fifomodule[0]), .Q(write_ptr_ff_fifomodule[0]) );
	DFFX2 U39 ( .CLK(clk), .D(next_write_ptr_fifomodule[1]), .Q(write_ptr_ff_fifomodule[1]) );
	DFFX2 U40 ( .CLK(clk), .D(next_read_ptr_fifomodule[0]), .Q(read_ptr_ff_fifomodule[0]) );
	DFFX2 U41 ( .CLK(clk), .D(next_read_ptr_fifomodule[1]), .Q(read_ptr_ff_fifomodule[1]) );
	  

	DFFX2 U42 ( .CLK(u7temp_fifomodule), .D(fdata_i[0]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8]) );
	DFFX2 U43 ( .CLK(u7temp_fifomodule), .D(fdata_i[1]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+1]) );
	DFFX2 U44 ( .CLK(u7temp_fifomodule), .D(fdata_i[2]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+2]) );
	DFFX2 U45 ( .CLK(u7temp_fifomodule), .D(fdata_i[3]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+3]) );
	DFFX2 U46 ( .CLK(u7temp_fifomodule), .D(fdata_i[4]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+4]) );
	DFFX2 U47 ( .CLK(u7temp_fifomodule), .D(fdata_i[5]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+5]) );
	DFFX2 U48 ( .CLK(u7temp_fifomodule), .D(fdata_i[6]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+6]) );
	DFFX2 U49 ( .CLK(u7temp_fifomodule), .D(fdata_i[7]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+7]) );

    BUFX1 U00 ( .A(locked_by_route_ff_vc_buffer), .Y(next_locked_vc_buffer) );
    BUFX1 U0(.A(flit[0]), .Y(fdata_i[0]))
	BUFX1 U1(.A(flit[1]), .Y(fdata_i[1]))
	BUFX1 U2(.A(flit[2]), .Y(fdata_i[2]))
	BUFX1 U3(.A(flit[3]), .Y(fdata_i[3]))
	BUFX1 U4(.A(flit[4]), .Y(fdata_i[4]))
	BUFX1 U5(.A(flit[5]), .Y(fdata_i[5]))
	BUFX1 U6(.A(flit[6]), .Y(fdata_i[6]))
	BUFX1 U7(.A(flit[7]), .Y(fdata_i[7]))
	BUFX1 U8(.A(flit[8]), .Y(fdata_i[8]))
	BUFX1 U9(.A(flit[9]), .Y(fdata_i[9]))
	BUFX1 U10(.A(flit[10]), .Y(fdata_i[10]))
	BUFX1 U11(.A(flit[11]), .Y(fdata_i[11]))
	BUFX1 U12(.A(flit[12]), .Y(fdata_i[12]))
	BUFX1 U13(.A(flit[13]), .Y(fdata_i[13]))
	BUFX1 U14(.A(flit[14]), .Y(fdata_i[14]))
	BUFX1 U15(.A(flit[15]), .Y(fdata_i[15]))
	BUFX1 U16(.A(flit[16]), .Y(fdata_i[16]))
	BUFX1 U17(.A(flit[17]), .Y(fdata_i[17]))
	BUFX1 U18(.A(flit[18]), .Y(fdata_i[18]))
	BUFX1 U19(.A(flit[19]), .Y(fdata_i[19]))
	BUFX1 U20(.A(flit[20]), .Y(fdata_i[20]))
	BUFX1 U21(.A(flit[21]), .Y(fdata_i[21]))
	BUFX1 U22(.A(flit[22]), .Y(fdata_i[22]))
	BUFX1 U23(.A(flit[23]), .Y(fdata_i[23]))
	BUFX1 U24(.A(flit[24]), .Y(fdata_i[24]))
	BUFX1 U25(.A(flit[25]), .Y(fdata_i[25]))
	BUFX1 U26(.A(flit[26]), .Y(fdata_i[26]))
	BUFX1 U27(.A(flit[27]), .Y(fdata_i[27]))
	BUFX1 U28(.A(flit[28]), .Y(fdata_i[28]))
	BUFX1 U29(.A(flit[29]), .Y(fdata_i[29]))
	BUFX1 U30(.A(flit[30]), .Y(fdata_i[30]))
	BUFX1 U31(.A(flit[31]), .Y(fdata_i[31]))
	BUFX1 U32(.A(flit[32]), .Y(fdata_i[32]))
	BUFX1 U33(.A(flit[33]), .Y(fdata_i[33]))
    NOR2X1 U34 ( .IN1(flit[33]), .IN2(flit[32]), .QN(norres_vc_buffer_vc_buffer) );
    OR4X1 U35 ( .IN1(flit[29]), .IN2(flit[28]), .IN3(flit[27]), .IN4(flit[26]), .Y(or1res_vc_buffer) );
    OR4X1 U35 ( .IN1(flit[25]), .IN2(flit[24]), .IN3(flit[23]), .IN4(flit[22]), .Y(or2res_vc_buffer) );
    OR2X1 U36 ( .A(or1res_vc_buffer), .B(or2res_vc_buffer), .Y(orres_vc_buffer) );
    AND3X1 U37 ( .IN1(valid_i), .IN2(norres_vc_buffer_vc_buffer), .IN3(orres_vc_buffer), .Q(finres1_vc_buffer) );
    MUX21X1 U38 (.IN1(next_locked_vc_buffer), .IN2(1'b1), .S(finres1_vc_buffer), .Q(next_locked_vc_buffer);
    AND3X1 U39 ( .IN1(valid_i), .IN2(flit[33]), .IN3(flit[32]), .Q(andres1_vc_buffer) );
    MUX21X1 U40 (.IN1(next_locked_vc_buffer), .IN2(1'b0), .S(andres1_vc_buffer), .Q(next_locked_vc_buffer);

    INVX1 U41 ( .A(full_vc_buffer), .Y(full_vc_buffer_not) );
    INVX1 U42 ( .A(locked_by_route_ff_vc_buffer), .Y(locked_by_route_ff_vc_buffer_not) );

    MUX21X1 U43 (.IN1(1'b1), .IN2(locked_by_route_ff_vc_buffer_not), .S(norres_vc_buffer_vc_buffer), .Q(thirdand_vc_buffer);
    AND3X1 U44 ( .IN1(valid_i), .IN2(full_vc_buffer_not), .IN3(thirdand_vc_buffer), .Q(write_flit_vc_buffer) );
    AND2X1 U45 ( .IN1(full_vc_buffer_not), .IN2(norres_vc_buffer_vc_buffer), .Q(ready_o) );
    INVX1 U46 ( .A(empty_vc_buffer), .Y(valid_o) );
    AND2X1 U47 ( .IN1(valid_o), .IN2(ready_i), .Q(read_flit_vc_buffer) );
	BUFX1 U48(.A(vc_id_o), .Y(vc_id_i))

	DFFX2 U49 ( .CLK(clk), .D(arst), .Q(arst_value) );
    DFFX2 U50 ( .CLK(arst), .D(arst), .Q(arst_value) );
    MUX21X1 U51 (.IN1(next_locked_vc_buffer), .IN2(1'sb0), .S(arst_value), .Q(locked_by_route_ff_vc_buffer);

endmodule
